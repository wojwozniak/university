import React from 'react';

interface SkillProps {
  skill: string;
}

const Skill: React.FC<SkillProps> = ({ skill }) => {
  return (
    <div className="skill">{skill}</div>
  );
}

export default Skill;