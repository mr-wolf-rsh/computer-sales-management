import { useCallback, useRef } from 'react';
import {
  Box,
  Button,
  Fab,
  Grid,
  MenuItem,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  TableSortLabel,
  TextField,
  ToggleButton,
  ToggleButtonGroup,
  Typography,
  Chip,
  Checkbox,
  Alert,
} from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import ViewModuleIcon from '@mui/icons-material/ViewModule';
import ViewListIcon from '@mui/icons-material/ViewList';
import CompareArrowsIcon from '@mui/icons-material/CompareArrows';
import StarIcon from '@mui/icons-material/Star';
import { useNavigate } from 'react-router-dom';
import { useAppDispatch, useAppSelector } from '@/app/hooks';
import {
  setViewMode,
  toggleSelected,
  clearSelected,
} from '../computersSlice';
import {
  useGetComputersQuery,
  useSearchComputersQuery,
} from '../api/computersApi';
import { useComputerFilters } from '../hooks/useComputerFilters';
import { useKeyboardShortcuts } from '../hooks/useKeyboardShortcuts';
import { getTierInfo } from '../utils/tierBadge';
import { formatPrice, formatRam } from '@/features/shared/utils/formatters';
import SearchBar from './SearchBar';
import ComputerCard from './ComputerCard';
import Pagination from '@/features/shared/components/Pagination';
import LoadingSpinner from '@/features/shared/components/LoadingSpinner';

