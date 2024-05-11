import { useContext } from 'react';
import { InfoContext } from '../InfoContext';

const Bottombar = () => {
  const { state } = useContext(InfoContext);

  return (
    <div className="flex flex-col justify-center items-center h-[12%] bg-blue-900 w-full rounded-b-xl text-white">
      <p className="text-m">
        Username: {state.user}
      </p>
      <div className='flex flex-row justify-between w-full px-5'>
        <p className="text-m">
          Current Score: {state.currentScore}
        </p>
        <p className="text-m">
          High Score: {state.highScore}
        </p>
      </div>
    </div>
  );
};

export default Bottombar;