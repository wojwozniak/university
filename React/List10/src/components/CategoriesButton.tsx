import { Button } from "@mui/material"
import { InfoContext } from "../InfoContext";
import { useContext } from "react";

const CategoriesButton = () => {
  const { dispatch } = useContext(InfoContext);

  return (
    <div className="absolute top-2 right-2">
      <Button variant="contained"
        color="secondary"
        onClick={() => dispatch({ type: "CATEGORY_SCREEN" })}>
        Back to categories
      </Button>
    </div>
  )
}

export default CategoriesButton