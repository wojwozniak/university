export const formatCurrency = (value: number): string => {
  return value.toLocaleString('pl-PL', { style: 'currency', currency: 'PLN' });
};