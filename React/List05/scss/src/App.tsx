import { useState } from "react";
import "./App.css";
import Navbar from "./top/Navbar";
import Header from "./top/Header";
import Footer from "./Footer";
import Sections from "./Sections";

const App = () => {
  const [darkMode, setDarkMode] = useState(false);

  const toggleTheme = () => {
    setDarkMode(!darkMode);
  };

  return (
    <div className={`portfolio ${darkMode ? "dark-theme" : "light-theme"}`}>
      <Navbar darkMode={darkMode} toggleTheme={toggleTheme} />
      <Header />
      <Sections />
      <Footer />
    </div>
  );
};

export default App;
