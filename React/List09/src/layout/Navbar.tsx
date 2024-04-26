import { NavLink, useLocation } from "react-router-dom";

const links = [
  { to: "/", text: "Home" },
  { to: "/about", text: "About Me" },
  { to: "/projects", text: "Projects" }
];
const Navbar = () => {
  const location = useLocation();

  return (
    <nav>
      <ul className="flex justify-center gap-3">
        {links.map(({ to, text }) => (
          <li key={to}>
            <NavLink
              to={to}
              className={({ isActive }) => `${isActive ? "underline" : ""}`}
              state={{ from: location.pathname }}
            >
              {text}
            </NavLink>
          </li>
        ))}
      </ul>
    </nav>
  )
}

export default Navbar