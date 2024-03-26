import { useTheme } from '@emotion/react'
import { TeamMembers } from '../types/TeamMembers'
import { CustomTheme } from '../../themes';

const TeamCard = ({ member }: { member: TeamMembers }) => {

  const theme = useTheme() as CustomTheme;

  return (
    <div css={{
      flex: '0 0 calc(33.33% - 20px)',
      padding: '20px',
      margin: '10px',
      textAlign: 'center',
      backgroundColor: theme.teamCardBackgroundColor,
      color: theme.teamCardColor
    }} key={member.id} className="team-member">
      <img src={member.image} alt={member.name} css={{
        borderRadius: '50%',
        marginBottom: '20px'
      }} />
      <div>
        <h3 css={{
          marginBottom: '10px',
          display: 'inline-block'
        }}>{member.name}</h3>
        <p>{member.position}</p>
        <p>{member.bio}</p>
      </div>
    </div>
  )
}

export default TeamCard