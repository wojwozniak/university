import { useState } from 'react'
import Button from '../../ui/Button'
import Notifications from './preferencesParts/Notifications';
import Frequency from './preferencesParts/Frequency';
import Additional from './preferencesParts/Additional';

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
    <div id="preferences" className='flex flex-col items-start gap-2 w-full h-full'>
      <h2 className='text-l mb-5'>
        Change preferences here. Click save when you're done.
      </h2>
      <Notifications notificationsSettings={notificationsSettings} handleNotificationsChange={handleNotificationsChange} />
      <Frequency notificationFrequency={notificationFrequency} handleFrequencyChange={handleFrequencyChange} />
      <Additional additionalData={additionalData} handleAdditionalDataChange={handleAdditionalDataChange} />
      <Button text='Save preferences' onClick={() => { }} />
    </div>
  );
}

export default Preferences;