import { CategoryData } from "./CategoryData";

export interface State {
  user: string,
  highScore: number,
  currentScore: number,
  inGame: boolean,
  data: CategoryData[]
}