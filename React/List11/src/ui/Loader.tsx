import React, { ReactNode } from 'react';
interface LoaderProps {
  isLoading: boolean;
  error: any;
  children: ReactNode;
}

const Loader: React.FC<LoaderProps> = ({ isLoading, error, children }) => {
  if (isLoading) {
    return <div className="w-full h-full">
      Loading...
    </div>;
  }

  if (error) {
    return <p>Error loading books</p>;
  }

  return <>{children}</>;
};

export default Loader;