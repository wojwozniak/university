import { Recipe } from "./Recipe";

export interface RecipeState {
  recipes: Recipe[];
  favorites: number[];
  filterOutFinished: boolean;
  searchQuery: string;
}