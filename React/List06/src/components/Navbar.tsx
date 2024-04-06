import Logo from "../ui/Logo"
import User from "../ui/User"

const Navbar = () => {
  return (
    <nav className="pl-10 z-10 pr-10 flex fixed top-0 left-0 flex-row justify-between items-center w-full p-2 bg-gray-500">
      <Logo />
      <User />
    </nav>
  )
}

export default Navbar