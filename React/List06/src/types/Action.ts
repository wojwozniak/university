import { Product } from "./Product";

export type Action =
  | { type: 'UPDATE_PRODUCTS'; payload: Product[] }