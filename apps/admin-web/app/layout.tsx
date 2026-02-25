import type { Metadata } from 'next';
import { Providers } from './providers';
import './globals.css';

const API_BASE = process.env.NEXT_PUBLIC_API_URL ?? 'http://localhost:3003/api';
const API_ORIGIN = API_BASE.startsWith('http') ? API_BASE.replace(/\/api\/?$/, '') : null;

export async function generateMetadata(): Promise<Metadata> {
  const base: Metadata = {
    title: 'Laundry Admin',
    description: 'Enterprise admin for Laundry platform',
  };
  if (!API_ORIGIN) return base;
  try {
    const res = await fetch(`${API_BASE}/branding/public`, { next: { revalidate: 300 } });
    const data = (await res.json()) as { logoUrl?: string | null };
    const logoUrl = data?.logoUrl;
    if (logoUrl && typeof logoUrl === 'string') {
      const iconUrl = logoUrl.startsWith('http') ? logoUrl : `${API_ORIGIN}${logoUrl}`;
      return { ...base, icons: { icon: iconUrl } };
    }
  } catch {
    // ignore
  }
  return base;
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}
