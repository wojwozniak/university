import BookTable from "./components/BookTable"
import Header from "./components/Header"
import Popup from "./ui/Popup";
import { useState } from "react";

function App() {
  const [isOpen, setOpen] = useState(false);

  const openPopup = () => {
    setOpen(true);
  }

  const closePopup = () => {
    setOpen(false);
  }

  return (
    <div>
      <Popup open={isOpen} onClose={closePopup} onSave={() => { }}>
        <p>test</p>
      </Popup>
      <Header openPopup={openPopup} />
      <BookTable />
    </div>

  )
}

export default App
