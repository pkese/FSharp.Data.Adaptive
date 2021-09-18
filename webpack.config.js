const webpack = require('webpack');
const path = require('path');

const targetDir = path.resolve(__dirname, "src/Demo/Fable/");

const config = {
  mode: "development",
  entry: path.resolve(targetDir, "Program.fs.js"),
  output: {
    path: path.resolve(targetDir, 'dist'),
    filename: 'bundle.js'
  },
  devServer: {
    static: {
      directory: targetDir,
    },
    port: 8080,
  },  
};

module.exports = config;