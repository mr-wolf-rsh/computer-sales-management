import { useRef, useCallback } from 'react';
import { InputAdornment, TextField } from '@mui/material';
import SearchIcon from '@mui/icons-material/Search';
import { useKeyboardShortcuts } from '../hooks/useKeyboardShortcuts';

interface SearchBarProps {
  value: string;
  onChange: (value: string) => void;
}

export default function SearchBar({ value, onChange }: SearchBarProps): JSX.Element {
  const inputRef = useRef<HTMLInputElement>(null);

  const handleFocus = useCallback((): void => {
    inputRef.current?.focus();
  }, []);

  const handleClear = useCallback((): void => {
    onChange('');
    inputRef.current?.blur();
  }, [onChange]);

  useKeyboardShortcuts({
    onSearch: handleFocus,
    onEscape: handleClear,
  });

  return (
    <TextField
      inputRef={inputRef}
      value={value}
      onChange={(e) => onChange(e.target.value)}
      placeholder='Search the royal catalog... (press "/" to focus)'
      variant="outlined"
      size="small"
      fullWidth
      sx={{ maxWidth: 500 }}
      InputProps={{
        startAdornment: (
          <InputAdornment position="start">
            <SearchIcon sx={{ color: 'secondary.main' }} />
          </InputAdornment>
        ),
      }}
    />
  );
}
