import { CategoryData } from "./CategoryData";

export interface State {
  user: string,
  highScore: number,
  currentScore: number,
  selectedCategory: string,
  data: CategoryData[]
}