import React from 'react'

interface PopupProps {
  component: React.ReactNode,
  render: boolean,
  updateRender: React.Dispatch<React.SetStateAction<boolean>>
}

const Popup = ({ component, render, updateRender }: PopupProps) => {
  return (
    render &&
    <div className='fixed top-0 left-0 w-full h-full bg-black bg-opacity-50 flex justify-center items-center'>
      <div className='bg-white p-4 rounded-lg'>
        {component}
      </div>
      <button className='fixed top-0 right-0 text-white bg-red-500 hover:bg-red-700 m-2 p-4 rounded-lg w-[60px] h-[60px]'
        onClick={() => updateRender(false)}
      >
        X
      </button>
    </div>
  )
}

export default Popup