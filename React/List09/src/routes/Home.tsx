import Pfp from "../ui/Pfp";


const Home = () => {
  return (
    <div className="container mx-auto px-4 py-8 flex flex-col items-center">
      <Pfp />
      <h1 className="text-3xl font-bold mt-8">
        Wojciech Woźniak
      </h1>
      <p className="text-lg text-center mt-4">
        Cześć! Jestem front-end developerem.
      </p>
      <p className="text-lg text-center mt-2">
        Specjalizuję się w tworzeniu niezwykłych stron internetowych.
      </p>
    </div>
  );
};

export default Home;