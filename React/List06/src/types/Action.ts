import { Product } from "./Product";

export type Action =
  | { type: 'UPDATE_PRODUCTS'; payload: Product[] }
  | { type: 'DELETE_PRODUCT'; payload: number }
  | { type: 'ADD_PRODUCT'; payload: Product };