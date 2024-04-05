import { Avatar } from '@mui/material'
import { useContext, useState } from 'react';
import { UserContext } from '../UserContext';

const User = () => {
  const { state } = useContext(UserContext);

  const [isHovered, setIsHovered] = useState(false);

  return (
    <div className="avatar" onMouseEnter={() => setIsHovered(true)} onMouseLeave={() => setIsHovered(false)}>
      <Avatar
        alt="Avatar"
        src={state.avatar} />
      {isHovered && (
        <div className="absolute">
          <p>
            {state.name}
          </p>
        </div>
      )}
    </div>
  )
}

export default User