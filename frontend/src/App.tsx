import { CssBaseline, ThemeProvider } from '@mui/material';
import { useThemeMode } from '@/theme/ThemeContext';
import { lightTheme, darkTheme } from '@/theme/muiTheme';
import AppRouter from '@/routes/AppRouter';

function App(): JSX.Element {
  const { mode } = useThemeMode();
  const theme = mode === 'light' ? lightTheme : darkTheme;

  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <AppRouter />
    </ThemeProvider>
  );
}

export default App;
