import { describe, it, expect } from 'vitest';
import {
  formatPrice,
  formatRam,
  formatStorage,
  formatWeight,
} from '../formatters';

describe('formatPrice', () => {
  it('formats a basic price', () => {
    expect(formatPrice(1234.56)).toBe('$1,234.56');
  });

  it('formats zero', () => {
    expect(formatPrice(0)).toBe('$0.00');
  });

  it('formats whole numbers with two decimal places', () => {
    expect(formatPrice(500)).toBe('$500.00');
  });

  it('formats large numbers with commas', () => {
    expect(formatPrice(10000)).toBe('$10,000.00');
  });
});

describe('formatRam', () => {
  it('formats MB values below 1024', () => {
    expect(formatRam(512)).toBe('512 MB');
  });

  it('converts to GB when >= 1024', () => {
    expect(formatRam(8192)).toBe('8 GB');
  });

  it('shows decimal for non-round GB values', () => {
    expect(formatRam(1536)).toBe('1.5 GB');
  });

  it('formats exactly 1 GB', () => {
    expect(formatRam(1024)).toBe('1 GB');
  });
});

describe('formatStorage', () => {
  it('formats GB values below 1000', () => {
    expect(formatStorage(500)).toBe('500 GB');
  });

  it('converts to TB when >= 1000', () => {
    expect(formatStorage(2000)).toBe('2 TB');
  });

  it('shows decimal for non-round TB values', () => {
    expect(formatStorage(1500)).toBe('1.5 TB');
  });

  it('formats exactly 1 TB', () => {
    expect(formatStorage(1000)).toBe('1 TB');
  });
});

describe('formatWeight', () => {
  it('formats weight with kg unit', () => {
    expect(formatWeight(3.5, 'kg')).toBe('3.5 kg');
  });

  it('formats weight with lb unit', () => {
    expect(formatWeight(8.1, 'lb')).toBe('8.1 lb');
  });
});
