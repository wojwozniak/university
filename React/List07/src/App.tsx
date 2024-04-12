import Main from "./components/Main"

function App() {
  const gradient = { background: 'linear-gradient(120deg, #ff6ec4, #32e0c4)' }
  return (
    <div id="root"
      className="flex flex-row p-4 h-screen w-screen items-center justify-center"
      style={gradient}>
      <Main />
    </div>
  )
}

export default App
