const path = require('path')

module.exports = {
  resolve: {
    alias: {
      '@js': path.resolve(__dirname, '..', '..', 'app/assets/javascripts'),
      '@sass': path.resolve(__dirname, '..', '..', 'app/assets/stylesheets'),
      '@components': path.resolve(__dirname, '..', '..', 'app/assets/javascript/components')
    }
  }
}
