const path = require("path");
const srcDir = "./src/";
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
  mode: "production",
  plugins: [
    new MiniCssExtractPlugin({
      filename: 'style.css'
    })
  ],
  entry: ['./src/script.ts', './src/style.scss'],
  output: {
    path: path.join(__dirname, "./assets/"),
  },
  module: {
    rules: [{
        test: /\.tsx?$/,
        use: "babel-loader",
      },
      {
        test: /\.css$/i,
        use: ["style-loader", "css-loader"],
      }, {
        test: /\.scss$/,
        use: [{
            loader: MiniCssExtractPlugin.loader
          },
          {
            loader: 'css-loader'
          },
          {
            loader: 'postcss-loader',
            options: {
              plugins: function () {
                return [
                  require('precss'),
                  require('autoprefixer')
                ];
              }
            }
          },
          {
            loader: 'sass-loader'
          }
        ]
      }
    ]
  },
  resolve: {
    extensions: [".ts", ".tsx", ".js", ".scss"],
  },
};