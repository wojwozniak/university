import { createContext, useReducer } from "react";
import { State } from "./interfaces/State";
import { Action } from "./interfaces/Action";

const initialState: State = {
  user: "",
  currentScore: 0,
  selectedCategory: "",
  highScore: 0,
  data: []
}

const stateReducer = (state: State, action: Action): State => {
  switch (action.type) {
    case 'ADD_POINTS':
      state.currentScore += 1;
      if (state.currentScore > state.highScore) {
        state.highScore = state.currentScore;
      }
      return state;
    case 'ZERO_POINTS':
      state.currentScore = 0;
      return state;
    case 'CATEGORY_SCREEN':
      state.selectedCategory = "";
      return state;
    default:
      return state;
  };
}

export const InfoContext = createContext<{
  state: State;
  dispatch: React.Dispatch<Action>;
}>({
  state: initialState,
  dispatch: () => null,
});

export const InfoProvider = ({ children }: { children: React.ReactNode }) => {
  const [state, dispatch] = useReducer(stateReducer, initialState);

  return (
    <InfoContext.Provider value={{ state, dispatch }}>
      {children}
    </InfoContext.Provider>
  );
};