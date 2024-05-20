export const safeParseFloat = (input: string): number => {
  const output = parseFloat(input);
  if (isNaN(output)) return 0;
  return output;
}