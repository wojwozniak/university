import * as Label from '@radix-ui/react-label';
import * as Slider from '@radix-ui/react-slider';

interface FrequencyProps {
  notificationFrequency: number;
  handleFrequencyChange: (value: any) => void;
}

const Frequency: React.FC<FrequencyProps> = ({ notificationFrequency, handleFrequencyChange }) => {
  return (
    <div id="slider">
      <Label.Root htmlFor="frequency"> Notification Frequency: </Label.Root>
      <Slider.Root className="relative flex items-center select-none touch-action-none w-40 h-5"
        defaultValue={[notificationFrequency]}
        max={100}
        step={1}
        onValueChange={handleFrequencyChange}>
        <Slider.Track className="bg-black relative flex-grow rounded-full h-0.5">
          <Slider.Range className="absolute bg-white rounded-full h-full" />
        </Slider.Track>
        <Slider.Thumb
          className="block w-5 h-5 bg-white shadow-md rounded-full hover:bg-violet-300 focus:bg-violet-700 focus:outline-none focus:shadow-outline"
          aria-label="Frequency" />
      </Slider.Root>
    </div>
  )
}

export default Frequency