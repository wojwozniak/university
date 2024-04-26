import Pfp from "../ui/Pfp";
import Socialbar from "../ui/Socialbar";


const Home = () => {
  return (
    <div className="container mx-auto px-4 py-8 flex flex-col items-center">
      <Pfp />
      <div id="description" className="flex flex-col items-center">
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
      <div className="absolute bottom-5">
        <Socialbar />
      </div>
    </div>
  );
};

export default Home;