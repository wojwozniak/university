import { createContext, useEffect, useReducer } from "react";
import { State } from "./interfaces/State";
import { Action } from "./interfaces/Action";

const generateUserName = (): string => {
  const adjectives = ["Brave", "Clever", "Daring", "Energetic", "Friendly"];
  const nouns = ["Wizard", "Witch", "Sorcerer", "Enchanter", "Magician"];
  const randomAdjective = adjectives[Math.floor(Math.random() * adjectives.length)];
  const randomNoun = nouns[Math.floor(Math.random() * nouns.length)];
  return `${randomAdjective} ${randomNoun}`;
};

const initialState: State = {
  user: localStorage.getItem("user") || generateUserName(),
  currentScore: 0,
  selectedCategory: "",
  highScore: parseInt(localStorage.getItem("highScore") || "0", 10),
  data: []
}

const stateReducer = (state: State, action: Action): State => {
  switch (action.type) {
    case 'ADD_POINTS':
      const updatedScore = state.currentScore + 1;
      const updatedHighScore = Math.max(state.highScore, updatedScore);
      localStorage.setItem("highScore", updatedHighScore.toString());
      return {
        ...state,
        currentScore: updatedScore,
        highScore: updatedHighScore
      };
    case 'ZERO_POINTS':
      localStorage.setItem("highScore", "0");
      return {
        ...state,
        currentScore: 0,
        highScore: 0
      };
    case 'CATEGORY_SCREEN':
      return {
        ...state,
        selectedCategory: ""
      };
    case 'LOAD_DATA':
      state.data = [];  // Moglibyśmy tego nie robić, a przed pobraniem sprawdzać co już mamy
      action.payload.forEach(cat => {
        state.data.push(cat);
      });
      return state;
    default:
      return state;
  }
};

export const InfoContext = createContext<{
  state: State;
  dispatch: React.Dispatch<Action>;
}>({
  state: initialState,
  dispatch: () => null,
});

export const InfoProvider = ({ children }: { children: React.ReactNode }) => {
  const [state, dispatch] = useReducer(stateReducer, initialState);

  useEffect(() => {
    localStorage.setItem("user", state.user);
  }, [state.user]);

  return (
    <InfoContext.Provider value={{ state, dispatch }}>
      {children}
    </InfoContext.Provider>
  );
};