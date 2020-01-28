const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

// =================================================================
// Custom Config
// =================================================================
const customConfig = require('./custom')
environment.config.merge(customConfig)

module.exports = environment
