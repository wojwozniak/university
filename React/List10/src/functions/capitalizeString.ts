const capitalizeString = (str: string): string => {
  return !str ? str : str.charAt(0).toUpperCase() + str.slice(1);
}