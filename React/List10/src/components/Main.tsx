import { useContext, useState, useEffect } from 'react';
import { endpoints } from '../endpoints';
import { InfoContext } from '../InfoContext';
import { fetchData } from '../functions/fetchData';
import CategorySelector from '../ui/CategorySelector';
import GameScreen from '../ui/GameScreen';



const Main = () => {
  const { state, dispatch } = useContext(InfoContext);
  const [loaded, setLoaded] = useState<boolean>(false);

  useEffect(() => {
    const fetchItems = async () => {
      try {
        const items = await fetchData(endpoints);
        items.filter(cat => cat.categoryName != "");

        // Mały sleep żeby było widać że rzeczywiście jest loading screen
        await new Promise(resolve => setTimeout(resolve, 2000));

        dispatch({ type: "LOAD_DATA", payload: items });
        setLoaded(true);
      } catch (error) {
        console.error('Error fetching data:', error);
        setLoaded(true);
      }
    };

    if (!loaded) fetchItems();
  }, []);

  return (
    <div className="h-4/6 w-full flex flex-col items-center justify-between p-3">
      {!loaded && (
        <div className="flex justify-center items-center h-full">
          <div className="animate-spin rounded-full h-8 w-8 border-t-2 border-b-2 border-blue-400"></div>
        </div>
      )}
      {loaded && (state.selectedCategory === "" ? <CategorySelector /> : <GameScreen />)}
    </div>
  );
};

export default Main;