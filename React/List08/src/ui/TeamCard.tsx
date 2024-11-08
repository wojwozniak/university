import { TeamMembers } from '../types/TeamMembers'

const TeamCard = ({ member }: { member: TeamMembers }) => {
  return (
    <div key={member.id}
      className="w-[calc(33.33%-20px)] p-5 m-[10px] flex flex-col text-center bg-tainted-white text-gray dark:bg-light-gray dark:text-white">
      <img src={member.image} alt={member.name} className='rounded-full mb-5' />
      <div>
        <h3 className='mb-4 inline-block'>{member.name}</h3>
        <p>{member.position}</p>
        <p>{member.bio}</p>
      </div>
    </div>
  )
}

export default TeamCard