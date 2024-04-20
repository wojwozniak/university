import "./Header.scss"

interface HeaderProps {
  companyName: string;
  companySlogan: string;
}

const Header: React.FC<HeaderProps> = ({ companyName, companySlogan }) => {
  return (
    <header id="header" className="header">
      <div className="header-content">
        <h1>{companyName}</h1>
        <p>{companySlogan}</p>
      </div>
    </header>
  )
}

export default Header