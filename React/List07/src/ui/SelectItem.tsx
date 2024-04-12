import React from 'react'
import * as Select from '@radix-ui/react-select';
import { CheckIcon } from '@radix-ui/react-icons';

interface SelectItemProps {
  children: React.ReactNode;
  value: string;
}

const SelectItem: React.FC<SelectItemProps> = (({ children, value }) => {
  return (
    <Select.Item
      value={value}
      className="text-sm leading-none text-violet-900 rounded-md flex items-center h-6 px-7 relative select-none">
      <Select.ItemText>{children}</Select.ItemText>
      <Select.ItemIndicator className="SelectItemIndicator">
        <CheckIcon />
      </Select.ItemIndicator>
    </Select.Item>
  );
});

export default SelectItem