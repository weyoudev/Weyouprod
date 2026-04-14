import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { api } from '@/lib/api';
import type { AdminFeedbackRatingStatsResponse, AdminFeedbackResponse, FeedbackStatus } from '@/types';

interface FeedbackFilters {
  type?: string;
  status?: FeedbackStatus;
  rating?: number;
  dateFrom?: string;
  dateTo?: string;
  branchId?: string;
  limit?: number;
  cursor?: string;
}

const ISO_DATE_RE = /^\d{4}-\d{2}-\d{2}$/;

function isValidIsoDate(value?: string): value is string {
  return !!value && ISO_DATE_RE.test(value);
}

function fetchFeedback(filters: FeedbackFilters): Promise<AdminFeedbackResponse> {
  const params = new URLSearchParams();
  if (filters.type) params.set('type', filters.type);
  if (filters.status) params.set('status', filters.status);
  if (Number.isInteger(filters.rating) && (filters.rating as number) >= 1 && (filters.rating as number) <= 5) {
    params.set('rating', String(filters.rating));
  }
  if (isValidIsoDate(filters.dateFrom)) params.set('dateFrom', filters.dateFrom);
  if (isValidIsoDate(filters.dateTo)) params.set('dateTo', filters.dateTo);
  if (filters.branchId) params.set('branchId', filters.branchId);
  params.set('limit', String(filters.limit ?? 20));
  if (filters.cursor) params.set('cursor', filters.cursor);
  return api.get<AdminFeedbackResponse>(`/admin/feedback?${params.toString()}`).then((r) => r.data);
}

export function useFeedbackList(filters: FeedbackFilters) {
  return useQuery({
    queryKey: ['admin', 'feedback', filters],
    queryFn: () => fetchFeedback(filters),
  });
}

export function useUpdateFeedbackStatus(feedbackId: string) {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: (body: { status: FeedbackStatus; adminNotes?: string }) =>
      api.patch(`/admin/feedback/${feedbackId}`, body).then((r) => r.data),
    onSuccess: () => {
      qc.invalidateQueries({ queryKey: ['admin', 'feedback'] });
    },
  });
}

interface FeedbackRatingStatsFilters {
  type?: string;
  status?: FeedbackStatus;
  dateFrom?: string;
  dateTo?: string;
  branchId?: string;
}

function fetchFeedbackRatingStats(filters: FeedbackRatingStatsFilters): Promise<AdminFeedbackRatingStatsResponse> {
  const params = new URLSearchParams();
  if (filters.type) params.set('type', filters.type);
  if (filters.status) params.set('status', filters.status);
  if (isValidIsoDate(filters.dateFrom)) params.set('dateFrom', filters.dateFrom);
  if (isValidIsoDate(filters.dateTo)) params.set('dateTo', filters.dateTo);
  if (filters.branchId) params.set('branchId', filters.branchId);
  return api.get<AdminFeedbackRatingStatsResponse>(`/admin/feedback/stats?${params.toString()}`).then((r) => r.data);
}

export function useFeedbackRatingStats(filters: FeedbackRatingStatsFilters) {
  return useQuery({
    queryKey: ['admin', 'feedback', 'rating-stats', filters],
    queryFn: () => fetchFeedbackRatingStats(filters),
    enabled: true,
  });
}
