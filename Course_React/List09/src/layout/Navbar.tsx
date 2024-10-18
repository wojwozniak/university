import { useState } from "react";
import { NavLink } from "react-router-dom";

const links = [
  { to: "/", text: "Home" },
  { to: "/about", text: "About Me" },
  { to: "/projects", text: "Projects" }
];

const Navbar = () => {
  const [active, setActive] = useState<string>("/");

  return (
    <nav className="bg-gray-800 shadow-md">
      <div className="container mx-auto px-4 py-3">
        <ul className="flex justify-center items-center gap-6">
          {links.map(({ to, text }) => (
            <li key={to}>
              <NavLink
                to={to}
                className="text-white hover:text-gray-300 transition duration-300 active:text-blue-500"
                onClick={() => setActive(to)}
                style={active === to ? { textDecoration: 'underline' } : {}}
              >
                {text}
              </NavLink>
            </li>
          ))}
        </ul>
      </div>
    </nav>
  )
}

export default Navbar;
