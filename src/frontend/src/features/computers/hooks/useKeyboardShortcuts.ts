import { useEffect } from 'react';

interface ShortcutHandlers {
  onSearch?: () => void;
  onNew?: () => void;
  onEscape?: () => void;
}

export function useKeyboardShortcuts({
  onSearch,
  onNew,
  onEscape,
}: ShortcutHandlers): void {
  useEffect(() => {
    function handleKeyDown(e: KeyboardEvent) {
      const target = e.target as HTMLElement;
      const isInput =
        target.tagName === 'INPUT' ||
        target.tagName === 'TEXTAREA' ||
        target.tagName === 'SELECT' ||
        target.isContentEditable;

      if (e.key === 'Escape') {
        onEscape?.();
        return;
      }

      if (isInput) return;

      if (e.key === '/' && onSearch) {
        e.preventDefault();
        onSearch();
      }

      if (e.key === 'n' && onNew) {
        e.preventDefault();
        onNew();
      }
    }

    document.addEventListener('keydown', handleKeyDown);
    return () => document.removeEventListener('keydown', handleKeyDown);
  }, [onSearch, onNew, onEscape]);
}
