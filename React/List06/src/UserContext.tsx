import { createContext, useReducer } from "react";
import { UserData } from "./types/UserData";

const initialState: UserData = {
  id: 0,
  name: 'Example User',
  email: 'example@mail.com',
  avatar: "http://placeholder.co/200",
};

export const UserContext = createContext<{
  state: UserData;
  dispatch: React.Dispatch<string>;
}>({
  state: initialState,
  dispatch: () => null,
});

const userReducer = (state: UserData, action: string): UserData => {
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