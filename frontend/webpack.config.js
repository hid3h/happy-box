const path = require('path');
const { WebpackManifestPlugin } = require('webpack-manifest-plugin');

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'main-[contenthash].js',
    path: path.resolve(__dirname, '../public/packs'),
  },
  devtool: "eval-source-map",
  plugins: [
    new WebpackManifestPlugin({
      publicPath: '/packs/'
    })
  ],
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env'],
            plugins: ['@babel/plugin-proposal-class-properties']
          }
        }
      },
      {
        test: /\.css$/i,
        use: [
          'style-loader',
          'css-loader',
          'postcss-loader'
        ]
      },
    ]
  }
};
