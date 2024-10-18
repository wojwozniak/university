import Navbar from "./components/Navbar"
import Main from "./components/Main"
import Footer from "./components/Footer"
import { UserProvider } from "./UserContext"
import { ThemeProvider, createTheme } from "@mui/material";

function App() {
  const theme = createTheme(
    {
      palette: {
        primary: { main: '#1299d2' },
        background: {
          default: '#d3d3f3'
        }
      }
    }
  );

  return (
    <ThemeProvider theme={theme}>
      <UserProvider>
        <div id="root">
          <Navbar />
          <Main />
          <Footer />
        </div>
      </UserProvider>
    </ThemeProvider>
  )
}

export default App