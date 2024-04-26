import Pfp from "../../ui/Pfp"

const AboutContent = () => {
  return (
    <div id="about__top" className="bg-background-darker rounded-xl p-4 px-20 flex flex-col gap-4">
      <div className="flex flex-row gap-6 items-center">
        <Pfp size="small" />
        <div className="flex flex-col">
          <h1 className="font-bold text-3xl">
            Wojciech Woźniak
          </h1>
          <h2 className="text-xl font-semibold">front-end developer</h2>
          <a href="mailto:test@gmail.com" className="text-blue-500 hover:underline">mojmail@gmail.com</a>
        </div>
      </div>
      <div className="p-2">
        {/* opis na kilka zdań */}
        <p className="text-m font-thin">
          Cześć! Jestem studentem Uniwersytetu Wrocławskiego i front-end developerem.
          Specjalizuję się w tworzeniu niezwykłych stron internetowych.
          Najczęściej korzystam z Reacta, Tailwinda i MUI.
          W wolnym czasie lubię grać w szachy i chodzić po górach.
          Mówię po polsku, angielsku i niemiecku.
          Masz ofertę pracy lub chcesz się ze mną skontaktować?
          Skorzystaj z jednego z linków na stronie "Home".
        </p>
      </div>
    </div>
  )
}

export default AboutContent