import MainTable from "./MainTable"

const Main = () => {
  return (
    <div className="py-20 w-full flex items-center justify-center bg-gray-300">
      <div className="w-[90%] flex flex-col items-end gap-2 justify-center">
        <MainTable />
      </div>
    </div>
  )
}

export default Main