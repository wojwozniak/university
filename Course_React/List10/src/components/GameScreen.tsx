import { useContext, useState } from 'react';
import { InfoContext } from '../InfoContext';
import { Button } from '@mui/material';
import MyImage from '../ui/Image';
import { Stage } from '../interfaces/Stage';
import { generateStage } from '../functions/generateStage';
import { CategoryData } from '../interfaces/CategoryData';

const GameScreen = () => {
  const { state, dispatch } = useContext(InfoContext);
  const currentCategory: CategoryData = state.data.find(cat => cat.categoryName === state.selectedCategory) as CategoryData;
  const [stage, newStage] = useState<Stage>(generateStage(currentCategory.items));
  const [wrongClicked, setWrongClicked] = useState<boolean>(false);

  const getScreenText = (): string => {
    if (wrongClicked) return "Wrong answer!";
    else if (state.currentScore > 0) return "Good answer! Keep up the work!";
    else return "You can do it!";
  }

  const selectAnswer = (answer: string) => {
    if (answer === stage?.correctAnswer) {
      if (wrongClicked) { // nie dajemy punktów za poprawę złej odpowiedzi
        setWrongClicked(false);
      } else {
        dispatch({ type: "ADD_POINTS" });
      }

      newStage(generateStage(currentCategory.items));

    } else {
      setWrongClicked(true);
      dispatch({ type: "ZERO_POINTS" });
    }
  }

  return (
    <div className="flex flex-col items-center justify-center h-full">
      <h2 className="text-2xl font-bold mb-4 h-[64px] text-center">{stage.question}</h2>
      <MyImage url={stage.imageUrl} />
      <div className="grid grid-cols-2 gap-4 mt-10">
        {stage?.answers.map((option, index) => (
          <Button key={index}
            variant="contained"
            color="primary"
            className="w-[280px] h-[62px]"
            onClick={() => selectAnswer(option)}>
            {option}
          </Button>
        ))}
      </div>
      <p className='mt-10'>{getScreenText()}</p>
    </div>
  );
}

export default GameScreen;