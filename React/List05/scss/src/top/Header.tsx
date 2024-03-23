import { companyData } from '../sections/companyData'

const Header = () => {
  return (
    <header id="header" className="header">
      <div className="header-content">
        <h1>{companyData.name}</h1>
        <p>{companyData.slogan}</p>
      </div>
    </header>
  )
}

export default Header