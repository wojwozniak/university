import React, { createContext, useReducer } from 'react';
import { Action } from './interfaces/Action';
import { RecipeState } from "./interfaces/RecipeState";
import { exampleRecipes } from './exampleData/exampleRecipes';
import { exampleFavorites } from './exampleData/exampleFavorites';

const initialState: RecipeState = {
  recipes: exampleRecipes,
  favorites: exampleFavorites,
  filterOutFinished: false,
  searchQuery: '',
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
    case 'SET_FILTER_OUT_FINISHED':
      return {
        ...state,
        filterOutFinished: action.filterOutFinished,
      };
    case 'SET_SEARCH_QUERY':
      return {
        ...state,
        searchQuery: action.searchQuery,
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