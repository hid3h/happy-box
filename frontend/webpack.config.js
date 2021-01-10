const path = require('path');
const { WebpackManifestPlugin } = require('webpack-manifest-plugin');

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'main-[contenthash].js',
    path: path.resolve(__dirname, '../public/packs'),
  },
  plugins: [
    new WebpackManifestPlugin({
      publicPath: '/packs/'
    })
  ]
};
