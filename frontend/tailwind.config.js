// tailwind.config.js
module.exports = {
  purge: [
    '../app/views/**/*.html.*',
    '../app/views/*.html.*'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {},
  plugins: [],
}
