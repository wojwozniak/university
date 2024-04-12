import * as Select from '@radix-ui/react-select';
import * as Label from '@radix-ui/react-label';
import { ChevronDownIcon, ChevronUpIcon } from '@radix-ui/react-icons';
import SelectItem from '../../../ui/SelectItem';

interface NotificationsProps {
  notificationsSettings: string;
  handleNotificationsChange: (value: any) => void;
}

const Notifications: React.FC<NotificationsProps> = ({ notificationsSettings, handleNotificationsChange }) => {
  return (
    <div className='flex flex-col my-1 items-start'>
      <Label.Root htmlFor="name">
        Notification Settings:
      </Label.Root>
      <Select.Root onValueChange={handleNotificationsChange}>
        <Select.Trigger
          className="inline-flex items-center w-[25%] border my-2 justify-center rounded-md px-4 text-sm leading-none h-9 gap-1 bg-white text-violet-900 shadow-md"
          aria-label="Notifications">
          <Select.Value placeholder={notificationsSettings} />
          <Select.Icon className="SelectIcon">
            <ChevronDownIcon />
          </Select.Icon>
        </Select.Trigger>
        <Select.Portal>
          <Select.Content className="overflow-hidden bg-white rounded-lg shadow-xl">
            <Select.ScrollUpButton className="SelectScrollButton">
              <ChevronUpIcon />
            </Select.ScrollUpButton>
            <Select.Viewport className="p-2">
              <Select.Group>
                <SelectItem value="All">All</SelectItem>
                <SelectItem value="Only Followed">Only Followed</SelectItem>
                <SelectItem value="None">None</SelectItem>
              </Select.Group>
            </Select.Viewport>
          </Select.Content>
        </Select.Portal>
      </Select.Root>
    </div>
  )
}

export default Notifications