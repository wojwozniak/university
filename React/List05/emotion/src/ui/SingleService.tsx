import { Service } from '../types/Service'

const SingleService = ({ service }: { service: Service }) => {
  return (
    <li key={service.id}>
      <h3 css={{ marginBottom: "10px", fontSize: "1.8em" }}>{service.name}</h3>
      <p>{service.description}</p>
    </li>
  )
}

export default SingleService