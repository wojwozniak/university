import React, { useState } from 'react'
import Button from '../../ui/Button'
import Input from '../../ui/Input'

const Password = () => {
  const [password, setPassword] = useState('');
  const [newPassword, setNewPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');

  const handlePasswordChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setPassword(event.target.value);
  };

  const handleNewPasswordChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setNewPassword(event.target.value);
  };

  const handleConfirmPasswordChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setConfirmPassword(event.target.value);
  };

  return (
    <div id="password">
      <h2 className='text-l mb-5'>
        Change your password here. After saving, you'll be logged out.
      </h2>
      <Input label={"Current password:"} value={password} handleValueChange={handlePasswordChange} />
      <Input label={"New password:"} value={newPassword} handleValueChange={handleNewPasswordChange} />
      <Input label={"Confirm password:"} value={confirmPassword} handleValueChange={handleConfirmPasswordChange} />
      <Button text='Change password' onClick={() => { }} />
    </div>
  )
}

export default Password