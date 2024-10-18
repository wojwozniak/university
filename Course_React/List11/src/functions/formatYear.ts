export const formatYear = (value: number): string => {
  return value ? value.toString().replace(/,/g, '') : '';
}