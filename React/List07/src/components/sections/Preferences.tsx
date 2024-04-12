import { useState } from 'react'
import Button from '../../ui/Button'
import * as Select from '@radix-ui/react-select';
import * as Label from '@radix-ui/react-label';
import { CheckIcon, ChevronDownIcon, ChevronUpIcon } from '@radix-ui/react-icons';
import SelectItem from '../../ui/SelectItem';

const Preferences = () => {
  const [notificationsSettings, setNotificationsSettings] = useState('All');
  const [notificationFrequency, setNotificationFrequency] = useState(50);
  const [additionalData, setAdditionalData] = useState(false);

  const handleNotificationsChange = (value: any) => {
    setNotificationsSettings(value);
  };

  const handleFrequencyChange = (value: any) => {
    setNotificationFrequency(value);
  };

  const handleAdditionalDataChange = () => {
    setAdditionalData((prev) => !prev);
  };

  return (
    <div id="preferences">
      <h2 className='text-l mb-5'>
        Change preferences here. Click save when you're done.
      </h2>
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
                  <SelectItem value="all">All</SelectItem>
                  <SelectItem value="onlyfollowed">Only Followed</SelectItem>
                  <SelectItem value="none">None</SelectItem>
                </Select.Group>
              </Select.Viewport>
            </Select.Content>
          </Select.Portal>
        </Select.Root>
      </div>
      <Button text='Save preferences' onClick={() => { }} />
    </div>
  );
}

export default Preferences;