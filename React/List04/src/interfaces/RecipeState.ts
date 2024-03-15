import { Recipe } from "./Recipe";

export interface RecipeState {
  recipes: Recipe[];
  favorites: number[];
}