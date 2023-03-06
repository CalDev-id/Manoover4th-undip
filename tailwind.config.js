/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./resources/**/*.blade.php",
    "./resources/**/*.js",
    "./resources/**/*.vue",
  ],
  theme: {
    container: {
      center: true,
      padding: '16px',
    },
    extend: {
      screens: {
        '2xl' : '1320px',
        'sm' : '480px',
      },
      colors: {
        body: '#100E26',
        primary: '#4C6BFF',
        secondary: '#8D47FE',
      },
    },
  },
  plugins: [require("daisyui")],
}
