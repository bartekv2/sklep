module.exports = {
  theme: {
    extend: {
      colors: {
        cyan: '#9cdbff',
      }
    }
  },
  variants: {
    backgroundColor: ['responsive', 'hover', 'focus', 'active']
  },
  plugins: [
    require('@tailwindcss/custom-forms')
  ]
}
