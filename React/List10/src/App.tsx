import { InfoProvider } from "./InfoContext"
import Bottombar from "./components/Bottombar"
import Topbar from "./components/Topbar"
import Main from "./components/Main"

function App() {
  return (
    <InfoProvider>
      <div className="bg-gradient-to-b from-purple-900 via-purple-500 to-blue-300 h-screen flex justify-center items-center">
        <div className="bg-blue-300 w-96 h-96 rounded-xl flex flex-col justify-between items-center">
          <Topbar />
          <Main />
          <Bottombar />
        </div>
      </div>
    </InfoProvider>
  )
}

export default App
