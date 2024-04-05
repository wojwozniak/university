import { Product } from "./types/Product";
import { UserData } from "./types/UserData";

const userData: UserData = {
  id: 0,
  name: 'Example User',
  email: 'example@mail.com',
  avatar: "http://placeholder.co/200",
};

const exampleProducts: Product[] = [
  {
    id: 1,
    name: 'Product 1',
    price: 100,
    avability: true,
    stock: 10,
  },
  {
    id: 2,
    name: 'Product 2',
    price: 200,
    avability: false,
    stock: 0,
  },
  {
    id: 3,
    name: 'Product 3',
    price: 300,
    avability: true,
    stock: 5,
  },
];

export const initialState = {
  products: exampleProducts,
  userData: userData,
};