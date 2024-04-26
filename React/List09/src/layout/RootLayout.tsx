import { NavLink, Outlet, useLocation } from "react-router-dom";

const links = [
  { to: "/", text: "Home" },
  { to: "/about", text: "About Me" },
  { to: "/projects", text: "Projects" }
];

export default function RootLayout() {
  const location = useLocation();

  return (
    <div>
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
      <main>
        <Outlet />
      </main>
    </div>
  );
}