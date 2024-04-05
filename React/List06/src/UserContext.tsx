import { createContext, useReducer } from "react";
import { initialState } from "./initialState";
import { ShopState } from "./types/ShopState";

export const UserContext = createContext<{
  state: ShopState;
  dispatch: React.Dispatch<string>;
}>({
  state: initialState,
  dispatch: () => null,
});

const userReducer = (state: ShopState, action: string): ShopState => {
  switch (action) {
    default:
      return state;
  }
};

export const UserProvider = ({ children }: { children: React.ReactNode }) => {
  const [state, dispatch] = useReducer(userReducer, initialState);

  return (
    <UserContext.Provider value={{ state, dispatch }}>
      {children}
    </UserContext.Provider>
  );
};