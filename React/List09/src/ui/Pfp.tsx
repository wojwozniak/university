import { useEffect, useState } from 'react';
import { Skeleton } from '@mui/material';
import pfp from '../assets/pfp.png';

interface PfpProps {
  size: string;
}

const Pfp: React.FC<PfpProps> = ({ size }) => {
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

  const bigSize = {
    widthString: '192px',
    heightString: '192px',
    width: 192,
    height: 192
  };

  const smallSize = {
    widthString: '92px',
    heightString: '92px',
    width: 92,
    height: 92
  };

  const setting = size === 'big' ? bigSize : smallSize;

  return (
    <div className="rounded-full overflow-hidden border-4 border-white flex items-center justify-center"
      style={{ width: setting.widthString, height: setting.heightString }}>
      {!imageLoaded && (
        <Skeleton animation="wave" width={setting.width} height={setting.height} variant="circular" />
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