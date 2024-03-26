interface HeaderProps {
  companyName: string;
  companySlogan: string;
}

const Header: React.FC<HeaderProps> = ({ companyName, companySlogan }) => {
  return (
    <header id="header" css={{
      padding: "50px 0",
      textAlign: "center"
    }}>
      <div>
        <h1 css={{
          fontSize: "3em",
          marginBottom: "10px"
        }}>{companyName}</h1>
        <p css={{ fontSize: "1.5em" }}>{companySlogan}</p>
      </div>
    </header>
  )
}

export default Header