import React from 'react'
import { useTheme } from '@emotion/react';
import { CustomTheme } from '../../themes';

interface LinkItem {
  text: string;
  href: string;
}

const links: LinkItem[] = [
  { text: 'Home', href: '#header' },
  { text: 'About', href: '#about' },
  { text: 'Services', href: '#services' },
  { text: 'Team', href: '#team' },
  { text: 'Blog', href: '#blog' },
  { text: 'Contact', href: '#contact' },
];

interface NavbarProps {
  darkMode: boolean;
  toggleTheme: () => void;
}

const Navbar: React.FC<NavbarProps> = ({ darkMode, toggleTheme }) => {
  const theme = useTheme() as CustomTheme;

  return (
    <div css={{
      position: "sticky",
      top: "0",
      padding: "10px 0",
      textAlign: "center",
      zIndex: 1000,
      backgroundColor: theme.navbarBackgroundColor,
    }}>
      {links.map((link) => (
        <a key={link.href}
          href={link.href}
          css={{
            textDecoration: "none",
            padding: "0 20px",
            color: theme.linkColor,
          }}>
          {link.text}
        </a>
      ))}
      <button onClick={toggleTheme} css={{
        cursor: 'pointer',
        padding: '10px 20px',
        transition: 'background-color 0.3s ease',
        backgroundColor: theme.modeBackgroundColor,
        color: theme.modeColor,
        '&:hover': {
          backgroundColor: theme.modeHoverBackgroundColor
        }
      }}>
        {darkMode ? "Light Mode" : "Dark Mode"}
      </button>
    </div >
  )
}

export default Navbar