import {
  AppBar,
  Box,
  Button,
  Container,
  IconButton,
  Toolbar,
  Typography,
} from '@mui/material';
import DarkModeIcon from '@mui/icons-material/DarkMode';
import LightModeIcon from '@mui/icons-material/LightMode';
import { Link as RouterLink, Outlet } from 'react-router-dom';
import { useThemeMode } from '@/theme/ThemeContext';

export default function Layout() {
  const { mode, toggleMode } = useThemeMode();

  return (
    <Box sx={{ display: 'flex', flexDirection: 'column', minHeight: '100vh' }}>
      <AppBar position="sticky" elevation={2}>
        <Toolbar>
          <Typography
            variant="h5"
            component={RouterLink}
            to="/"
            sx={{
              fontFamily: '"Playfair Display", serif',
              fontWeight: 700,
              color: 'secondary.main',
              textDecoration: 'none',
              mr: 4,
            }}
          >
            {'👑 Compu Palace'}
          </Typography>

          <Box sx={{ display: 'flex', gap: 1, flexGrow: 1 }}>
            <Button
              component={RouterLink}
              to="/"
              sx={{ color: '#fff', textTransform: 'none' }}
            >
              Catalog
            </Button>
            <Button
              component={RouterLink}
              to="/dashboard"
              sx={{ color: '#fff', textTransform: 'none' }}
            >
              Dashboard
            </Button>
          </Box>

          <IconButton onClick={toggleMode} sx={{ color: 'secondary.main' }}>
            {mode === 'light' ? <DarkModeIcon /> : <LightModeIcon />}
          </IconButton>
        </Toolbar>
      </AppBar>

      <Container
        maxWidth="xl"
        component="main"
        sx={{ flex: 1, py: 4 }}
      >
        <Outlet />
      </Container>

      <Box
        component="footer"
        sx={{
          py: 2,
          textAlign: 'center',
          borderTop: '1px solid',
          borderColor: 'divider',
        }}
      >
        <Typography variant="body2" color="text.secondary">
          Compu Palace &copy; {new Date().getFullYear()}
        </Typography>
      </Box>
    </Box>
  );
}
