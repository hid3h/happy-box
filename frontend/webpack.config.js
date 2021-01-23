const path = require('path');
const { WebpackManifestPlugin } = require('webpack-manifest-plugin');
const StatsPlugin = require('stats-webpack-plugin');
const webpack = require('webpack');

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'main-[contenthash].js',
    path: path.resolve(__dirname, '../public/packs'),
  },
  // devtool: "eval-source-map", これでbuildすると1.85MiBから297KiBに
  externals: {
    // chartjsのサイズ減らす用
    moment: 'moment'
  },
  plugins: [
    new webpack.DefinePlugin({
      NODE_ENV: JSON.stringify(process.env.NODE_ENV),
    }),
    new WebpackManifestPlugin({
      publicPath: '/packs/'
    }),
    // new StatsPlugin('stats.json', {
    //   chunkModules: true,
    // })
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
