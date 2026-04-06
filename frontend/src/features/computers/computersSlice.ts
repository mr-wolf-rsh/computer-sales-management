import { createSlice, type PayloadAction } from '@reduxjs/toolkit';
import type { ViewMode } from './types/computer.types';

interface ComputersState {
  viewMode: ViewMode;
  selectedIds: number[];
  page: number;
  pageSize: number;
}

const initialState: ComputersState = {
  viewMode: 'grid',
  selectedIds: [],
  page: 1,
  pageSize: 10,
};

const computersSlice = createSlice({
  name: 'computers',
  initialState,
  reducers: {
    setViewMode(state, action: PayloadAction<ViewMode>) {
      state.viewMode = action.payload;
    },
    toggleSelected(state, action: PayloadAction<number>) {
      const id = action.payload;
      const index = state.selectedIds.indexOf(id);
      if (index >= 0) {
        state.selectedIds.splice(index, 1);
      } else {
        state.selectedIds.push(id);
      }
    },
    clearSelected(state) {
      state.selectedIds = [];
    },
    setPage(state, action: PayloadAction<number>) {
      state.page = action.payload;
    },
    setPageSize(state, action: PayloadAction<number>) {
      state.pageSize = action.payload;
      state.page = 1;
    },
  },
});

export const { setViewMode, toggleSelected, clearSelected, setPage, setPageSize } =
  computersSlice.actions;
export default computersSlice.reducer;
