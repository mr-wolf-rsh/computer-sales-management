import { Box, MenuItem, Pagination as MuiPagination, TextField } from '@mui/material';

interface PaginationProps {
  page: number;
  totalPages: number;
  pageSize: number;
  onPageChange: (page: number) => void;
  onPageSizeChange: (size: number) => void;
}

const PAGE_SIZE_OPTIONS = [5, 10, 20, 50];

export default function Pagination({
  page,
  totalPages,
  pageSize,
  onPageChange,
  onPageSizeChange,
}: PaginationProps) {
  return (
    <Box
      sx={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        gap: 3,
        flexWrap: 'wrap',
      }}
    >
      {totalPages > 1 && (
        <MuiPagination
          count={totalPages}
          page={page}
          onChange={(_, value) => onPageChange(value)}
          color="primary"
          shape="rounded"
        />
      )}
      <TextField
        select
        size="small"
        value={pageSize}
        onChange={(e) => onPageSizeChange(Number(e.target.value))}
        label="Per page"
        sx={{
          minWidth: 100,
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
        {PAGE_SIZE_OPTIONS.map((opt) => (
          <MenuItem key={opt} value={opt}>
            {opt}
          </MenuItem>
        ))}
      </TextField>
    </Box>
  );
}
