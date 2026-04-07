import {
  Card,
  CardContent,
  CardMedia,
  Typography,
  Box,
  Chip,
  Checkbox,
  alpha,
} from '@mui/material';
import MemoryIcon from '@mui/icons-material/Memory';
import DeveloperBoardIcon from '@mui/icons-material/DeveloperBoard';
import SportsEsportsIcon from '@mui/icons-material/SportsEsports';
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
}: ComputerCardProps): JSX.Element {
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
          sx={{ position: 'absolute', top: 4, right: 4, zIndex: 1, color: 'secondary.main', '&.Mui-checked': { color: 'secondary.main' } }}
        />
      )}

      <Box sx={{ position: 'relative' }}>
        <CardMedia
          component="img"
          height="180"
          image={computer.imageUrl || 'https://placehold.co/400x300/2D1B4E/D4AF37?text=%F0%9F%91%91'}
          alt={computer.name}
          sx={{ objectFit: 'cover', bgcolor: 'background.default' }}
        />
        {computer.isNew && (
          <Box
            sx={{
              position: 'absolute',
              top: 8,
              left: 8,
              width: 60,
              height: 60,
              bgcolor: 'success.main',
              clipPath:
                'polygon(50% 0%, 61% 35%, 98% 35%, 68% 57%, 79% 91%, 50% 70%, 21% 91%, 32% 57%, 2% 35%, 39% 35%)',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              boxShadow: (theme) => `0 2px 8px ${alpha(theme.palette.common.black, 0.3)}`,
            }}
          >
            <Typography
              sx={{
                color: '#fff',
                fontWeight: 700,
                fontSize: '0.75rem',
                lineHeight: 1,
                letterSpacing: '0.05em',
              }}
            >
              NEW
            </Typography>
          </Box>
        )}
      </Box>

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
              {formatRam(computer.ramAmountMB)} RAM
            </Typography>
          </Box>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 0.5 }}>
            <DeveloperBoardIcon fontSize="small" color="action" />
            <Typography variant="body2" color="text.secondary" noWrap>
              {computer.processorName}
            </Typography>
          </Box>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 0.5 }}>
            <SportsEsportsIcon fontSize="small" color="action" />
            <Typography variant="body2" color="text.secondary" noWrap>
              {computer.gpuName}
            </Typography>
          </Box>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 0.5 }}>
            <StorageIcon fontSize="small" color="action" />
            <Typography variant="body2" color="text.secondary">
              {totalStorageGB >= 1000
                ? `${(totalStorageGB / 1000).toFixed(1)} TB`
                : `${totalStorageGB} GB`}{' '}
              Storage
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
