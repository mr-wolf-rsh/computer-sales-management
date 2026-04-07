import { saveAs } from 'file-saver';
import type { Computer } from '../types/computer.types';

function escapeCSV(value: string | number | null): string {
  if (value === null || value === undefined) return '';
  const str = String(value);
  if (str.includes(',') || str.includes('"') || str.includes('\n')) {
    return `"${str.replace(/"/g, '""')}"`;
  }
  return str;
}

export function exportComputersToCSV(computers: Computer[]): void {
  const headers = [
    'ID',
    'Name',
    'Tier',
    'Price ($)',
    'RAM (MB)',
    'Processor',
    'GPU',
    'Weight',
    'Weight Unit',
    'PSU Wattage',
    'Storage Drives',
    'USB Ports',
    'Created At',
  ];

  const rows = computers.map((c) => [
    escapeCSV(c.id),
    escapeCSV(c.name),
    escapeCSV(c.tierBadge),
    escapeCSV(c.price),
    escapeCSV(c.ramAmountMB),
    escapeCSV(`${c.processorBrand} ${c.processorName}`),
    escapeCSV(`${c.gpuBrand} ${c.gpuName}`),
    escapeCSV(c.weight),
    escapeCSV(c.weightUnit),
    escapeCSV(c.psuWattage),
    escapeCSV(
      c.storageDrives.map((d) => `${d.capacityGB}GB ${d.type}`).join('; '),
    ),
    escapeCSV(
      c.usbPorts.map((p) => `${p.count}x ${p.usbType}`).join('; '),
    ),
    escapeCSV(c.createdAt),
  ]);

  const csvContent = [
    headers.join(','),
    ...rows.map((row) => row.join(',')),
  ].join('\n');

  const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
  saveAs(blob, `compu-palace-export-${new Date().toISOString().slice(0, 10)}.csv`);
}
