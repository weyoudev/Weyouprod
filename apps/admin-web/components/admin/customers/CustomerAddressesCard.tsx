'use client';

import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import type { CustomerRecord } from '@/types';
import { getGoogleMapsUrl } from '@/lib/format';
import { MapPin, ExternalLink } from 'lucide-react';

export interface CustomerAddressesCardProps {
  customer: CustomerRecord;
}

export function CustomerAddressesCard({ customer }: CustomerAddressesCardProps) {
  const addresses = customer.addresses ?? [];

  return (
    <Card>
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <MapPin className="h-5 w-5" />
          Saved addresses
        </CardTitle>
      </CardHeader>
      <CardContent>
        {addresses.length === 0 ? (
          <p className="text-sm text-muted-foreground">No saved addresses.</p>
        ) : (
          <ul className="space-y-4">
            {addresses.map((addr) => {
              const mapsUrl = getGoogleMapsUrl(addr.googleMapUrl);
              return (
                <li
                  key={addr.id}
                  className="rounded-lg border bg-muted/40 p-3 text-sm"
                >
                  <div className="font-medium">
                    {addr.label}
                    {addr.isDefault && (
                      <span className="ml-2 text-xs text-muted-foreground">
                        (default)
                      </span>
                    )}
                  </div>
                  <div className="mt-1 text-muted-foreground">
                    {addr.addressLine}
                  </div>
                  <div className="mt-0.5 text-muted-foreground">
                    Pincode: {addr.pincode}
                  </div>
                  {mapsUrl ? (
                    <a
                      href={mapsUrl}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center gap-1 text-sm text-primary hover:underline mt-2"
                    >
                      <ExternalLink className="h-3.5 w-3.5" />
                      View on Google Maps
                    </a>
                  ) : (
                    <p className="text-xs text-muted-foreground mt-2">No Google Maps link saved</p>
                  )}
                </li>
              );
            })}
          </ul>
        )}
      </CardContent>
    </Card>
  );
}
