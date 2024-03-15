import { useContext } from 'react'
import { RecipeContext } from '../RecipeContext';
import SingleRecipe from './SingleRecipe';
import { Recipe } from '../interfaces/Recipe';

const RecipeList = () => {
  const { state } = useContext(RecipeContext);
  const { filterForFavorite, searchQuery, recipes, favorites } = state;

  const getFavoriteRecipes = (recipes: Recipe[]): Recipe[] => {
    return recipes.filter(recipe => favorites.includes(recipe.id));
  }

  const getFilteredRecipes = (recipes: Recipe[]): Recipe[] => {
    if (searchQuery === '') return recipes;

    /* 
      Nie wiem czy mamy sprawdzać słowa kluczowe jako jedno query, czy jako osobne
      dla każdego słowa w query - zrobiłem dwie wersje
     */

    const searchForEveryWordSeparately = true;

    if (!searchForEveryWordSeparately) {
      return recipes.filter(recipe => {
        return recipe.name.toLowerCase().includes(searchQuery.toLowerCase())
          || recipe.description.toLowerCase().includes(searchQuery.toLowerCase())
      });
    } else {
      const queryWords = searchQuery.toLowerCase().split(' ');
      return recipes.filter(recipe => {
        return queryWords.every(word => {
          return recipe.name.toLowerCase().includes(word)
            || recipe.description.toLowerCase().includes(word)
        });
      });
    }
  }

  const getRecipesAfterFilter = (recipes: Recipe[]): Recipe[] => {
    if (filterForFavorite && searchQuery.length > 0) {
      return getFavoriteRecipes(getFilteredRecipes(recipes));
    }
    else if (filterForFavorite) {
      return getFavoriteRecipes(recipes);
    } else if (searchQuery.length > 0) {
      return getFilteredRecipes(recipes);
    } else {
      return recipes;
    }
  }

  return (
    <main id="list" className='w-3/5 p-2'>
      {getRecipesAfterFilter(recipes).map((recipe, index) => <SingleRecipe key={index} recipe={recipe} />)}
    </main>
  )
}


export default RecipeList