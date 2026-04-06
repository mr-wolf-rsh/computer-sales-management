import { createSlice, type PayloadAction } from '@reduxjs/toolkit';
import type { ViewMode } from './types/computer.types';

interface ComputersState {
  viewMode: ViewMode;
  selectedIds: number[];
}

const initialState: ComputersState = {
  viewMode: 'grid',
  selectedIds: [],
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
  },
});

export const { setViewMode, toggleSelected, clearSelected } =
  computersSlice.actions;
export default computersSlice.reducer;
