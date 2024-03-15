import { Recipe } from "./Recipe";

export type Action =
  | { type: 'ADD_RECIPE'; recipe: Recipe }
  | { type: 'REMOVE_RECIPE'; id: number }
  | { type: 'ADD_TO_FAVORITES'; id: number }
  | { type: 'REMOVE_FROM_FAVORITES'; id: number };