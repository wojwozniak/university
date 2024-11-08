import { useState } from "react";
import "./styles.css";
import Navbar from "./Navbar";
import Footer from "./Footer";
import Services from "./Services";
import Contact from "./Contact";
import Header from "./Header";
import About from "./About";
import Team from "./Team";
import Blog from "./Blog";

const App = () => {
  const [darkMode, setDarkMode] = useState(false);

  const toggleTheme = () => {
    setDarkMode(!darkMode);
  };

  return (
    <div className={`portfolio ${darkMode ? "dark-theme" : "light-theme"}`}>
      <Navbar darkMode={darkMode} toggleTheme={toggleTheme} />
      <Header />
      <div className="content-card">
        <About />
        <Services />
        <Team />
        <Blog />
        <Contact />
      </div>
      <Footer />
    </div>
  );
};

export default App;
