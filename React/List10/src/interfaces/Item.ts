export interface Item {
  id: string;
  name: string;
  effect: string;
  [key: string]: string | undefined;
}