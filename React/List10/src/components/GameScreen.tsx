import React, { useContext } from 'react';
import { InfoContext } from '../InfoContext';
import { Button } from '@mui/material';

// Import placeholder image
import placeholderImage from '../placeholder.png';

const GameScreen = () => {
  const { state } = useContext(InfoContext);

  return (
    <div className="flex flex-col items-center justify-center h-full">
      {/* Question Title */}
      <h2 className="text-2xl font-bold mb-4">{state.question.title}</h2>

      {/* Image Container */}
      <div className="w-36 h-36 mb-4">
        {/* Placeholder Image */}
        <img
          src={placeholderImage}
          alt="Placeholder"
          className="object-cover w-full h-full"
        />

        {/* Main Image */}
        <img
          src={state.question.image}
          alt="Question Image"
          className="object-cover w-full h-full absolute top-0 left-0 opacity-0 transition-opacity duration-300"
          style={{ zIndex: -1 }}
          // Show the main image once it's loaded
          onLoad={(e) => {
            e.target.style.opacity = 1;
          }}
        />
      </div>

      {/* Answer Options */}
      <div className="flex flex-col gap-4">
        {state.question.options.map((option, index) => (
          <Button key={index} variant="contained" color="primary">
            {option}
          </Button>
        ))}
      </div>
    </div>
  );
}

export default GameScreen;