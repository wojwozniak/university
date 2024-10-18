import { Checkbox } from "@mui/material";

const BooleanEditCell = (props: any) => {
  const { id, value, api } = props;

  const handleChange = (event: any) => {
    api.setEditCellValue({ id, field: props.field, value: event.target.checked });
  };

  return <Checkbox checked={value} onChange={handleChange} />;
};

export default BooleanEditCell;