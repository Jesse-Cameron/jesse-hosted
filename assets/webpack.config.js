const path = require('path'); 
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const CopyWebpackPlugin = require('copy-webpack-plugin');

const extractSass = new ExtractTextPlugin({
  filename: "css/app.css",
  //disable: process.env.NODE_ENV === "development"
});

module.exports = {
  module: {
    rules: [{
      test: /\.scss$/,
      use: extractSass.extract({
          use: [{
              loader: "css-loader" // creates style nodes from JS strings
          }, {
              loader: "sass-loader" // translates CSS into CommonJS
          }],
          // use style-loader in development
          //fallback: "style-loader",
      })
    }]
  },
  plugins: [
    extractSass,
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