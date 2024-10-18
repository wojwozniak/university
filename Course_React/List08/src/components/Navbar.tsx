import React from 'react'

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
    <div className="sticky top-0 py-[10px] text-center z-[1000] bg-tained-harder-white dark:bg-black-tainted">
      {links.map((link, index) => (
        <a key={index}
          href={link.href}
          className='px-5 no-underline text-gray dark:text-white'>
          {link.text}
        </a>
      ))}
      <button onClick={toggleTheme}
        className="cursor-pointer px-5 py-[10px] transition duration-300 ease-in-out bg-gray text-white rounded cursor-pointer hover:bg-light-gray dark:bg-dark-white dark:color-gray dark:hover:bg-darker-white">
        {darkMode ? "Light Mode" : "Dark Mode"}
      </button>
    </div>
  )
}

export default Navbar