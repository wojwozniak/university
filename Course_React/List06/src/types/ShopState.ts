import { Product } from "./Product";
import { UserData } from "./UserData";

export interface ShopState {
  products: Product[];
  userData: UserData;
}