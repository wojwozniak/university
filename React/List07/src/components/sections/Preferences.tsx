import { useState } from 'react'
import Button from '../../ui/Button'
import * as Select from '@radix-ui/react-select';
import * as Label from '@radix-ui/react-label';
import { CheckIcon, ChevronDownIcon, ChevronUpIcon } from '@radix-ui/react-icons';
import SelectItem from '../../ui/SelectItem';
import Notifications from './preferencesParts/Notifications';

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
      <Notifications notificationsSettings={notificationsSettings} handleNotificationsChange={handleNotificationsChange} />
      <Button text='Save preferences' onClick={() => { }} />
    </div>
  );
}

export default Preferences;