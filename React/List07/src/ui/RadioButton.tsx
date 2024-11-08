import * as Label from '@radix-ui/react-label';
import * as RadioGroup from '@radix-ui/react-radio-group';

interface RadioButtonProps {
  id: string;
  value: string;
  children: React.ReactNode;
}

const RadioButton: React.FC<RadioButtonProps> = ({ id, value, children }) => (
  <div className="flex items-center mb-2">
    <RadioGroup.Item value={value} id={id}>
      <div className="h-[20px] w-[20px] bg-black rounded-lg relative" />
      <RadioGroup.Indicator className="RadioGroupIndicator">
        <div className="h-[10px] w-[10px] bg-purple-500 rounded-full absolute z-10 translate-x-[5px] translate-y-[-15px]" />
      </RadioGroup.Indicator>
    </RadioGroup.Item>
    <Label.Root htmlFor={id} className="Label ml-2">{children}</Label.Root>
  </div>
);

export default RadioButton;