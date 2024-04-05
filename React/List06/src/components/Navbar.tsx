import Logo from "./Logo"
import User from "./User"

const Navbar = () => {
  return (
    <nav className="pl-10 pr-10 flex flex-row justify-between items-center w-full p-2 bg-gray-500">
      <Logo />
      <User />
    </nav>
  )
}

export default Navbar