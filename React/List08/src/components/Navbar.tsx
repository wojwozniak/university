import React from 'react'
import "./Navbar.scss"

interface NavbarProps {
  darkMode: boolean;
  toggleTheme: () => void;
}

const links = [
  { href: "#header", text: "Home" },
  { href: "#about", text: "About" },
  { href: "#services", text: "Services" },
  { href: "#team", text: "Team" },
  { href: "#blog", text: "Blog" },
  { href: "#contact", text: "Contact" },
];

const Navbar: React.FC<NavbarProps> = ({ darkMode, toggleTheme }) => {
  return (
    <div className="navbar">
      {links.map((link, index) => (
        <a key={index} href={link.href}>
          {link.text}
        </a>
      ))}
      <button onClick={toggleTheme} className="theme-toggle-button">
        {darkMode ? "Light Mode" : "Dark Mode"}
      </button>
    </div>
  )
}

export default Navbar