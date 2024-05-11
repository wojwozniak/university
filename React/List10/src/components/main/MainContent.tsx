import { useContext } from 'react';
import { InfoContext } from '../../InfoContext';
import CategorySelector from '../../ui/CategorySelector';
import GameScreen from '../../ui/GameScreen';

const MainContent = () => {
  const { state } = useContext(InfoContext);

  return (
    state.selectedCategory === "" ? <CategorySelector /> : <GameScreen />
  );
}

export default MainContent;