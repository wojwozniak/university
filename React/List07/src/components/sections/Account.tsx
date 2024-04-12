import React, { useState } from 'react'
import Button from '../../ui/Button'
import * as Label from '@radix-ui/react-label';
import * as RadioGroup from '@radix-ui/react-radio-group';
import RadioButton from '../../ui/RadioButton';
import Input from '../../ui/Input';

const Account = () => {
  const [name, setName] = useState('');
  const [username, setUsername] = useState('');
  const [gender, setGender] = useState('');

  const handleNameChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setName(event.target.value);
  };

  const handleUsernameChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setUsername(event.target.value);
  };

  const handleGenderChange = (value: string) => {
    setGender(value);
  };

  const handleSubmit = () => {
    console.log('Form submitted:', { name, username, gender });
  };

  return (
    <form onSubmit={handleSubmit}>
      <Input label={"Name:"} value={name} handleValueChange={handleNameChange} />
      <Input label={"Username:"} value={username} handleValueChange={handleUsernameChange} />
      <RadioGroup.Root value={gender} onValueChange={handleGenderChange} aria-label="Gender">
        <Label.Root>Gender:</Label.Root>
        <RadioButton id="male" value="male">Male</RadioButton>
        <RadioButton id="female" value="female">Female</RadioButton>
        <RadioButton id="other" value="other">Other</RadioButton>
      </RadioGroup.Root>
      <Button text='Save changes' onClick={handleSubmit} />
    </form>
  )
}

export default Account