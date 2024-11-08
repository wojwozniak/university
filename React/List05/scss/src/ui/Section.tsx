import React from 'react';
import "./Section.scss";

interface SectionProps {
  children: React.ReactNode;
  headerText: string;
  name: string;
}

const Section: React.FC<SectionProps> = ({ children, headerText, name }) => {
  return (
    <section id={name} className={"section " + name}>
      <div className="section-content">
        <h2>
          {headerText}
        </h2>
        {children}
      </div>
    </section>
  );
};

export default Section;