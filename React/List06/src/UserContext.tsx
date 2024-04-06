import { createContext, useEffect, useReducer } from "react";
import { initialState } from "./initialState";
import { ShopState } from "./types/ShopState";
import { Action } from "./types/Action";

const getInitialState = () => {
  const storedState = localStorage.getItem("shopState");
  if (storedState) {
    return JSON.parse(storedState);
  }
  return initialState;
}

export const UserContext = createContext<{
  state: ShopState;
  dispatch: React.Dispatch<Action>;
}>({
  state: getInitialState(),
  dispatch: () => null,
});

const userReducer = (state: ShopState, action: Action): ShopState => {
  switch (action.type) {
    case "UPDATE_PRODUCTS":
      return { ...state, products: action.payload };
    case "DELETE_PRODUCT":
      return {
        ...state,
        products: state.products.filter((product) => product.id !== action.payload),
      };
    default:
      return state;
  }
};

export const UserProvider = ({ children }: { children: React.ReactNode }) => {
  const [state, dispatch] = useReducer(userReducer, getInitialState());

  useEffect(() => {
    localStorage.setItem("shopState", JSON.stringify(state));
  }, [state]);


  return (
    <UserContext.Provider value={{ state, dispatch }}>
      {children}
    </UserContext.Provider>
  );
};