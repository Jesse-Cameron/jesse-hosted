const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");
const UglifyJsPlugin = require("uglifyjs-webpack-plugin");

module.exports = {
  optimization: {
    minimizer: [
      new UglifyJsPlugin({ cache: true, parallel: true, sourceMap: false }),
      new OptimizeCSSAssetsPlugin({})
    ]
  },
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
    // extract css
    new MiniCssExtractPlugin({
      filename: '../../static/css/app.css'
    }),
    // move static assets and images
    new CopyWebpackPlugin([
      { from: 'static/*', to: '../../' },
      { from: 'static/images/**/*', to: '../../' },
    ])
  ],
  entry: "./js/app.js",
  output: {
    path: path.join(__dirname, "../priv/static/js/"),
    filename: "app.js"
  }
};