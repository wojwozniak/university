import { useTheme } from '@emotion/react';
import React from 'react';
import { CustomTheme } from '../../themes';

interface SectionProps {
  children: React.ReactNode;
  headerText: string;
  name: string;
  styles?: any;
  sectionContentStyles?: any;
}

const Section: React.FC<SectionProps> = ({
  children,
  headerText,
  name,
  styles,
  sectionContentStyles
}) => {
  const theme = useTheme() as CustomTheme;
  return (
    <section id={name} className={name} css={{
      padding: "20px 0",
      "&:nth-child(even)": {
        backgroundColor: theme.sectionNchildBackgroundColor
      },
      ...styles
    }}>
      <div css={{
        maxWidth: "800px",
        margin: "0 auto",
        ...sectionContentStyles
      }}>
        <h2 css={{
          fontSize: "2.5em",
          marginBottom: "20px",
          display: "inline-block"
        }}>
          {headerText}
        </h2>
        {children}
      </div>
    </section>
  );
};

export default Section;