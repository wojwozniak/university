import React from 'react'
import { Box, Tab, Tabs } from "@mui/material"
import { useState } from "react";
import CustomTabPanel from "../../ui/CustomTabPanel";
import Edukacja from './Edukacja';
import Umiejetnosci from './Umiejetnosci';
import Doswiadczenie from './Doswiadczenie';

const Infotabs = () => {
  const [value, setValue] = useState(0);

  const handleChange = (_event: React.SyntheticEvent, newValue: number) => {
    setValue(newValue);
  };

  return (
    <div>
      <Box sx={{ borderBottom: 1, borderColor: 'divider' }}>
        <Tabs value={value} onChange={handleChange} centered>
          <Tab label="Edukacja" />
          <Tab label="Doświadczenie" />
          <Tab label="Umiejętności" />
        </Tabs>
      </Box>
      <CustomTabPanel value={value} index={0}>
        <Edukacja />
      </CustomTabPanel>
      <CustomTabPanel value={value} index={1}>
        <Umiejetnosci />
      </CustomTabPanel>
      <CustomTabPanel value={value} index={2}>
        <Doswiadczenie />
      </CustomTabPanel>
    </div>
  )
}

export default Infotabs