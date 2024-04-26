import { useEffect, useState } from 'react';
import { Skeleton } from '@mui/material';
import pfp from '../assets/pfp.png';

const Pfp = () => {
  const [imageLoaded, setImageLoaded] = useState(false);

  const handleImageLoaded = () => {
    setImageLoaded(true);
  };
  useEffect(() => {
    handleImageLoaded();
    return () => {
      setImageLoaded(false);
    };
  }, []);

  return (
    <div className="rounded-full overflow-hidden border-4 border-white h-48 w-48 flex items-center justify-center">
      {!imageLoaded && (
        <Skeleton animation="wave" width={192} height={192} variant="circular" />
      )}
      <img
        className={`h-full w-full object-cover ${!imageLoaded ? 'hidden' : ''}`}
        src={pfp}
        alt="Zdjęcie profilowe"
        onLoad={handleImageLoaded}
      />
    </div>
  );
};

export default Pfp;