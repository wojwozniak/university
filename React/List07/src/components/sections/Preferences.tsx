import { useState } from 'react'
import Button from '../../ui/Button'
import Notifications from './preferencesParts/Notifications';
import Frequency from './preferencesParts/Frequency';
import * as Label from '@radix-ui/react-label';

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
      <Frequency notificationFrequency={notificationFrequency} handleFrequencyChange={handleFrequencyChange} />
      <Button text='Save preferences' onClick={() => { }} />
    </div>
  );
}

export default Preferences;