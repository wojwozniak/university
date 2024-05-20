import React, { ReactNode } from 'react';

interface LoaderProps {
  isLoading: boolean;
  error: any | any[];
  children: ReactNode;
}

const ErrorDisplay: React.FC<{ error: any | any[] }> = ({ error }) => {
  if (Array.isArray(error)) {
    return (
      <div>
        {error.map((err, index) => (
          <p key={index}>{err}</p>
        ))}
      </div>
    );
  }
  return <p>{error}</p>;
};

const Loader: React.FC<LoaderProps> = ({ isLoading, error, children }) => {
  if (isLoading) {
    return <p>Error loading books</p>;
  }

  let displayError = false;
  if (Array.isArray(error)) {
    error.forEach(err => (err === true ? displayError = true : null))
  } else if (error) { displayError = true }
  if (displayError) {
    return <ErrorDisplay error={error} />;
  }

  return <>{children}</>;
};

export default Loader;