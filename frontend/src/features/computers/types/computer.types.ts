export interface StorageDrive {
  id: number;
  capacityGB: number;
  type: string;
}

export interface UsbPort {
  id: number;
  count: number;
  usbType: string;
}

export interface Computer {
  id: number;
  name: string;
  ramAmountMB: number;
  price: number;
  imageUrl: string | null;
  weight: number;
  weightUnit: string;
  psuWattage: number;
  processorId: number;
  processorName: string;
  processorBrand: string;
  gpuId: number;
  gpuName: string;
  gpuBrand: string;
  storageDrives: StorageDrive[];
  usbPorts: UsbPort[];
  tierBadge: string;
  createdAt: string;
  updatedAt: string | null;
}

export interface Processor {
  id: number;
  name: string;
  brand: string;
}

export interface Gpu {
  id: number;
  name: string;
  brand: string;
}

export interface DashboardStats {
  totalComputers: number;
  avgPrice: number;
  avgRam: number;
  minPrice: number;
  maxPrice: number;
  storageDistribution: Record<string, number>;
  gpuBrandDistribution: Record<string, number>;
}

export interface PaginatedResult<T> {
  items: T[];
  totalCount: number;
  page: number;
  pageSize: number;
  totalPages: number;
}

export interface ComputerFormData {
  name: string;
  ramAmountMB: number;
  price: number;
  imageUrl: string | null;
  weight: number;
  weightUnit: string;
  psuWattage: number;
  processorId: number;
  gpuId: number;
  storageDrives: Omit<StorageDrive, 'id'>[];
  usbPorts: Omit<UsbPort, 'id'>[];
}

export type ViewMode = 'grid' | 'list';
