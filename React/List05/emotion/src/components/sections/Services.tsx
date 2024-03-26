import { Service } from '../../types/Service'
import Section from '../../ui/Section'
import SingleService from '../../ui/SingleService'
import './Services.scss'


const Services = ({ services }: { services: Service[] }) => {
  return (
    <Section name="services"
      headerText="Services"
      styles={{
        listStyle: 'none',
        padding: 0,
        margin: 0
      }}
      sectionContentStyles={{
        textAlign: 'left',
        marginBottom: '20px'
      }}
    >
      <ul>
        {services.map((service) => <SingleService service={service} key={service.id} />)}
      </ul>
    </Section>
  )
}

export default Services