interface ButtonProps {
  text: string;
  onClick: () => void;
}
const Button: React.FC<ButtonProps> = ({ text, onClick }) => {
  return (
    <button
      className="bg-green-200 hover:bg-green-300 text-green-700 font-semibold py-2 px-4 rounded inline-flex items-center"
      onClick={onClick}
    >
      {text}
    </button>
  );
};

export default Button;