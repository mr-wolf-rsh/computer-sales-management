import { useNavigate } from 'react-router-dom';
import {
  Box,
  Button,
  Typography,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Alert,
  Chip,
} from '@mui/material';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import { useAppSelector } from '@/app/hooks';
import { useGetComputerQuery } from '../computers/api/computersApi';
import { getTierInfo } from '../computers/utils/tierBadge';
import {
  formatPrice,
  formatRam,
  formatStorage,
  formatWeight,
} from '../shared/utils/formatters';
import LoadingSpinner from '../shared/components/LoadingSpinner';
import type { Computer } from '../computers/types/computer.types';

function ComputerFetcher({
  id,
  onData,
}: {
  id: number;
  onData: (computer: Computer) => void;
}) {
  const { data, isLoading } = useGetComputerQuery(id);
  if (data && !isLoading) {
    onData(data);
  }
  return isLoading ? <LoadingSpinner /> : null;
}

export default function CompareView() {
  const navigate = useNavigate();
  const selectedIds = useAppSelector((s) => s.computers.selectedIds);

  const queries = selectedIds.map((id) => ({
    id,
    // eslint-disable-next-line react-hooks/rules-of-hooks
    ...useGetComputerQuery(id),
  }));

  const isLoading = queries.some((q) => q.isLoading);
  const computers = queries
    .filter((q) => q.data)
    .map((q) => q.data as Computer);

  if (selectedIds.length < 2) {
    return (
      <Box>
        <Button
          startIcon={<ArrowBackIcon />}
          onClick={() => navigate('/')}
          sx={{ mb: 2 }}
        >
          Back to Catalog
        </Button>
        <Alert severity="info">
          Select at least 2 computers from the catalog to compare.
        </Alert>
      </Box>
    );
  }

  if (isLoading) return <LoadingSpinner />;

  const bestPrice = Math.min(...computers.map((c) => c.price));
  const bestRam = Math.max(...computers.map((c) => c.ramAmountMB));
  const bestPsu = Math.max(...computers.map((c) => c.psuWattage));

  const goldSx = {
    color: 'secondary.main',
    fontWeight: 700,
  };

  const rows: { label: string; getValue: (c: Computer) => string; isBest?: (c: Computer) => boolean }[] = [
    {
      label: 'Tier',
      getValue: (c) => {
        const t = getTierInfo(c.tierBadge);
        return `${t.icon} ${t.label}`;
      },
    },
    {
      label: 'Price',
      getValue: (c) => formatPrice(c.price),
      isBest: (c) => c.price === bestPrice,
    },
    {
      label: 'RAM',
      getValue: (c) => formatRam(c.ramAmountMB),
      isBest: (c) => c.ramAmountMB === bestRam,
    },
    {
      label: 'Processor',
      getValue: (c) => `${c.processorBrand} ${c.processorName}`,
    },
    {
      label: 'GPU',
      getValue: (c) => `${c.gpuBrand} ${c.gpuName}`,
    },
    {
      label: 'Storage',
      getValue: (c) =>
        c.storageDrives
          .map((d) => `${formatStorage(d.capacityGB)} ${d.type}`)
          .join(', ') || 'None',
    },
    {
      label: 'USB Ports',
      getValue: (c) =>
        c.usbPorts.map((p) => `${p.count}x ${p.usbType}`).join(', ') || 'None',
    },
    {
      label: 'PSU',
      getValue: (c) => `${c.psuWattage}W`,
      isBest: (c) => c.psuWattage === bestPsu,
    },
    {
      label: 'Weight',
      getValue: (c) => formatWeight(c.weight, c.weightUnit),
    },
  ];

  return (
    <Box>
      <Button
        startIcon={<ArrowBackIcon />}
        onClick={() => navigate('/')}
        sx={{ mb: 2 }}
      >
        Back to Catalog
      </Button>

      <Typography variant="h4" component="h1" sx={{ mb: 3 }}>
        Royal Comparison
      </Typography>

      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell sx={{ fontWeight: 700, minWidth: 120 }}>Spec</TableCell>
              {computers.map((c) => (
                <TableCell key={c.id} align="center" sx={{ fontWeight: 700 }}>
                  <Box>
                    <Typography variant="subtitle1" fontWeight={700}>
                      {c.name}
                    </Typography>
                    <Chip
                      label={getTierInfo(c.tierBadge).label}
                      size="small"
                      sx={{
                        bgcolor: getTierInfo(c.tierBadge).color,
                        color: '#fff',
                        mt: 0.5,
                      }}
                    />
                  </Box>
                </TableCell>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => (
              <TableRow key={row.label}>
                <TableCell sx={{ fontWeight: 600 }}>{row.label}</TableCell>
                {computers.map((c) => (
                  <TableCell
                    key={c.id}
                    align="center"
                    sx={row.isBest?.(c) ? goldSx : undefined}
                  >
                    {row.getValue(c)}
                  </TableCell>
                ))}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </Box>
  );
}
