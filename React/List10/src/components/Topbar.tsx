import { useContext } from 'react'
import { InfoContext } from '../InfoContext';

const Topbar = () => {
  const { state } = useContext(InfoContext);

  return (
    <div className="h-1/10 bg-blue-900 w-full rounded-t-xl p-4 text-white text-2xl font-bold">
      {state.selectedCategory == "" ? "Harry Potter Quiz" : `Harry Potter Quiz: ${state.selectedCategory}`}
    </div>
  )
}

export default Topbar