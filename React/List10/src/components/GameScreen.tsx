import { useContext, useEffect, useState } from 'react';
import { InfoContext } from '../InfoContext';
import { Button } from '@mui/material';
import MyImage from '../ui/Image';
import { Stage } from '../interfaces/Stage';
import { generateStage } from '../functions/generateStage';
import { CategoryData } from '../interfaces/CategoryData';


const GameScreen = () => {
  const { state } = useContext(InfoContext);
  const currentCategory: CategoryData = state.data.find(cat => cat.categoryName === state.selectedCategory) as CategoryData;
  const [stage, newStage] = useState<Stage>();

  useEffect(() => {
    newStage(generateStage(currentCategory.items));
  }, []);

  return (
    <div className="flex flex-col items-center justify-center h-full">
      <h2 className="text-2xl font-bold mb-4">{stage?.question}</h2>
      <MyImage url={stage?.imageUrl} />
      <div className="flex flex-col gap-4">
        {stage?.answers.map((option, index) => (
          <Button key={index} variant="contained" color="primary">
            {option}
          </Button>
        ))}
      </div>
    </div>
  );
}

export default GameScreen;