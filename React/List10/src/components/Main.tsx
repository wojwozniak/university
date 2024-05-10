import { useState } from 'react';
import MainContent from './MainContent';
import { Endpoint } from '../interfaces/Endpoint';

const Main = () => {
  const [loaded, setLoaded] = useState<boolean>(true);

  const endpoints: Endpoint[] = [
    { category: "Potions", url: "https://api.potterdb.com/v1/potions" },
    { category: "Spells", url: "https://api.potterdb.com/v1/spells" }
  ];

  return (
    <div className="h-4/6 w-full flex flex-col items-center justify-between p-3">
      {loaded ? <MainContent /> : <></>}
    </div>
  )
}

export default Main