export interface Item {
  id: string;
  name: string;
  effect: string;
  image?: string
  [key: string]: any;
}