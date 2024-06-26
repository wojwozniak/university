/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'background': '#f2f2f2',
        'background-darker': '#e6e6e6',
      },
    },
  },
  plugins: [],
}

