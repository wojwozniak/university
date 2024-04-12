import React from 'react'

import * as Label from '@radix-ui/react-label';

interface InputProps {
  label: string;
  value: string;
  handleValueChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
}

const Input: React.FC<InputProps> = ({ label, value, handleValueChange }) => {
  return (
    <div className='flex flex-col my-1'>
      <Label.Root htmlFor="name">{label}</Label.Root>
      <input
        type="text"
        id="name"
        value={value}
        onChange={handleValueChange}
        className="border border-gray-300 rounded px-3 py-2 w-4/5 bg-white text-purple-500"
      />
    </div>
  )
}

export default Input