interface TabPanelProps {
  children?: React.ReactNode;
  index: number;
  value: number;
}

function CustomTabPanel(props: TabPanelProps) {
  const { children, value, index, ...other } = props;

  return (
    <div
      role="tabpanel"
      hidden={value !== index}
      id={`simple-tabpanel-${index}`}
      aria-labelledby={`simple-tab-${index}`}
      {...other}
      className="p-4 mt-1 min-h-[300px] border-solid border border-gray-300 rounded-md"
    >
      {value === index && (
        <>{children}</>
      )}
    </div>
  );
}

export default CustomTabPanel;