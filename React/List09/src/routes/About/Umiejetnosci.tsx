import { Card } from "@mui/material"

const content = [
  {
    title: "Java",
    description: "Znam język Java na poziomie zaawansowanym. Potrafię tworzyć aplikacje konsolowe, aplikacje okienkowe, aplikacje webowe oraz aplikacje mobilne w oparciu o ten język programowania."
  },
  {
    title: "Python",
    description: "Znam język Python na poziomie zaawansowanym. Potrafię tworzyć skrypty, aplikacje konsolowe, aplikacje webowe oraz aplikacje mobilne w oparciu o ten język programowania."
  },
  {
    title: "C++",
    description: "Znam język C++ na poziomie średniozaawansowanym. Potrafię tworzyć aplikacje konsolowe w oparciu o ten język programowania."
  },
  {
    title: "React.js",
    description: "Znam bibliotekę React.js na poziomie średniozaawansowanym. Potrafię tworzyć aplikacje internetowe w oparciu o ten framework."
  },
  {
    title: "MongoDB",
    description: "Znam bazę danych MongoDB na poziomie średniozaawansowanym. Potrafię tworzyć i zarządzać bazami danych w oparciu o ten system zarządzania bazami danych."
  },
  {
    title: "Tailwind CSS",
    description: "Znam framework CSS Tailwind na poziomie średniozaawansowanym. Potrafię tworzyć responsywne strony internetowe w oparciu o ten framework."
  }
];

const Umiejetnosci = () => {
  return (
    <div className="flex flex-row flex-wrap justify-center">
      {content.map((item, index) => (
        <Card key={index} variant="outlined" className="m-2 p-2 w-1/4">
          <h3 className="text-blue-800 font-bold text-2xl px-2 pt-2">
            {item.title}
          </h3>
          <p className="p-2">
            {item.description}
          </p>
        </Card>
      ))}
    </div>
  )
}

export default Umiejetnosci