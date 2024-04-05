import Logo from "./Logo"
import User from "./User"

const Navbar = () => {
  return (
    <nav className="pl-10 pr-10 flex flex-row justify-between items-center w-full mt-2">
      <Logo />
      <User />
    </nav>
  )
}

export default Navbar