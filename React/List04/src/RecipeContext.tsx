import React, { createContext, useReducer } from 'react';
import { Recipe } from "./interfaces/Recipe";
import { RecipeState } from "./interfaces/RecipeState";
import { exampleRecipes } from './exampleRecipes';

type Action =
  | { type: 'ADD_RECIPE'; recipe: Recipe }
  | { type: 'REMOVE_RECIPE'; id: number }
  | { type: 'ADD_TO_FAVORITES'; id: number }
  | { type: 'REMOVE_FROM_FAVORITES'; id: number };

const initialState: RecipeState = {
  recipes: exampleRecipes,
  favorites: [],
};

const recipeReducer = (state: RecipeState, action: Action): RecipeState => {
  switch (action.type) {
    case 'ADD_RECIPE':
      return {
        ...state,
        recipes: [...state.recipes, action.recipe],
      };
    case 'REMOVE_RECIPE':
      return {
        ...state,
        recipes: state.recipes.filter(recipe => recipe.id !== action.id),
      };
    case 'ADD_TO_FAVORITES':
      return {
        ...state,
        favorites: [...state.favorites, action.id],
      };
    case 'REMOVE_FROM_FAVORITES':
      return {
        ...state,
        favorites: state.favorites.filter(id => id !== action.id),
      };
    default:
      return state;
  }
};

export const RecipeContext = createContext<{
  state: RecipeState;
  dispatch: React.Dispatch<Action>;
}>({
  state: initialState,
  dispatch: () => null,
});

export const RecipeProvider = ({ children }: { children: React.ReactNode }) => {
  const [state, dispatch] = useReducer(recipeReducer, initialState);

  return (
    <RecipeContext.Provider value={{ state, dispatch }}>
      {children}
    </RecipeContext.Provider>
  );
};