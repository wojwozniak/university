import React from 'react'

interface NavbarProps {
  darkMode: boolean;
  toggleTheme: () => void;
}

const Navbar: React.FC<NavbarProps> = ({ darkMode, toggleTheme }) => {
  return (
    <div className="navbar">
      <a href="#header">Home</a>
      <a href="#about">About</a>
      <a href="#services">Services</a>
      <a href="#team">Team</a>
      <a href="#blog">Blog</a>
      <a href="#contact">Contact</a>
      <button onClick={toggleTheme} className="theme-toggle-button">
        {darkMode ? "Light Mode" : "Dark Mode"}
      </button>
    </div>
  )
}

export default Navbar