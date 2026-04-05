import { useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  Typography,
  Button,
  Grid,
  Card,
  CardContent,
  Chip,
  Divider,
  Alert,
  List,
  ListItem,
  ListItemText,
  ListItemIcon,
} from '@mui/material';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import EditIcon from '@mui/icons-material/Edit';
import DeleteIcon from '@mui/icons-material/Delete';
import MemoryIcon from '@mui/icons-material/Memory';
import StorageIcon from '@mui/icons-material/Storage';
import UsbIcon from '@mui/icons-material/Usb';
import BoltIcon from '@mui/icons-material/Bolt';
import ScaleIcon from '@mui/icons-material/Scale';
import {
  useGetComputerQuery,
  useDeleteComputerMutation,
} from '../api/computersApi';
import { getTierInfo } from '../utils/tierBadge';
import {
  formatPrice,
  formatRam,
  formatStorage,
  formatWeight,
} from '@/features/shared/utils/formatters';
import ConfirmDialog from '@/features/shared/components/ConfirmDialog';
import LoadingSpinner from '@/features/shared/components/LoadingSpinner';

export default function ComputerDetail() {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const [showDelete, setShowDelete] = useState(false);

  const { data: computer, isLoading, isError } = useGetComputerQuery(Number(id));
  const [deleteComputer, { isLoading: isDeleting }] = useDeleteComputerMutation();

  if (isLoading) return <LoadingSpinner />;
  if (isError || !computer) {
    return <Alert severity="error">Computer not found in the royal catalog.</Alert>;
  }

  const tier = getTierInfo(computer.tierBadge);

  const handleDelete = async () => {
    try {
      await deleteComputer(computer.id).unwrap();
      navigate('/');
    } catch {
      // Error handled by RTK Query
    }
  };

  return (
    <Box>
      <Button
        startIcon={<ArrowBackIcon />}
        onClick={() => navigate('/')}
        sx={{ mb: 2 }}
      >
        Back to Catalog
      </Button>

      <Grid container spacing={4}>
        {/* Image */}
        <Grid item xs={12} md={5}>
          <Box
            component="img"
            src={
              computer.imageUrl ||
              'https://placehold.co/600x400/2D1B4E/D4AF37?text=%F0%9F%91%91'
            }
            alt={computer.name}
            sx={{
              width: '100%',
              borderRadius: 3,
              border: '2px solid',
              borderColor: 'secondary.main',
              objectFit: 'cover',
              maxHeight: 400,
            }}
          />
        </Grid>

        {/* Main Info */}
        <Grid item xs={12} md={7}>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 2, mb: 2 }}>
            <Typography variant="h3" component="h1">
              {computer.name}
            </Typography>
            <Chip
              label={`${tier.icon} ${tier.label}`}
              sx={{
                bgcolor: tier.color,
                color: '#fff',
                fontWeight: 700,
                fontSize: '0.9rem',
                px: 1,
              }}
            />
          </Box>

          <Typography
            variant="h2"
            sx={{
              color: 'secondary.main',
              fontWeight: 800,
              mb: 3,
            }}
          >
            {formatPrice(computer.price)}
          </Typography>

          <Grid container spacing={2}>
            <Grid item xs={6}>
              <SpecCard
                icon={<MemoryIcon />}
                label="Processor"
                value={`${computer.processorBrand} ${computer.processorName}`}
              />
            </Grid>
            <Grid item xs={6}>
              <SpecCard
                icon={<MemoryIcon />}
                label="GPU"
                value={`${computer.gpuBrand} ${computer.gpuName}`}
              />
            </Grid>
            <Grid item xs={6}>
              <SpecCard
                icon={<MemoryIcon />}
                label="RAM"
                value={formatRam(computer.ramAmountMB)}
              />
            </Grid>
            <Grid item xs={6}>
              <SpecCard
                icon={<BoltIcon />}
                label="PSU"
                value={`${computer.psuWattage}W`}
              />
            </Grid>
            <Grid item xs={6}>
              <SpecCard
                icon={<ScaleIcon />}
                label="Weight"
                value={formatWeight(computer.weight, computer.weightUnit)}
              />
            </Grid>
          </Grid>

          <Box sx={{ display: 'flex', gap: 2, mt: 3 }}>
            <Button
              variant="contained"
              startIcon={<EditIcon />}
              onClick={() => navigate(`/computers/${computer.id}/edit`)}
            >
              Edit
            </Button>
            <Button
              variant="outlined"
              color="error"
              startIcon={<DeleteIcon />}
              onClick={() => setShowDelete(true)}
            >
              Delete
            </Button>
          </Box>
        </Grid>

        {/* Storage Drives */}
        <Grid item xs={12} md={6}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                <StorageIcon sx={{ verticalAlign: 'middle', mr: 1 }} />
                Storage Drives
              </Typography>
              <Divider sx={{ mb: 1 }} />
              <List dense>
                {computer.storageDrives.map((drive) => (
                  <ListItem key={drive.id}>
                    <ListItemIcon>
                      <StorageIcon />
                    </ListItemIcon>
                    <ListItemText
                      primary={`${formatStorage(drive.capacityGB)} ${drive.type}`}
                    />
                  </ListItem>
                ))}
                {computer.storageDrives.length === 0 && (
                  <ListItem>
                    <ListItemText
                      primary="No storage drives"
                      sx={{ color: 'text.secondary' }}
                    />
                  </ListItem>
                )}
              </List>
            </CardContent>
          </Card>
        </Grid>

        {/* USB Ports */}
        <Grid item xs={12} md={6}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                <UsbIcon sx={{ verticalAlign: 'middle', mr: 1 }} />
                USB Ports
              </Typography>
              <Divider sx={{ mb: 1 }} />
              <List dense>
                {computer.usbPorts.map((port) => (
                  <ListItem key={port.id}>
                    <ListItemIcon>
                      <UsbIcon />
                    </ListItemIcon>
                    <ListItemText
                      primary={`${port.count}x ${port.usbType}`}
                    />
                  </ListItem>
                ))}
                {computer.usbPorts.length === 0 && (
                  <ListItem>
                    <ListItemText
                      primary="No USB ports"
                      sx={{ color: 'text.secondary' }}
                    />
                  </ListItem>
                )}
              </List>
            </CardContent>
          </Card>
        </Grid>
      </Grid>

      <ConfirmDialog
        open={showDelete}
        title="Banish This Computer?"
        message={`Are you sure you want to remove "${computer.name}" from the royal catalog? This action cannot be undone.`}
        confirmLabel="Banish"
        isLoading={isDeleting}
        onConfirm={handleDelete}
        onCancel={() => setShowDelete(false)}
      />
    </Box>
  );
}

function SpecCard({
  icon,
  label,
  value,
}: {
  icon: React.ReactNode;
  label: string;
  value: string;
}) {
  return (
    <Card variant="outlined" sx={{ borderColor: 'secondary.main', borderWidth: 1 }}>
      <CardContent sx={{ py: 1.5, '&:last-child': { pb: 1.5 } }}>
        <Box sx={{ display: 'flex', alignItems: 'center', gap: 1, mb: 0.5 }}>
          {icon}
          <Typography variant="caption" color="text.secondary">
            {label}
          </Typography>
        </Box>
        <Typography variant="body1" fontWeight={600}>
          {value}
        </Typography>
      </CardContent>
    </Card>
  );
}
