import { CardMedia, Skeleton } from "@mui/material";
import { useState } from "react";

const MyImage = ({ imageUrl }: { imageUrl: string }) => {
  const [loaded, setLoaded] = useState(false);

  const handleLoad = () => {
    setLoaded(true);
  };

  return (
    <div className="h-200 w-full relative overflow-hidden">
      <div className="pt-full relative">
        {!loaded && (
          <Skeleton
            height={200}
            width={200}
            animation="wave"
            variant="rectangular"
            className="absolute top-0 left-0 w-full h-full"
          />
        )}
        <CardMedia
          component="img"
          height="200"
          image={imageUrl}
          alt="Example Photo"
          onLoad={handleLoad}
        />
      </div>
    </div>
  );
};

export default MyImage;