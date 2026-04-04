import {
  Card,
  CardContent,
  CardMedia,
  Typography,
  Box,
  Chip,
  Checkbox,
} from '@mui/material';
import MemoryIcon from '@mui/icons-material/Memory';
import StorageIcon from '@mui/icons-material/Storage';
import { useNavigate } from 'react-router-dom';
import type { Computer } from '../types/computer.types';
import { getTierInfo } from '../utils/tierBadge';
import { formatPrice, formatRam } from '@/features/shared/utils/formatters';

interface ComputerCardProps {
  computer: Computer;
  selected?: boolean;
  onToggleSelect?: (id: number) => void;
}

export default function ComputerCard({
  computer,
  selected = false,
  onToggleSelect,
}: ComputerCardProps) {
  const navigate = useNavigate();
  const tier = getTierInfo(computer.tierBadge);

  const totalStorageGB = computer.storageDrives.reduce(
    (sum, d) => sum + d.capacityGB,
    0,
  );

  return (
    <Card
      sx={{
        cursor: 'pointer',
        position: 'relative',
        transition: 'transform 0.2s ease, box-shadow 0.2s ease',
        '&:hover': {
          transform: 'scale(1.02)',
        },
      }}
      onClick={() => navigate(`/computers/${computer.id}`)}
    >
      {onToggleSelect && (
        <Checkbox
          checked={selected}
          onChange={(e) => {
            e.stopPropagation();
            onToggleSelect(computer.id);
          }}
          onClick={(e) => e.stopPropagation()}
          sx={{ position: 'absolute', top: 4, right: 4, zIndex: 1 }}
        />
      )}

      <CardMedia
        component="img"
        height="180"
        image={computer.imageUrl || 'https://placehold.co/400x300/2D1B4E/D4AF37?text=%F0%9F%91%91'}
        alt={computer.name}
        sx={{ objectFit: 'cover', bgcolor: 'background.default' }}
      />

      <CardContent>
        <Box
          sx={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
            mb: 1,
          }}
        >
          <Typography variant="h6" noWrap sx={{ flex: 1, mr: 1 }}>
            {computer.name}
          </Typography>
          <Chip
            label={`${tier.icon} ${tier.label}`}
            size="small"
            sx={{
              bgcolor: tier.color,
              color: '#fff',
              fontWeight: 600,
              fontSize: '0.7rem',
            }}
          />
        </Box>

        <Box sx={{ display: 'flex', flexDirection: 'column', gap: 0.5, mb: 1.5 }}>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 0.5 }}>
            <MemoryIcon fontSize="small" color="action" />
            <Typography variant="body2" color="text.secondary">
              {formatRam(computer.ramAmountMB)} &bull; {computer.processorBrand}{' '}
              {computer.processorName}
            </Typography>
          </Box>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 0.5 }}>
            <StorageIcon fontSize="small" color="action" />
            <Typography variant="body2" color="text.secondary">
              {totalStorageGB >= 1000
                ? `${(totalStorageGB / 1000).toFixed(1)} TB`
                : `${totalStorageGB} GB`}{' '}
              &bull; {computer.gpuBrand} {computer.gpuName}
            </Typography>
          </Box>
        </Box>

        <Typography
          variant="h5"
          sx={{
            color: 'secondary.main',
            fontWeight: 700,
            fontFamily: '"Playfair Display", serif',
          }}
        >
          {formatPrice(computer.price)}
        </Typography>
      </CardContent>
    </Card>
  );
}
