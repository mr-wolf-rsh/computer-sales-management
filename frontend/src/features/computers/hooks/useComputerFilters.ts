import { useState, useCallback } from 'react';
import { useDebounce } from './useDebounce';

interface ComputerFiltersState {
  page: number;
  pageSize: number;
  searchTerm: string;
  debouncedSearch: string;
  sortBy: string;
  sortOrder: 'asc' | 'desc';
}

interface ComputerFiltersActions {
  setPage: (page: number) => void;
  setPageSize: (size: number) => void;
  setSearchTerm: (term: string) => void;
  setSortBy: (field: string) => void;
  toggleSortOrder: () => void;
}

export function useComputerFilters(): ComputerFiltersState & ComputerFiltersActions {
  const [page, setPage] = useState(1);
  const [pageSize, setPageSize] = useState(10);
  const [searchTerm, setSearchTermLocal] = useState('');
  const [sortBy, setSortBy] = useState('name');
  const [sortOrder, setSortOrder] = useState<'asc' | 'desc'>('asc');

  const debouncedSearch = useDebounce(searchTerm, 300);

  const setSearchTerm = useCallback((term: string) => {
    setSearchTermLocal(term);
    setPage(1);
  }, []);

  const handleSetPageSize = useCallback((size: number) => {
    setPageSize(size);
    setPage(1);
  }, []);

  const toggleSortOrder = useCallback(() => {
    setSortOrder((prev) => (prev === 'asc' ? 'desc' : 'asc'));
  }, []);

  return {
    page,
    pageSize,
    searchTerm,
    debouncedSearch,
    sortBy,
    sortOrder,
    setPage,
    setPageSize: handleSetPageSize,
    setSearchTerm,
    setSortBy,
    toggleSortOrder,
  };
}
