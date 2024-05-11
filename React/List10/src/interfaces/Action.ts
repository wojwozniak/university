import { CategoryData } from "./CategoryData";

export type Action =
  | { type: 'ADD_POINTS' }
  | { type: 'ZERO_POINTS' }
  | { type: 'CATEGORY_SCREEN' }
  | { type: 'LOAD_DATA', payload: CategoryData[] }