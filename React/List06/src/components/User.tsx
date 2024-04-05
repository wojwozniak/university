import { Avatar } from '@mui/material'
import { useContext, useState } from 'react';
import { UserContext } from '../UserContext';

const User = () => {
  const { state } = useContext(UserContext);
  const [isHovered, setIsHovered] = useState(false);

  return (
    <div className="avatar"
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}>
      <Avatar
        alt="Avatar"
        style={{ cursor: 'pointer' }}
        src={state.userData.avatar} />
      {isHovered && (
        <div className="absolute top-[56px] right-2 bg-gray-700 p-2 rounded">
          <p>
            {state.userData.name}
          </p>
        </div>
      )}
    </div>
  )
}

export default User