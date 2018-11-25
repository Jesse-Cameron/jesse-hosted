const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

module.exports = {
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      },
      {
        test: /\.scss$/,
        use: [
          'style-loader',
          MiniCssExtractPlugin.loader,
          'css-loader',
          'sass-loader'
        ]
      }
    ]
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: 'style.css'
    }),
    new CopyWebpackPlugin([
      { from: 'static/*', to: '../' },
      { from: 'static/images/**/*', to: '../' },
    ]),
  ],
  entry: "./js/app.js",
  output: {
    path: path.join(__dirname, "../priv/static/"),
    filename: "js/app.js"
  }
};