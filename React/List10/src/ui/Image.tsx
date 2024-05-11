import React from 'react';
import placeholderImage from '../images/placeholder.png';

const MyImage = ({ url }: { url?: string | undefined }) => {
  return (
    <div className="w-[150px] h-[150px] mb-4 relative">
      {/* Placeholder Image */}
      <img
        src={placeholderImage}
        alt="Placeholder"
        className="object-cover w-full h-full"
      />
      {/* Main Image */}
      {url && (
        <img
          src={url}
          alt="Question Image"
          className="object-cover w-full h-full absolute top-0 left-0 opacity-0 transition-opacity duration-300"
          style={{ zIndex: -1 }}
          onLoad={(e: React.SyntheticEvent<HTMLImageElement>) => {
            (e.target as HTMLImageElement).style.opacity = '1';
          }}
        />
      )}
    </div>
  );
};

export default MyImage;