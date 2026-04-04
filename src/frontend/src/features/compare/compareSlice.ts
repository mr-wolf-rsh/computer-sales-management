import { createSlice, type PayloadAction } from '@reduxjs/toolkit';

interface CompareState {
  computerIds: number[];
}

const initialState: CompareState = {
  computerIds: [],
};

const compareSlice = createSlice({
  name: 'compare',
  initialState,
  reducers: {
    addToCompare(state, action: PayloadAction<number>) {
      if (!state.computerIds.includes(action.payload)) {
        state.computerIds.push(action.payload);
      }
    },
    removeFromCompare(state, action: PayloadAction<number>) {
      state.computerIds = state.computerIds.filter(
        (id) => id !== action.payload,
      );
    },
    clearCompare(state) {
      state.computerIds = [];
    },
  },
});

export const { addToCompare, removeFromCompare, clearCompare } =
  compareSlice.actions;
export default compareSlice.reducer;
