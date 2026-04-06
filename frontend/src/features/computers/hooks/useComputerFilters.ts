import { useState, useCallback } from 'react';
import { useAppDispatch, useAppSelector } from '@/app/hooks';
import {
  setPage as setPageAction,
  setPageSize as setPageSizeAction,
} from '../computersSlice';
import { useDebounce } from './useDebounce';

interface ComputerFiltersState {
  page: number;
  pageSize: number;
  searchTerm: string;
  debouncedSearch: string;
  sortBy: string;
  sortOrder: 'asc' | 'desc';
  tierFilter: string;
}

interface ComputerFiltersActions {
  setPage: (page: number) => void;
  setPageSize: (size: number) => void;
  setSearchTerm: (term: string) => void;
  setSortBy: (field: string) => void;
  toggleSortOrder: () => void;
  setTierFilter: (tier: string) => void;
}

export function useComputerFilters(): ComputerFiltersState & ComputerFiltersActions {
  const dispatch = useAppDispatch();
  const page = useAppSelector((s) => s.computers.page);
  const pageSize = useAppSelector((s) => s.computers.pageSize);

  const [searchTerm, setSearchTermLocal] = useState('');
  const [sortBy, setSortBy] = useState('createdAt');
  const [sortOrder, setSortOrder] = useState<'asc' | 'desc'>('desc');
  const [tierFilter, setTierFilter] = useState('');

  const debouncedSearch = useDebounce(searchTerm, 300);

  const setPage = useCallback(
    (p: number): void => {
      dispatch(setPageAction(p));
    },
    [dispatch],
  );

  const setSearchTerm = useCallback(
    (term: string): void => {
      setSearchTermLocal(term);
      dispatch(setPageAction(1));
    },
    [dispatch],
  );

  const handleSetPageSize = useCallback(
    (size: number): void => {
      dispatch(setPageSizeAction(size));
    },
    [dispatch],
  );

  const toggleSortOrder = useCallback((): void => {
    setSortOrder((prev) => (prev === 'asc' ? 'desc' : 'asc'));
  }, []);

  return {
    page,
    pageSize,
    searchTerm,
    debouncedSearch,
    sortBy,
    sortOrder,
    tierFilter,
    setPage,
    setPageSize: handleSetPageSize,
    setSearchTerm,
    setSortBy,
    toggleSortOrder,
    setTierFilter,
  };
}
