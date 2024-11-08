const Footer = ({ name }: { name: string }) => {
  return (
    <footer className="my-5 text-center">
      <div>
        <p>
          &copy; {new Date().getFullYear()} {name}
        </p>
      </div>
    </footer>
  )
}

export default Footer