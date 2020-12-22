const path = require("path");
const srcDir = "./src/";

module.exports = {
  mode: "production",
  entry: {
    script: path.join(__dirname, srcDir + "script.ts"),
  },
  output: {
    path: path.join(__dirname, "./assets/"),
  },
  module: {
    rules: [{
      test: /\.tsx?$/,
      use: "babel-loader",
      exclude: /node_modules/,
    },
  {
        test: /\.css$/i,
        use: ["style-loader", "css-loader"],
      }],
  },
  resolve: {
    extensions: [".ts", ".tsx", ".js"],
  },
};