import { Service } from "../types/Service"
import SingleService from "./ui/SingleService"

const Services = ({ services }: { services: Service[] }) => {
  return (
    <section id="services" className="section services">
      <div className="section-content">
        <h2>Our Services</h2>
        <ul>
          {services.map((service) => <SingleService service={service} key={service.id} />)}
        </ul>
      </div>
    </section>
  )
}

export default Services