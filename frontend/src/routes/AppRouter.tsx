import React, { Suspense } from 'react';
import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import Layout from '@/features/shared/components/Layout';
import LoadingSpinner from '@/features/shared/components/LoadingSpinner';

const ComputerList = React.lazy(
  () => import('@/features/computers/components/ComputerList'),
);
const ComputerDetail = React.lazy(
  () => import('@/features/computers/components/ComputerDetail'),
);
const ComputerForm = React.lazy(
  () => import('@/features/computers/components/ComputerForm'),
);
const Dashboard = React.lazy(
  () => import('@/features/dashboard/Dashboard'),
);
const CompareView = React.lazy(
  () => import('@/features/compare/CompareView'),
);

const router = createBrowserRouter([
  {
    path: '/',
    element: <Layout />,
    children: [
      {
        index: true,
        element: (
          <Suspense fallback={<LoadingSpinner />}>
            <ComputerList />
          </Suspense>
        ),
      },
      {
        path: 'computers/:id',
        element: (
          <Suspense fallback={<LoadingSpinner />}>
            <ComputerDetail />
          </Suspense>
        ),
      },
      {
        path: 'computers/new',
        element: (
          <Suspense fallback={<LoadingSpinner />}>
            <ComputerForm />
          </Suspense>
        ),
      },
      {
        path: 'computers/:id/edit',
        element: (
          <Suspense fallback={<LoadingSpinner />}>
            <ComputerForm />
          </Suspense>
        ),
      },
      {
        path: 'dashboard',
        element: (
          <Suspense fallback={<LoadingSpinner />}>
            <Dashboard />
          </Suspense>
        ),
      },
      {
        path: 'compare',
        element: (
          <Suspense fallback={<LoadingSpinner />}>
            <CompareView />
          </Suspense>
        ),
      },
    ],
  },
]);

export default function AppRouter(): JSX.Element {
  return <RouterProvider router={router} />;
}