export default function ComputerList() {
  const navigate = useNavigate();
  const dispatch = useAppDispatch();
  const { viewMode, selectedIds } = useAppSelector((s) => s.computers);
  const searchRef = useRef<HTMLInputElement>(null);

  const {
    page,
    pageSize,
    searchTerm,
    debouncedSearch,
    sortBy,
    sortOrder,
    tierFilter,
    setPage,
    setPageSize,
    setSearchTerm,
    setSortBy,
    toggleSortOrder,
    setTierFilter,
  } = useComputerFilters();

  const isSearching = debouncedSearch.length > 0;

  const listQuery = useGetComputersQuery(
    { page, size: pageSize, sortBy, sortOrder },
    { skip: isSearching },
  );

  const searchQuery = useSearchComputersQuery(
    { q: debouncedSearch, page, size: pageSize, sortBy, sortOrder },
    { skip: !isSearching },
  );

  const { data, isLoading, isError, error } = isSearching
    ? searchQuery
    : listQuery;

  const computers = data?.items ?? [];
  const filteredComputers = tierFilter
    ? computers.filter((c) => c.tierBadge === tierFilter)
    : computers;
  const totalPages = data?.totalPages ?? 0;

  const handleSort = useCallback(
    (field: string) => {
      if (sortBy === field) {
        toggleSortOrder();
      } else {
        setSortBy(field);
      }
    },
    [sortBy, setSortBy, toggleSortOrder],
  );

  useKeyboardShortcuts({
    onSearch: () => searchRef.current?.focus(),
    onNew: () => navigate('/computers/new'),
    onEscape: () => {
      setSearchTerm('');
      dispatch(clearSelected());
    },
  });

  if (isError) {
    const errMsg =
      error && 'status' in error
        ? `Error ${error.status}`
        : 'Failed to load computers';
    return <Alert severity="error">{errMsg}</Alert>;
  }

  return (
    <Box>
      {/* Row 1: Title */}
      <Typography variant="h4" component="h1" sx={{ mb: 2 }}>
        Royal Catalog
      </Typography>

      {/* Row 2: Toolbar */}
      <Box
        sx={{
          display: 'flex',
          alignItems: 'center',
          flexWrap: 'wrap',
          gap: 2,
          mb: 3,
        }}
      >
        {/* Left: Search + Tier Filter + Compare */}
        <Box
          sx={{
            flex: 1,
            display: 'flex',
            alignItems: 'center',
            gap: 1,
            flexWrap: 'wrap',
          }}
        >
          <SearchBar value={searchTerm} onChange={setSearchTerm} />

          <TextField
            select
            size="small"
            value={tierFilter}
            onChange={(e) => setTierFilter(e.target.value)}
            label="Tier"
            sx={{
              minWidth: 140,
              '& .MuiOutlinedInput-root': {
                '& fieldset': {
                  borderColor: 'secondary.main',
                },
                '&:hover fieldset': {
                  borderColor: 'secondary.main',
                },
                '&.Mui-focused fieldset': {
                  borderColor: 'secondary.main',
                },
              },
            }}
          >
            <MenuItem value="">All Tiers</MenuItem>
            <MenuItem value="Page">🛡️ Page</MenuItem>
            <MenuItem value="Squire">🛡️ Squire</MenuItem>
            <MenuItem value="Knight">⚔️ Knight</MenuItem>
            <MenuItem value="Baron">🏰 Baron</MenuItem>
            <MenuItem value="Duke">👑 Duke</MenuItem>
            <MenuItem value="Prince">🤴 Prince</MenuItem>
            <MenuItem value="Sovereign">👑 Sovereign</MenuItem>
          </TextField>

          <Button
            variant="outlined"
            startIcon={<CompareArrowsIcon />}
            disabled={selectedIds.length < 2}
            onClick={() => navigate('/compare')}
          >
            Compare ({selectedIds.length})
          </Button>
        </Box>

        {/* Right: View toggle */}
        <ToggleButtonGroup
          value={viewMode}
          exclusive
          onChange={(_, v) => v && dispatch(setViewMode(v))}
          size="small"
        >
          <ToggleButton value="grid">
            <ViewModuleIcon />
          </ToggleButton>
          <ToggleButton value="list">
            <ViewListIcon />
          </ToggleButton>
        </ToggleButtonGroup>
      </Box>

      {isLoading ? (
        <LoadingSpinner />
      ) : viewMode === 'grid' ? (
        <Grid container spacing={3}>
          {filteredComputers.map((computer) => (
            <Grid item xs={12} sm={6} md={4} lg={3} key={computer.id}>
              <ComputerCard
                computer={computer}
                selected={selectedIds.includes(computer.id)}
                onToggleSelect={(id) => dispatch(toggleSelected(id))}
              />
            </Grid>
          ))}
        </Grid>
      ) : (
        <TableContainer component={Paper}>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell padding="checkbox">
                  <Checkbox
                    indeterminate={
                      selectedIds.length > 0 &&
                      selectedIds.length < filteredComputers.length
                    }
                    checked={
                      filteredComputers.length > 0 &&
                      filteredComputers.every((c) => selectedIds.includes(c.id))
                    }
                    onChange={() => {
                      if (filteredComputers.every((c) => selectedIds.includes(c.id))) {
                        dispatch(clearSelected());
                      } else {
                        filteredComputers.forEach((c) => {
                          if (!selectedIds.includes(c.id)) {
                            dispatch(toggleSelected(c.id));
                          }
                        });
                      }
                    }}
                    sx={{ color: 'secondary.main', '&.Mui-checked': { color: 'secondary.main' }, '&.MuiCheckbox-indeterminate': { color: 'secondary.main' } }}
                  />
                </TableCell>
                <TableCell>
                  <TableSortLabel
                    active={sortBy === 'name'}
                    direction={sortBy === 'name' ? sortOrder : 'asc'}
                    onClick={() => handleSort('name')}
                  >
                    Name
                  </TableSortLabel>
                </TableCell>
                <TableCell>Tier</TableCell>
                <TableCell>
                  <TableSortLabel
                    active={sortBy === 'price'}
                    direction={sortBy === 'price' ? sortOrder : 'asc'}
                    onClick={() => handleSort('price')}
                  >
                    Price
                  </TableSortLabel>
                </TableCell>
                <TableCell>
                  <TableSortLabel
                    active={sortBy === 'ram'}
                    direction={sortBy === 'ram' ? sortOrder : 'asc'}
                    onClick={() => handleSort('ram')}
                  >
                    RAM
                  </TableSortLabel>
                </TableCell>
                <TableCell>CPU</TableCell>
                <TableCell>GPU</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {filteredComputers.map((computer) => {
                const tier = getTierInfo(computer.tierBadge);
                return (
                  <TableRow
                    key={computer.id}
                    hover
                    sx={{ cursor: 'pointer' }}
                    onClick={() => navigate(`/computers/${computer.id}`)}
                  >
                    <TableCell padding="checkbox">
                      <Checkbox
                        checked={selectedIds.includes(computer.id)}
                        onClick={(e) => e.stopPropagation()}
                        onChange={() => dispatch(toggleSelected(computer.id))}
                        sx={{ color: 'secondary.main', '&.Mui-checked': { color: 'secondary.main' } }}
                      />
                    </TableCell>
                    <TableCell>
                      <Box sx={{ display: 'flex', alignItems: 'center', gap: 1 }}>
                        <Typography fontWeight={600}>
                          {computer.name}
                        </Typography>
                        {computer.isNew && (
                          <Chip
                            icon={<StarIcon sx={{ fontSize: '0.85rem', color: 'inherit' }} />}
                            label="NEW"
                            size="small"
                            sx={{
                              bgcolor: 'secondary.main',
                              color: '#fff',
                              fontWeight: 700,
                              fontSize: '0.65rem',
                              height: 22,
                              '& .MuiChip-icon': { color: '#fff', ml: 0.5 },
                            }}
                          />
                        )}
                      </Box>
                    </TableCell>
                    <TableCell>
                      <Chip
                        label={`${tier.icon} ${tier.label}`}
                        size="small"
                        sx={{
                          bgcolor: tier.color,
                          color: '#fff',
                          fontWeight: 600,
                        }}
                      />
                    </TableCell>
                    <TableCell sx={{ color: 'secondary.main', fontWeight: 700 }}>
                      {formatPrice(computer.price)}
                    </TableCell>
                    <TableCell>{formatRam(computer.ramAmountMB)}</TableCell>
                    <TableCell>
                      {computer.processorBrand} {computer.processorName}
                    </TableCell>
                    <TableCell>
                      {computer.gpuBrand} {computer.gpuName}
                    </TableCell>
                  </TableRow>
                );
              })}
              {filteredComputers.length === 0 && (
                <TableRow>
                  <TableCell colSpan={7} align="center">
                    <Typography color="text.secondary" sx={{ py: 4 }}>
                      No computers found in the royal catalog.
                    </Typography>
                  </TableCell>
                </TableRow>
              )}
            </TableBody>
          </Table>
        </TableContainer>
      )}

      {!isLoading && !isError && data && (
        <Box sx={{ mt: 3 }}>
          <Pagination
            page={page}
            totalPages={totalPages}
            pageSize={pageSize}
            onPageChange={setPage}
            onPageSizeChange={setPageSize}
          />
        </Box>
      )}

      <Fab
        color="secondary"
        aria-label="Add Computer"
        onClick={() => navigate('/computers/new')}
        sx={{ position: 'fixed', bottom: 24, right: 24 }}
      >
        <AddIcon />
      </Fab>
    </Box>
  );
}
