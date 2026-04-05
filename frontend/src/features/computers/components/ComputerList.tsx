import { useCallback, useRef } from 'react';
import {
  Box,
  Button,
  Fab,
  Grid,
  IconButton,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  TableSortLabel,
  ToggleButton,
  ToggleButtonGroup,
  Tooltip,
  Typography,
  Chip,
  Checkbox,
  Alert,
} from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import ViewModuleIcon from '@mui/icons-material/ViewModule';
import ViewListIcon from '@mui/icons-material/ViewList';
import CompareArrowsIcon from '@mui/icons-material/CompareArrows';
import FileDownloadIcon from '@mui/icons-material/FileDownload';
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
import { exportComputersToCSV } from '../utils/csvExport';
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
    setPage,
    setPageSize,
    setSearchTerm,
    setSortBy,
    toggleSortOrder,
  } = useComputerFilters();

  const isSearching = debouncedSearch.length > 0;

  const listQuery = useGetComputersQuery(
    { page, size: pageSize },
    { skip: isSearching },
  );

  const searchQuery = useSearchComputersQuery(
    { q: debouncedSearch, page, size: pageSize },
    { skip: !isSearching },
  );

  const { data, isLoading, isError, error } = isSearching
    ? searchQuery
    : listQuery;

  const computers = data?.items ?? [];
  const totalPages = data?.totalPages ?? 0;

  const sorted = [...computers].sort((a, b) => {
    let cmp = 0;
    switch (sortBy) {
      case 'price':
        cmp = a.price - b.price;
        break;
      case 'ram':
        cmp = a.ramAmountMB - b.ramAmountMB;
        break;
      case 'name':
      default:
        cmp = a.name.localeCompare(b.name);
        break;
    }
    return sortOrder === 'asc' ? cmp : -cmp;
  });

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
      <Box
        sx={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          flexWrap: 'wrap',
          gap: 2,
          mb: 3,
        }}
      >
        <Typography variant="h4" component="h1">
          Royal Catalog
        </Typography>

        <Box sx={{ display: 'flex', gap: 1, alignItems: 'center', flexWrap: 'wrap' }}>
          <SearchBar value={searchTerm} onChange={setSearchTerm} />

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

          <Tooltip title="Export to CSV">
            <IconButton
              onClick={() => exportComputersToCSV(sorted)}
              color="secondary"
            >
              <FileDownloadIcon />
            </IconButton>
          </Tooltip>

          <Button
            variant="outlined"
            startIcon={<CompareArrowsIcon />}
            disabled={selectedIds.length < 2}
            onClick={() => navigate('/compare')}
          >
            Compare ({selectedIds.length})
          </Button>
        </Box>
      </Box>

      {isLoading ? (
        <LoadingSpinner />
      ) : viewMode === 'grid' ? (
        <Grid container spacing={3}>
          {sorted.map((computer) => (
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
                      selectedIds.length < sorted.length
                    }
                    checked={
                      sorted.length > 0 &&
                      sorted.every((c) => selectedIds.includes(c.id))
                    }
                    onChange={() => {
                      if (sorted.every((c) => selectedIds.includes(c.id))) {
                        dispatch(clearSelected());
                      } else {
                        sorted.forEach((c) => {
                          if (!selectedIds.includes(c.id)) {
                            dispatch(toggleSelected(c.id));
                          }
                        });
                      }
                    }}
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
              {sorted.map((computer) => {
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
                      />
                    </TableCell>
                    <TableCell>
                      <Typography fontWeight={600}>
                        {computer.name}
                      </Typography>
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
              {sorted.length === 0 && (
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

      {totalPages > 1 && (
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
