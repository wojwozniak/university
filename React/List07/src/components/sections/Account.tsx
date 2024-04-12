import React, { useState } from 'react'
import Button from '../../ui/Button'
import * as Label from '@radix-ui/react-label';
import * as RadioGroup from '@radix-ui/react-radio-group';
import RadioButton from '../../ui/RadioButton';

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
      <div>
        <Label.Root htmlFor="name" className="Label">Full Name:</Label.Root>
        <input
          type="text"
          id="name"
          value={name}
          onChange={handleNameChange}
          className="border border-gray-300 rounded px-3 py-2 w-full"
        />
      </div>
      <div>
        <Label.Root htmlFor="username" className="Label">Username:</Label.Root>
        <input
          type="text"
          id="username"
          value={username}
          onChange={handleUsernameChange}
          className="border border-gray-300 rounded px-3 py-2 w-full"
        />
      </div>
      <RadioGroup.Root value={gender} onValueChange={handleGenderChange} aria-label="Gender">
        <Label.Root className="Label">
          Gender:
        </Label.Root>
        <RadioButton id="male" value="male">Male</RadioButton>
        <RadioButton id="female" value="female">Female</RadioButton>
        <RadioButton id="other" value="other">Other</RadioButton>
      </RadioGroup.Root>
      <Button text='Save changes' onClick={handleSubmit} />
    </form>
  )
}

export default Account