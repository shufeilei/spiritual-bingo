/* eslint-disable */
var path = require('path');
var webpack = require('webpack');

module.exports = {
  devtool: 'source-map',
  resolve: {
    extensions: ['*', '.js', '.jsx']
  },
  entry: [
    './src/index.jsx'
  ],
  output: {
    path: path.join(__dirname, '../app/assets/javascripts/dist'),
    filename: 'bundle.js',
    publicPath: '/build/'
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        loader: 'babel-loader',
        query: {
          presets: ['react']
        },
        include: path.join(__dirname, 'src')
      }
    ]
  }
}
