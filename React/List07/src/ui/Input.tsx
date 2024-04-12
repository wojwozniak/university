import React from 'react'

import * as Label from '@radix-ui/react-label';

interface InputProps {
  value: string;
  handleValueChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
}

const Input: React.FC<InputProps> = ({ value, handleValueChange }) => {
  return (
    <div>
      <Label.Root htmlFor="name" className="Label">Full Name:</Label.Root>
      <input
        type="text"
        id="name"
        value={value}
        onChange={handleValueChange}
        className="border border-gray-300 rounded px-3 py-2 w-full bg-white"
      />
    </div>
  )
}

export default Input