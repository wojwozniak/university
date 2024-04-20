import React from 'react';
import "./Section.scss";

interface SectionProps {
  children: React.ReactNode;
  headerText: string;
  name: string;
}

const Section: React.FC<SectionProps> = ({ children, headerText, name }) => {
  return (
    <section id={name} className={"py-5 " + name}>
      <div className="max-w-800 mx-auto">
        <h2 className='text-3xl mb-5 inline-block'>
          {headerText}
        </h2>
        {children}
      </div>
    </section>
  );
};

export default Section;