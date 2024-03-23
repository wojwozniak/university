const Footer = ({ name }: { name: string }) => {
  return (
    <footer className="footer">
      <div className="footer-content">
        <p>
          &copy; {new Date().getFullYear()} {name}
        </p>
      </div>
    </footer>
  )
}

export default Footer