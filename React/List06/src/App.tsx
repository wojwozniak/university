import Navbar from "./components/Navbar"
import Main from "./components/Main"
import Footer from "./components/Footer"
import { UserProvider } from "./UserContext"

function App() {
  return (
    <UserProvider>
      <div id="root">
        <Navbar />
        <Main />
        <Footer />
      </div>
    </UserProvider>
  )
}

export default App
