import { RecipeProvider } from "./RecipeContext"
import Navbar from "./components/Navbar"
import RecipeList from "./components/RecipeList"

function App() {
  return (
    <RecipeProvider>
      <div id="root">
        <Navbar />
        <RecipeList />
      </div>
    </RecipeProvider>
  )
}

export default App
