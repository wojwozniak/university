import { Service } from '../../types/Service'

const SingleService = ({ service }: { service: Service }) => {
  return (
    <li key={service.id}>
      <h3>{service.name}</h3>
      <p>{service.description}</p>
    </li>
  )
}

export default SingleService