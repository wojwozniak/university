import { InfoProvider } from "./InfoContext"
import Main from "./components/Main"

function App() {
  return (
    <InfoProvider>
      <div className="bg-gradient-to-b from-purple-900 via-purple-500 to-blue-300 h-screen flex justify-center items-center">
        <div className="bg-blue-300 w-96 h-96 rounded-xl flex flex-col justify-between items-center">
          <div className="h-1/6 bg-blue-900 w-full rounded-t-xl p-4 text-white text-2xl font-bold">
            Harry Potter Quiz
          </div>
          <Main />
          <div className="h-1/6 bg-blue-900 w-full rounded-b-xl"></div>
        </div>
      </div>
    </InfoProvider>
  )
}

export default App
