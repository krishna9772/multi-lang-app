const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

environment.loaders.append('html', {
    test: /\.html$/,
    loader: 'html-loader'
  })
  
  environment.plugins.append(
    "Provide",
    new webpack.ProvidePlugin({
      _: 'underscore',
      $: "jquery",
      jQuery: "jquery"
    })
  );

module.exports = environment
