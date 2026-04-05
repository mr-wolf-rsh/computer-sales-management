import { createTheme, type ThemeOptions } from '@mui/material/styles';

const sharedTypography = {
  fontFamily: '"Space Grotesk", sans-serif',
  h1: { fontFamily: '"Syne", sans-serif' },
  h2: { fontFamily: '"Syne", sans-serif' },
  h3: { fontFamily: '"Syne", sans-serif' },
  h4: { fontFamily: '"Syne", sans-serif' },
  h5: { fontFamily: '"Syne", sans-serif' },
  h6: { fontFamily: '"Syne", sans-serif' },
};

const sharedShape = {
  borderRadius: 12,
};

const lightOptions: ThemeOptions = {
  palette: {
    mode: 'light',
    primary: {
      main: '#2D1B4E',
      light: '#5C3D8F',
      dark: '#1A0F2E',
    },
    secondary: {
      main: '#D4AF37',
      light: '#E8CC6E',
      dark: '#A88B2C',
    },
    background: {
      default: '#FFFDF5',
      paper: '#FFFFFF',
    },
    text: {
      primary: '#1A0F2E',
      secondary: '#5C3D8F',
    },
  },
  typography: sharedTypography,
  shape: sharedShape,
  components: {
    MuiCard: {
      styleOverrides: {
        root: {
          border: '1px solid rgba(212, 175, 55, 0.25)',
          boxShadow: '0 2px 12px rgba(45, 27, 78, 0.08)',
          transition: 'transform 0.2s ease, box-shadow 0.2s ease',
          '&:hover': {
            boxShadow: '0 4px 20px rgba(212, 175, 55, 0.2)',
          },
        },
      },
    },
    MuiButton: {
      styleOverrides: {
        root: {
          textTransform: 'none',
          fontWeight: 600,
          borderRadius: 8,
          '&:hover': {
            boxShadow: '0 2px 8px rgba(212, 175, 55, 0.3)',
          },
        },
        containedPrimary: {
          '&:hover': {
            backgroundColor: '#5C3D8F',
          },
        },
      },
    },
    MuiAppBar: {
      styleOverrides: {
        root: {
          backgroundColor: '#2D1B4E',
          backgroundImage: 'none',
        },
      },
    },
    MuiFab: {
      styleOverrides: {
        root: {
          backgroundColor: '#D4AF37',
          color: '#1A0F2E',
          '&:hover': {
            backgroundColor: '#E8CC6E',
          },
        },
      },
    },
  },
};

const darkOptions: ThemeOptions = {
  palette: {
    mode: 'dark',
    primary: {
      main: '#9B72CF',
      light: '#BB9AE0',
      dark: '#7B52AF',
    },
    secondary: {
      main: '#FFD700',
      light: '#FFE44D',
      dark: '#CCB000',
    },
    background: {
      default: '#0D0A1A',
      paper: '#1A0F2E',
    },
    text: {
      primary: '#F5F0FF',
      secondary: '#BB9AE0',
    },
  },
  typography: sharedTypography,
  shape: sharedShape,
  components: {
    MuiCard: {
      styleOverrides: {
        root: {
          border: '1px solid rgba(255, 215, 0, 0.2)',
          boxShadow: '0 2px 12px rgba(0, 0, 0, 0.3)',
          transition: 'transform 0.2s ease, box-shadow 0.2s ease',
          '&:hover': {
            boxShadow: '0 4px 20px rgba(255, 215, 0, 0.15)',
          },
        },
      },
    },
    MuiButton: {
      styleOverrides: {
        root: {
          textTransform: 'none',
          fontWeight: 600,
          borderRadius: 8,
          '&:hover': {
            boxShadow: '0 2px 8px rgba(255, 215, 0, 0.25)',
          },
        },
        containedPrimary: {
          '&:hover': {
            backgroundColor: '#BB9AE0',
          },
        },
      },
    },
    MuiAppBar: {
      styleOverrides: {
        root: {
          backgroundColor: '#1A0F2E',
          backgroundImage: 'none',
        },
      },
    },
    MuiFab: {
      styleOverrides: {
        root: {
          backgroundColor: '#FFD700',
          color: '#0D0A1A',
          '&:hover': {
            backgroundColor: '#FFE44D',
          },
        },
      },
    },
  },
};

export const lightTheme = createTheme(lightOptions);
export const darkTheme = createTheme(darkOptions);
