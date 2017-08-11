const path = require('path');
const ExtractTextPlugin = require("extract-text-webpack-plugin");

const extractSass = new ExtractTextPlugin({
    filename: "style.css",
    //disable: process.env.NODE_ENV === "development"
});

//TODO: use: https://github.com/postcss/postcss-loader

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
        extractSass
    ],
    entry: './app/src/js/index.js',
    output: {
        filename: 'bundle.js',
        path: path.resolve(__dirname, 'app/build')
    },
    devServer: {
        contentBase: './app'
    },
};