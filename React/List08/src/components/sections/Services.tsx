import { Service } from '../../types/Service'
import Section from '../../ui/Section'
import SingleService from '../../ui/SingleService'

const Services = ({ services }: { services: Service[] }) => {
  return (
    <Section name="services" headerText="Services">
      <ul className='list-none p-0 m-0'>
        {services.map((service) => <SingleService service={service} key={service.id} />)}
      </ul>
    </Section>
  )
}

export default Services