import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { api } from '@/lib/api';
import type { BrandingSettings, UpdateBrandingBody } from '@/types';

/** Public branding (logo, business name, welcome background). No auth. Use on login/welcome screens. */
export interface PublicBranding {
  businessName: string | null;
  logoUrl: string | null;
  termsAndConditions: string | null;
  privacyPolicy: string | null;
  welcomeBackgroundUrl: string | null;
}

function fetchPublicBranding(): Promise<PublicBranding> {
  return api.get<PublicBranding>('/branding/public').then((r) => r.data);
}

export function usePublicBranding() {
  return useQuery({
    queryKey: ['public', 'branding'],
    queryFn: fetchPublicBranding,
  });
}

function fetchBranding(): Promise<BrandingSettings> {
  return api.get<BrandingSettings>('/admin/branding').then((r) => r.data);
}

export function useBranding() {
  return useQuery({
    queryKey: ['admin', 'branding'],
    queryFn: fetchBranding,
  });
}

export function useUpdateBranding() {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: (body: UpdateBrandingBody) =>
      api.put<BrandingSettings>('/admin/branding', body).then((r) => r.data),
    onSuccess: () => {
      qc.invalidateQueries({ queryKey: ['admin', 'branding'] });
    },
  });
}

export function useUploadLogo() {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: (file: File) => {
      const form = new FormData();
      form.append('file', file);
      return api.post<BrandingSettings>('/admin/branding/logo', form).then((r) => r.data);
    },
    onSuccess: () => {
      qc.invalidateQueries({ queryKey: ['admin', 'branding'] });
    },
  });
}

export function useUploadUpiQr() {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: (file: File) => {
      const form = new FormData();
      form.append('file', file);
      return api.post<BrandingSettings>('/admin/branding/upi-qr', form).then((r) => r.data);
    },
    onSuccess: () => {
      qc.invalidateQueries({ queryKey: ['admin', 'branding'] });
    },
  });
}

export function useUploadWelcomeBackground() {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: (file: File) => {
      const form = new FormData();
      form.append('file', file);
      return api.post<BrandingSettings>('/admin/branding/welcome-background', form).then((r) => r.data);
    },
    onSuccess: () => {
      qc.invalidateQueries({ queryKey: ['admin', 'branding'] });
    },
  });
}

export function useUploadAppIcon() {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: (file: File) => {
      const form = new FormData();
      form.append('file', file);
      return api.post<BrandingSettings>('/admin/branding/app-icon', form).then((r) => r.data);
    },
    onSuccess: () => {
      qc.invalidateQueries({ queryKey: ['admin', 'branding'] });
    },
  });
}
