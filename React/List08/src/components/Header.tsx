interface HeaderProps {
  companyName: string;
  companySlogan: string;
}

const Header: React.FC<HeaderProps> = ({ companyName, companySlogan }) => {
  return (
    <header id="header" className="py-[50px] text-center">
      <div>
        <h1 className="text-3xl mb-[10px]">{companyName}</h1>
        <p className="text-lg">{companySlogan}</p>
      </div>
    </header>
  )
}

export default Header