import {
  Box,
  Button,
  Card,
  CardContent,
  Grid,
  Typography,
  Alert,
} from '@mui/material';
import ComputerIcon from '@mui/icons-material/Computer';
import AttachMoneyIcon from '@mui/icons-material/AttachMoney';
import MemoryIcon from '@mui/icons-material/Memory';
import TrendingUpIcon from '@mui/icons-material/TrendingUp';
import FileDownloadIcon from '@mui/icons-material/FileDownload';
import {
  PieChart,
  Pie,
  Cell,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from 'recharts';
import { useGetDashboardQuery, useGetComputersQuery } from '../computers/api/computersApi';
import { exportComputersToCSV } from '../computers/utils/csvExport';
import { formatPrice, formatRam } from '../shared/utils/formatters';
import LoadingSpinner from '../shared/components/LoadingSpinner';

const PIE_COLORS = [
  '#D4AF37',
  '#2D1B4E',
  '#9B59B6',
  '#4169E1',
  '#CD7F32',
  '#E74C3C',
  '#27AE60',
  '#F39C12',
];

export default function Dashboard() {
  const { data: stats, isLoading, isError } = useGetDashboardQuery();
  const { data: allComputers } = useGetComputersQuery({ page: 1, size: 9999 });

  if (isLoading) return <LoadingSpinner />;
  if (isError || !stats) {
    return <Alert severity="error">Failed to load dashboard data.</Alert>;
  }

  const storagePieData = Object.entries(stats.storageDistribution).map(
    ([name, value]) => ({ name, value }),
  );

  const gpuBarData = Object.entries(stats.gpuBrandDistribution).map(
    ([name, value]) => ({ name, count: value }),
  );

  return (
    <Box>
      <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', mb: 3 }}>
        <Typography variant="h4" component="h1">
          Royal Dashboard
        </Typography>
        <Button
          variant="outlined"
          color="secondary"
          startIcon={<FileDownloadIcon />}
          disabled={!allComputers?.items?.length}
          onClick={() => exportComputersToCSV(allComputers?.items ?? [])}
        >
          Export to CSV
        </Button>
      </Box>

      {/* Summary Cards */}
      <Grid container spacing={3} sx={{ mb: 4 }}>
        <Grid item xs={12} sm={6} md={3}>
          <SummaryCard
            icon={<ComputerIcon />}
            label="Total Computers"
            value={String(stats.totalComputers)}
            color="#2D1B4E"
          />
        </Grid>
        <Grid item xs={12} sm={6} md={3}>
          <SummaryCard
            icon={<AttachMoneyIcon />}
            label="Average Price"
            value={formatPrice(stats.avgPrice)}
            color="#D4AF37"
          />
        </Grid>
        <Grid item xs={12} sm={6} md={3}>
          <SummaryCard
            icon={<MemoryIcon />}
            label="Average RAM"
            value={formatRam(stats.avgRam)}
            color="#9B59B6"
          />
        </Grid>
        <Grid item xs={12} sm={6} md={3}>
          <SummaryCard
            icon={<TrendingUpIcon />}
            label="Price Range"
            value={`${formatPrice(stats.minPrice)} - ${formatPrice(stats.maxPrice)}`}
            color="#4169E1"
          />
        </Grid>
      </Grid>

      {/* Charts */}
      <Grid container spacing={3}>
        <Grid item xs={12} md={6}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Storage Type Distribution
              </Typography>
              {storagePieData.length > 0 ? (
                <ResponsiveContainer width="100%" height={300}>
                  <PieChart>
                    <Pie
                      data={storagePieData}
                      cx="50%"
                      cy="50%"
                      labelLine
                      label={({ name, percent }) =>
                        `${name} (${(percent * 100).toFixed(0)}%)`
                      }
                      outerRadius={100}
                      dataKey="value"
                    >
                      {storagePieData.map((_, index) => (
                        <Cell
                          key={`cell-${index}`}
                          fill={PIE_COLORS[index % PIE_COLORS.length]}
                        />
                      ))}
                    </Pie>
                    <Tooltip />
                    <Legend />
                  </PieChart>
                </ResponsiveContainer>
              ) : (
                <Typography color="text.secondary" sx={{ py: 4, textAlign: 'center' }}>
                  No storage data available.
                </Typography>
              )}
            </CardContent>
          </Card>
        </Grid>

        <Grid item xs={12} md={6}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                GPU Brand Distribution
              </Typography>
              {gpuBarData.length > 0 ? (
                <ResponsiveContainer width="100%" height={300}>
                  <BarChart data={gpuBarData}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="name" />
                    <YAxis allowDecimals={false} />
                    <Tooltip />
                    <Legend />
                    <Bar
                      dataKey="count"
                      name="Computers"
                      fill="#D4AF37"
                      radius={[4, 4, 0, 0]}
                    />
                  </BarChart>
                </ResponsiveContainer>
              ) : (
                <Typography color="text.secondary" sx={{ py: 4, textAlign: 'center' }}>
                  No GPU data available.
                </Typography>
              )}
            </CardContent>
          </Card>
        </Grid>
      </Grid>
    </Box>
  );
}

function SummaryCard({
  icon,
  label,
  value,
  color,
}: {
  icon: React.ReactNode;
  label: string;
  value: string;
  color: string;
}) {
  return (
    <Card>
      <CardContent>
        <Box sx={{ display: 'flex', alignItems: 'center', gap: 1.5 }}>
          <Box
            sx={{
              p: 1,
              borderRadius: 2,
              bgcolor: `${color}20`,
              color: color,
              display: 'flex',
            }}
          >
            {icon}
          </Box>
          <Box>
            <Typography variant="body2" color="text.secondary">
              {label}
            </Typography>
            <Typography variant="h6" fontWeight={700} noWrap>
              {value}
            </Typography>
          </Box>
        </Box>
      </CardContent>
    </Card>
  );
}
