import { describe, it, expect } from 'vitest';
import { render, screen } from '@testing-library/react';
import { MemoryRouter } from 'react-router-dom';
import { Provider } from 'react-redux';
import { configureStore } from '@reduxjs/toolkit';
import { ThemeProvider } from '@mui/material';
import ComputerCard from '../ComputerCard';
import { lightTheme } from '@/theme/muiTheme';
import computersReducer from '../../computersSlice';
import type { Computer } from '../../types/computer.types';

const mockComputer: Computer = {
  id: 1,
  name: 'Royal Gaming Rig',
  ramAmountMB: 16384,
  price: 1299.99,
  imageUrl: null,
  weight: 3.5,
  weightUnit: 'kg',
  psuWattage: 750,
  processorId: 1,
  processorName: 'Core i7-13700K',
  processorBrand: 'Intel',
  gpuId: 1,
  gpuName: 'RTX 4070',
  gpuBrand: 'NVIDIA',
  storageDrives: [{ id: 1, capacityGB: 1000, type: 'NVMe' }],
  usbPorts: [{ id: 1, count: 4, usbType: 'USB 3.0' }],
  tierBadge: 'Knight',
  createdAt: '2024-01-01T00:00:00Z',
  updatedAt: null,
};

function createTestStore() {
  return configureStore({
    reducer: {
      computers: computersReducer,
    },
  });
}

function renderWithProviders(ui: React.ReactElement) {
  const store = createTestStore();
  return render(
    <Provider store={store}>
      <ThemeProvider theme={lightTheme}>
        <MemoryRouter>{ui}</MemoryRouter>
      </ThemeProvider>
    </Provider>,
  );
}

describe('ComputerCard', () => {
  it('renders the computer name', () => {
    renderWithProviders(<ComputerCard computer={mockComputer} />);
    expect(screen.getByText('Royal Gaming Rig')).toBeInTheDocument();
  });

  it('renders the price', () => {
    renderWithProviders(<ComputerCard computer={mockComputer} />);
    expect(screen.getByText('$1,299.99')).toBeInTheDocument();
  });

  it('renders the tier badge', () => {
    renderWithProviders(<ComputerCard computer={mockComputer} />);
    expect(screen.getByText(/Knight/)).toBeInTheDocument();
  });

  it('renders RAM and processor info', () => {
    renderWithProviders(<ComputerCard computer={mockComputer} />);
    expect(screen.getByText(/16 GB/)).toBeInTheDocument();
    expect(screen.getByText(/Intel/)).toBeInTheDocument();
  });

  it('renders GPU info', () => {
    renderWithProviders(<ComputerCard computer={mockComputer} />);
    expect(screen.getByText(/NVIDIA RTX 4070/)).toBeInTheDocument();
  });
});
