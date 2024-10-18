const Footer = ({ name }: { name: string }) => {

  return (
    <footer css={{
      padding: "20px 0",
      textAlign: "center",
    }}>
      <div>
        <p>
          &copy; {new Date().getFullYear()} {name}
        </p>
      </div>
    </footer>
  )
}

export default Footer