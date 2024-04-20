/** @type {import('tailwindcss').Config} */
export default {
  darkMode: 'selector',
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        white: '#fff',
        'white-darker': '#eee',
        'tainted-white': '#f5f5f5',
        'tained-harder-white': '#f0f0f0',
        dark: '#111',
        'black-tainted': '#222',
        gray: '#333',
        'light-gray': '#444',
        'very-light-gray': '#666',
        green: '#45a049',
        'light-green': '#4caf50',
      },
      fontFamily: {
        sans: ['Segoe UI', 'Tahoma', 'Geneva', 'Verdana', 'sans-serif'],
      },
    }
  },
  plugins: [],
}

