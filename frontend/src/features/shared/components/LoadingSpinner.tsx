import { Box, CircularProgress, Typography } from '@mui/material';

export default function LoadingSpinner(): JSX.Element {
  return (
    <Box
      sx={{
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
        py: 8,
        gap: 2,
      }}
    >
      <Box sx={{ position: 'relative', display: 'inline-flex' }}>
        <CircularProgress
          size={64}
          thickness={3}
          sx={{ color: 'secondary.main' }}
        />
        <Box
          sx={{
            position: 'absolute',
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
          }}
        >
          <Typography variant="h5" component="span">
            {'👑'}
          </Typography>
        </Box>
      </Box>
      <Typography variant="body2" color="text.secondary">
        Loading the royal catalog...
      </Typography>
    </Box>
  );
}
