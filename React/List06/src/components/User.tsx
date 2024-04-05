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
        src={state.avatar} />
      {isHovered && (
        <div className="absolute top-15 right-2">
          <p>
            {state.name}
          </p>
        </div>
      )}
    </div>
  )
}

export default User