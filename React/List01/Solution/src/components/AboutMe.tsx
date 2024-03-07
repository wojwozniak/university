import React from 'react';

interface AboutMeProps {
  bio: string;
}

const AboutMe: React.FC<AboutMeProps> = ({ bio }) => {
  return (
    <div className="about-me">
      <h2>About Me</h2>
      <p>{bio}</p>
    </div>
  );
}

export default AboutMe;