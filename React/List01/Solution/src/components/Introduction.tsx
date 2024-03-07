import React from 'react';

interface IntroductionProps {
  photoUrl: string;
  firstName: string;
  lastName: string;
  companyName: string;
}

const Introduction: React.FC<IntroductionProps> = ({ photoUrl, firstName, lastName, companyName }) => {
  return (
    <div className="introduction">
      <div className="photo">
        <img src={photoUrl} alt="Profile" />
      </div>
      <div className="name">
        {firstName} {lastName}
      </div>
      <div className="company">{companyName}</div>
    </div>
  );
}

export default Introduction;