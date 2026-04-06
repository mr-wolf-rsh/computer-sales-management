import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react';
import type {
  Computer,
  ComputerFormData,
  DashboardStats,
  Gpu,
  PaginatedResult,
  Processor,
} from '../types/computer.types';

interface ListParams {
  page?: number;
  size?: number;
  sortBy?: string;
  sortOrder?: string;
}

interface SearchParams extends ListParams {
  q: string;
}

export const computersApi = createApi({
  reducerPath: 'computersApi',
  baseQuery: fetchBaseQuery({ baseUrl: '/api' }),
  tagTypes: ['Computer', 'ComputerList', 'Dashboard'],
  endpoints: (builder) => ({
    getComputers: builder.query<PaginatedResult<Computer>, ListParams>({
      query: ({ page = 1, size = 10, sortBy = 'createdAt', sortOrder = 'desc' } = {}) =>
        `computers?page=${page}&pageSize=${size}&sortBy=${sortBy}&sortOrder=${sortOrder}`,
      providesTags: (result) =>
        result
          ? [
              ...result.items.map(({ id }) => ({
                type: 'Computer' as const,
                id,
              })),
              { type: 'ComputerList' },
            ]
          : [{ type: 'ComputerList' }],
    }),

    getComputer: builder.query<Computer, number>({
      query: (id) => `computers/${id}`,
      providesTags: (_result, _error, id) => [{ type: 'Computer', id }],
    }),

    searchComputers: builder.query<PaginatedResult<Computer>, SearchParams>({
      query: ({ q, page = 1, size = 10, sortBy = 'createdAt', sortOrder = 'desc' }) =>
        `computers/search?q=${encodeURIComponent(q)}&page=${page}&pageSize=${size}&sortBy=${sortBy}&sortOrder=${sortOrder}`,
      providesTags: [{ type: 'ComputerList' }],
    }),

    createComputer: builder.mutation<Computer, ComputerFormData>({
      query: (body) => ({
        url: 'computers',
        method: 'POST',
        body,
      }),
      invalidatesTags: [{ type: 'ComputerList' }, { type: 'Dashboard' }],
    }),

    updateComputer: builder.mutation<void, { id: number; data: ComputerFormData }>({
      query: ({ id, data }) => ({
        url: `computers/${id}`,
        method: 'PUT',
        body: data,
      }),
      invalidatesTags: (_result, _error, { id }) => [
        { type: 'Computer', id },
        { type: 'ComputerList' },
        { type: 'Dashboard' },
      ],
    }),

    deleteComputer: builder.mutation<void, number>({
      query: (id) => ({
        url: `computers/${id}`,
        method: 'DELETE',
      }),
      invalidatesTags: [{ type: 'ComputerList' }, { type: 'Dashboard' }],
    }),

    getDashboard: builder.query<DashboardStats, void>({
      query: () => 'computers/dashboard',
      providesTags: [{ type: 'Dashboard' }],
    }),

    getProcessors: builder.query<Processor[], void>({
      query: () => 'processors',
    }),

    getGpus: builder.query<Gpu[], void>({
      query: () => 'gpus',
    }),
  }),
});

export const {
  useGetComputersQuery,
  useGetComputerQuery,
  useSearchComputersQuery,
  useCreateComputerMutation,
  useUpdateComputerMutation,
  useDeleteComputerMutation,
  useGetDashboardQuery,
  useGetProcessorsQuery,
  useGetGpusQuery,
} = computersApi;
