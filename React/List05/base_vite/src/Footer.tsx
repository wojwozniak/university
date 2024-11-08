import { companyData } from './companyData'

const Footer = () => {
  return (
    <footer className="footer">
      <div className="footer-content">
        <p>
          &copy; {new Date().getFullYear()} {companyData.name}
        </p>
      </div>
    </footer>
  )
}

export default Footer