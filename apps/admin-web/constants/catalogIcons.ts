export const catalogIcons = [
  { label: 'Shirt', value: 'tshirt-crew' },
  { label: 'Jeans', value: 'human-male' },
  { label: 'Kurta', value: 'human-male' },
  { label: 'Dress', value: 'human-female' },
  { label: 'Hoodie', value: 'hoodie' },
  { label: 'Jacket', value: 'coat-rack' },
  { label: 'Kids Wear', value: 'human-child' },
  { label: 'Wash & Fold (Per KG)', value: 'washing-machine' },
  { label: 'Dry Clean Item', value: 'tumble-dryer' },
  { label: 'Add Ons', value: 'plus-circle' },
] as const;

export type CatalogIconValue = (typeof catalogIcons)[number]['value'];

