const content = [
  {
    title: "Praca w firmie X",
    date: "2022-teraz",
    description: "Od dwóch lat pracuję w firmie X na stanowisku programisty. W trakcie pracy zdobyłem doświadczenie w programowaniu w językach Java, Python, C++, a także w pracy z bazami danych, systemami operacyjnymi, sieciami komputerowymi oraz innymi zagadnieniami informatycznymi."
  },
  {
    title: "Praktyki w firmie Y",
    date: "2021",
    description: "W 2021 roku odbyłem praktyki w firmie Y, gdzie zdobyłem doświadczenie w programowaniu w języku Python oraz w pracy z bazami danych i systemami operacyjnymi."
  },
  {
    title: "Projekty programistyczne",
    date: "2019-2022",
    description: "W latach 2019-2022 brałem udział w różnych projektach programistycznych, w których zdobywałem doświadczenie w programowaniu w różnych językach programowania oraz w pracy z różnymi technologiami informatycznymi."
  }

]

const Doswiadczenie = () => {
  return (
    <ul>
      {content.map((item, index) => (
        <li key={index} className="my-2">
          <div className="flex flex-row items-center gap-5">
            <h3 className="text-blue-800 font-bold text-2xl">{item.title}</h3>
            <p className="font-extralight">{item.date}</p>
          </div>
          <p>{item.description}</p>
        </li>
      ))
      }
    </ul>

  )
}

export default Doswiadczenie