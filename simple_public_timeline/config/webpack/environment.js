const { environment } = require('@rails/webpacker')
const ignoreTestFiles = {
  test: /test\.tsx$/,
  use: 'ignore-loader'
}
environment.loaders.append('ignoreTestFiles', ignoreTestFiles)
module.exports = environment
