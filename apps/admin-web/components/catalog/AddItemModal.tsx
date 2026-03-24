'use client';

import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import {
  Dialog,
  DialogContent,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog';
import { Switch } from '@/components/ui/switch';
import { useCreateItem } from '@/hooks/useCatalog';
import { toast } from 'sonner';
import { getFriendlyErrorMessage } from '@/lib/api';
import { ErrorDisplay } from '@/components/shared/ErrorDisplay';
import { CatalogItemIcon } from './CatalogItemIcon';
import { useUploadCatalogIcon } from '@/hooks/useCatalog';

interface AddItemModalProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
}

export function AddItemModal({ open, onOpenChange }: AddItemModalProps) {
  const [name, setName] = useState('');
  const [active, setActive] = useState(true);
  const [icon, setIcon] = useState<string | ''>('');
  const [iconCacheBuster, setIconCacheBuster] = useState<string>('');
  const [error, setError] = useState<unknown>(null);
  const createItem = useCreateItem();
  const uploadCatalogIcon = useUploadCatalogIcon();
  const [iconUploadKey] = useState(() => `new-item-${Date.now()}-${Math.random().toString(36).slice(2, 8)}`);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!name.trim()) {
      toast.error('Name is required');
      return;
    }
    setError(null);
    createItem.mutate(
      { name: name.trim(), active, icon: icon || null },
      {
        onSuccess: () => {
          toast.success('Item added');
          setName('');
          setActive(true);
          setIcon('');
          setError(null);
          onOpenChange(false);
        },
        onError: (err) => {
          setError(err);
          toast.error(getFriendlyErrorMessage(err));
        },
      }
    );
  };

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent>
        <form onSubmit={handleSubmit}>
          <DialogHeader>
            <DialogTitle>Add item</DialogTitle>
          </DialogHeader>
          {error ? <ErrorDisplay error={error} /> : null}
          <div className="grid gap-4 py-4">
            <div className="grid gap-2">
              <label htmlFor="add-name" className="text-sm font-medium">
                Name
              </label>
              <Input
                id="add-name"
                value={name}
                onChange={(e) => setName(e.target.value)}
                placeholder="Item name"
              />
            </div>
            <div className="grid gap-2">
              <label className="text-sm font-medium">Icon (optional) — one per item</label>
              <div className="flex flex-wrap items-center gap-3">
                {icon && (
                  <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg border border-border bg-muted/50">
                    <CatalogItemIcon icon={icon} size={22} cacheBuster={iconCacheBuster} />
                  </span>
                )}
                <input
                  type="file"
                  accept=".png,.jpg,.jpeg"
                  className="text-sm file:mr-2 file:rounded file:border-0 file:bg-primary file:px-3 file:py-1.5 file:text-primary-foreground file:text-sm"
                  onChange={(e) => {
                    const file = e.target.files?.[0];
                    if (!file) return;
                    uploadCatalogIcon.mutate({ file, key: iconUploadKey }, {
                      onSuccess: (url) => {
                        setIcon(url);
                        setIconCacheBuster(String(Date.now()));
                        toast.success('Icon uploaded');
                      },
                      onError: (err) => {
                        toast.error(getFriendlyErrorMessage(err));
                      },
                    });
                    e.target.value = '';
                  }}
                  disabled={uploadCatalogIcon.isPending}
                />
                {icon && (
                  <Button
                    type="button"
                    variant="ghost"
                    size="sm"
                    className="text-muted-foreground"
                    onClick={() => setIcon('')}
                  >
                    Remove icon
                  </Button>
                )}
              </div>
            </div>
            <div className="flex items-center gap-2">
              <Switch id="add-active" checked={active} onCheckedChange={setActive} />
              <label htmlFor="add-active" className="text-sm font-medium">
                Active
              </label>
            </div>
          </div>
          <DialogFooter>
            <Button type="button" variant="outline" onClick={() => onOpenChange(false)}>
              Cancel
            </Button>
            <Button type="submit" disabled={createItem.isPending}>
              {createItem.isPending ? 'Adding…' : 'Add'}
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  );
}
