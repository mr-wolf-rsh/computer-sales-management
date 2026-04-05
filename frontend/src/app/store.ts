import { configureStore } from '@reduxjs/toolkit';
import { computersApi } from '@/features/computers/api/computersApi';
import computersReducer from '@/features/computers/computersSlice';
import compareReducer from '@/features/compare/compareSlice';

export const store = configureStore({
  reducer: {
    [computersApi.reducerPath]: computersApi.reducer,
    computers: computersReducer,
    compare: compareReducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat(computersApi.middleware),
});

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
