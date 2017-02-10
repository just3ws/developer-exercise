var path = require('path');
var EslintPlugin  = require('webpack-eslint-plugin');
//var ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  entry: "./dist/lib/main.js",
  output: {
    path:  path.resolve(__dirname, '_site/js'),
    filename: "bundle.js"
  }
};
