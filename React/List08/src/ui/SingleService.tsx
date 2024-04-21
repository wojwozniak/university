import { Service } from '../types/Service'

const SingleService = ({ service }: { service: Service }) => {
  return (
    <li key={service.id} className='mb-5'>
      <h3 className='text-2xl mb-[10px]'>{service.name}</h3>
      <p>{service.description}</p>
    </li>
  )
}

export default SingleService