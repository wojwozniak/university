import React from 'react';
import Skill from './Skill';

interface SkillsProps {
  skills: string[];
}

const Skills: React.FC<SkillsProps> = ({ skills }) => {
  return (
    <div className="skills">
      <h2>Skills</h2>
      <ul>
        {skills.map((skill, index) => (
          <Skill key={index} skill={skill} />
        ))}
      </ul>
    </div>
  );
}

export default Skills;