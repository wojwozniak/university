const Header = (
  { companyName, companySlogan }
    :
    { companyName: string, companySlogan: string }
) => {
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