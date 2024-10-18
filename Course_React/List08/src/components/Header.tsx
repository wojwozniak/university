interface HeaderProps {
  companyName: string;
  companySlogan: string;
}

const Header: React.FC<HeaderProps> = ({ companyName, companySlogan }) => {
  return (
    <header id="header" className="py-[50px] text-center">
      <div>
        <h1 className="text-5xl font-bold mb-5">{companyName}</h1>
        <p className="text-2xl">{companySlogan}</p>
      </div>
    </header>
  )
}

export default Header