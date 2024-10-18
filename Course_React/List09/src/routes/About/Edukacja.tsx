import AccordionSummary from "@mui/material/AccordionSummary"
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import { Accordion, AccordionDetails } from "@mui/material";

const content = [
  {
    title: "Uniwersytet Wrocławski",
    date: "2022-teraz",
    description: "Od dwóch lat studiuję na Uniwersytecie Wrocławskim na kierunku Informatyka. W trakcie studiów zdobyłem wiedzę z zakresu programowania w językach Java, Python, C++, a także z zakresu baz danych, systemów operacyjnych, sieci komputerowych oraz innych zagadnień informatycznych."
  },
  {
    title: "Liceum",
    date: "2018-2021",
    description: "W latach 2018-2021 uczęszczałem do liceum ogólnokształcącego, gdzie zdobyłem wiedzę z zakresu matematyki, fizyki, chemii, biologii, języka polskiego, historii, geografii oraz innych przedmiotów ogólnokształcących."
  },
  {
    title: "Kurs Reacta online",
    date: "2022",
    description: "W 2022 roku ukończyłem kurs Reacta online, w trakcie którego nauczyłem się podstaw programowania w React.js oraz tworzenia aplikacji internetowych w oparciu o ten framework."
  }
]

const Edukacja = () => {
  return (
    <div>
      {content.map((item, index) => (
        <Accordion key={index}>
          <AccordionSummary
            expandIcon={<ExpandMoreIcon />}
            aria-controls="panel1-content"
            id="panel1-header"
          >
            <div className="flex flex-row justify-between w-full pr-6">
              <p>{item.title}</p>
              <p className="text-blue-500">{item.date}</p>
            </div>
          </AccordionSummary>
          <AccordionDetails>
            {item.description}
          </AccordionDetails>
        </Accordion>
      ))}
    </div>
  )
}

export default Edukacja