import { Theme } from "@emotion/react"

export interface CustomTheme extends Theme {
  backgroundColor: string;
  color: string;
  linkColor: string;
  modeColor: string;
  modeBackgroundColor: string;
  modeHoverBackgroundColor: string;
  navbarBackgroundColor: string;
  contentCardBackgroundColor: string;
  sectionNchildBackgroundColor: string;
  teamCardBackgroundColor: string;
  teamCardColor: string;
  blogPostBackgroundColor: string;
  blogPostColor: string;
  buttonBackgroundColor: string;
  buttonBackgroundColorHover: string;
  contactFormBackgroundColor: string;
  contactFormColor: string;
  contactFormBorderColor: string;
  contactButtonBackgroundColor: string;
  contactButtonColor: string;
  contactButtonBackgroundColorHover: string;
  contactInputBackgroundColor: string;
  contactInputColor: string;
  contactInputBorderColor: string;
}

export const lightTheme: CustomTheme = {
  backgroundColor: '#fff',
  color: '#333',
  linkColor: "gray",
  modeColor: "gray",
  modeBackgroundColor: "white",
  modeHoverBackgroundColor: "#444",
  navbarBackgroundColor: "#f0f0f0",
  contentCardBackgroundColor: "#eee",
  sectionNchildBackgroundColor: "#f5f5f5",
  teamCardBackgroundColor: "#f5f5f5",
  teamCardColor: "#333",
  blogPostBackgroundColor: "#f0f0f0",
  blogPostColor: "#333",
  buttonBackgroundColor: "#4caf50",
  buttonBackgroundColorHover: "#45a049",
  contactFormBackgroundColor: "#fff",
  contactFormColor: "#333",
  contactFormBorderColor: "#ddd",
  contactButtonBackgroundColor: "#4caf50",
  contactButtonColor: "#fff",
  contactButtonBackgroundColorHover: "#45a049",
  contactInputBackgroundColor: "#fff",
  contactInputColor: "#333",
  contactInputBorderColor: "#ccc",
}

export const darkTheme: CustomTheme = {
  backgroundColor: '#111',
  color: '#fff',
  linkColor: "white",
  modeColor: "white",
  modeBackgroundColor: "gray",
  modeHoverBackgroundColor: "#ccc",
  navbarBackgroundColor: "#222",
  contentCardBackgroundColor: "#333",
  sectionNchildBackgroundColor: "#444",
  teamCardBackgroundColor: "#444",
  teamCardColor: "#fff",
  blogPostBackgroundColor: "#222",
  blogPostColor: "#fff",
  buttonBackgroundColor: "#45a049",
  buttonBackgroundColorHover: "#45a049",
  contactFormBackgroundColor: "#333",
  contactFormColor: "#fff",
  contactFormBorderColor: "#444",
  contactButtonBackgroundColor: "#45a049",
  contactButtonColor: "#fff",
  contactButtonBackgroundColorHover: "#45a049",
  contactInputBackgroundColor: "#444",
  contactInputColor: "#fff",
  contactInputBorderColor: "#666",
}

/*
$white: #fff;
$white-darker: #eee;
$tainted-white: #f5f5f5;
$tained-harder-white: #f0f0f0;
$dark-white: #ddd;
$darker-white: #ccc;
$black: #111;
$black-tainted: #222;
$gray: #333;
$light-gray: #444;
$very-light-gray: #666;
$green: #45a049;
$light-green: #4caf50;
*/