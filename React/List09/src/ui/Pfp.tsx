import pfp from "../assets/pfp.png";

const Pfp = () => {
  return (
    <div className="rounded-full overflow-hidden border-4 border-white h-48 w-48 flex items-center justify-center">
      <img
        className="h-full w-full object-cover"
        src={pfp}
        alt="Zdjęcie profilowe"
      />
    </div>
  )
}

export default Pfp