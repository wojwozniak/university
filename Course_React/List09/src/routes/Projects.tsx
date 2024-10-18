import { Card } from "@mui/material";
import MyImage from "../ui/MyImage";

const projectList = [
  {
    id: 1,
    name: 'Sklep internetowy',
    description: 'Platforma online do kupowania i sprzedawania różnych produktów.',
    gitLink: 'https://github.com/example/sklep-internetowy',
    demoLink: 'https://www.przykład.com',
    imageUrl: 'https://picsum.photos/600/400',
  },
  {
    id: 2,
    name: 'Aplikacja do zarządzania zadaniami',
    description: 'Aplikacja do efektywnego organizowania i zarządzania zadaniami.',
    gitLink: 'https://github.com/example/aplikacja-do-zarzadzania-zadaniami',
    demoLink: 'https://www.przykład.com',
    imageUrl: 'https://picsum.photos/600/400',
  },
  {
    id: 3,
    name: 'Aplikacja pogodowa',
    description: 'Prosta aplikacja wyświetlająca aktualne informacje pogodowe na podstawie lokalizacji użytkownika.',
    gitLink: 'https://github.com/example/aplikacja-pogodowa',
    demoLink: 'https://www.przykład.com',
    imageUrl: 'https://picsum.photos/600/400',
  },
  {
    id: 4,
    name: 'Wyszukiwarka przepisów',
    description: 'Aplikacja do wyszukiwania przepisów i zapisywania ulubionych do późniejszego wykorzystania.',
    gitLink: 'https://github.com/example/wyszukiwarka-przepisów',
    demoLink: 'https://www.przykład.com',
    imageUrl: 'https://picsum.photos/600/400',
  },
  {
    id: 5,
    name: 'Śledzenie aktywności fizycznej',
    description: 'Platforma do śledzenia aktywności fizycznych, ustawiania celów i monitorowania postępów.',
    gitLink: 'https://github.com/example/sledzenie-aktywnosci-fizycznej',
    demoLink: 'https://www.przykład.com',
    imageUrl: 'https://picsum.photos/600/400',
  },
];


const Projects = () => {
  return (
    <div className="p-5 flex flex-col items-center w-full h-full">
      <h3 className="text-3xl font-bold text-blue-800 mb-10">Moje projekty</h3>
      <div className="w-full h-full flex flex-row flex-wrap items-center justify-center">
        {projectList.map((project) => (
          <Card key={project.id} variant="outlined" className="m-2 p-2 w-1/4">
            <MyImage imageUrl={project.imageUrl} />
            <h3 className="text-blue-800 font-bold text-2xl px-2 pt-2">
              {project.name}
            </h3>
            <p className="p-2">
              {project.description}
            </p>
            <div className="flex flex-row justify-between p-2">
              <a href={project.gitLink} className="text-blue-500">
                Github
              </a>
              <a href={project.demoLink} className="text-blue-500">
                Demo
              </a>
            </div>
          </Card>
        ))}
      </div>
    </div>
  )
}

export default Projects;