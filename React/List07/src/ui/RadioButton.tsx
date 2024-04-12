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
      <RadioGroup.Indicator className="RadioGroupIndicator">
        <div className="h-[10px] w-[10px] bg-black" />
      </RadioGroup.Indicator>
    </RadioGroup.Item>
    <Label.Root htmlFor={id} className="Label ml-2">{children}</Label.Root>
  </div>
);

export default RadioButton;