import * as Label from '@radix-ui/react-label';
import * as Switch from '@radix-ui/react-switch';

interface AdditionalProps {
  additionalData: boolean;
  handleAdditionalDataChange: (value: any) => void;
}

const Additional: React.FC<AdditionalProps> = ({ additionalData, handleAdditionalDataChange }) => {
  return (
    <div className='flex flex-col gap-2'>
      <Label.Root className="pr-15" htmlFor="additional">
        Collect additional data
      </Label.Root>
      <Switch.Root className="SwitchRoot w-10 h-6 bg-black-a9 rounded-full relative shadow-md tap-highlight-transparent"
        id="additional"
        onChange={handleAdditionalDataChange}
      >
        <Switch.Thumb
          defaultValue={additionalData ? 'checked' : 'unchecked'}
          className="SwitchThumb block w-5 h-5 bg-white rounded-full shadow-md" />
      </Switch.Root>
    </div>
  )
}

export default Additional