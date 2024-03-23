import { companyData } from "./companyData"
import "./Team.scss"

const Team = () => {
  return (
    <section id="team" className="section team">
      <div className="section-content">
        <h2>Meet Our Team</h2>
        <div className="team-members">
          {companyData.teamMembers.map((member) => (
            <div key={member.id} className="team-member">
              <img src={member.image} alt={member.name} />
              <div>
                <h3>{member.name}</h3>
                <p>{member.position}</p>
                <p>{member.bio}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}

export default Team