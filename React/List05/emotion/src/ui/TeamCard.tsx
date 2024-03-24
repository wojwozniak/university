import { useTheme } from '@emotion/react'
import { TeamMembers } from '../types/TeamMembers'
import './TeamCard.scss'

const TeamCard = ({ member }: { member: TeamMembers }) => {

  /*
  
.team-member {
  flex: 0 0 calc(33.33% - 20px);
  padding: 20px;
  margin: 10px;
  text-align: center;
}

.team-member img {
  border-radius: 50%;
  margin-bottom: 20px;
}

.team-member h3 {
  margin-bottom: 10px;
  display: inline-block;
}

.light-theme .team-member {
  background-color: variables.$tainted-white;
  color: variables.$gray;
}

.dark-theme .team-member {
  background-color: variables.$light-gray;
  color: variables.$white;
}
*/

  const theme = useTheme();

  return (
    <div css={{ color: theme.color }} key={member.id} className="team-member">
      <img src={member.image} alt={member.name} />
      <div>
        <h3>{member.name}</h3>
        <p>{member.position}</p>
        <p>{member.bio}</p>
      </div>
    </div>
  )
}

export default TeamCard