export interface TierInfo {
  color: string;
  label: string;
  icon: string;
}

const TIER_MAP: Record<string, TierInfo> = {
  Page: { color: '#8B7355', label: 'Page', icon: '📜' },
  Squire: { color: '#A0A0A0', label: 'Squire', icon: '🛡️' },
  Knight: { color: '#CD7F32', label: 'Knight', icon: '⚔️' },
  Baron: { color: '#4169E1', label: 'Baron', icon: '🏰' },
  Duke: { color: '#9B59B6', label: 'Duke', icon: '🎖️' },
  Prince: { color: '#E74C3C', label: 'Prince', icon: '🤴' },
  Sovereign: { color: '#D4AF37', label: 'Sovereign', icon: '👑' },
};

const DEFAULT_TIER: TierInfo = {
  color: '#888888',
  label: 'Unknown',
  icon: '🛡️',
};

export function getTierInfo(tier: string): TierInfo {
  return TIER_MAP[tier] ?? DEFAULT_TIER;
}
