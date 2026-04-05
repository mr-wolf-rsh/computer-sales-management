import { createSlice, type PayloadAction } from '@reduxjs/toolkit';
import type { ViewMode } from './types/computer.types';

interface ComputersState {
  searchTerm: string;
  viewMode: ViewMode;
  selectedIds: number[];
}

const initialState: ComputersState = {
  searchTerm: '',
  viewMode: 'grid',
  selectedIds: [],
};

const computersSlice = createSlice({
  name: 'computers',
  initialState,
  reducers: {
    setSearchTerm(state, action: PayloadAction<string>) {
      state.searchTerm = action.payload;
    },
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
  },
});

export const { setSearchTerm, setViewMode, toggleSelected, clearSelected } =
  computersSlice.actions;
export default computersSlice.reducer;
