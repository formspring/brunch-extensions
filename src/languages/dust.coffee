dust = require 'dust-mephux'
{BaseLanguage} = require './base'

class exports.DustLanguage extends BaseLanguage
  compile: (file, callback) ->
    @readFile file, (error, data) ->
      return callback error if error?
      try
        content = dust.compile data, file.split('templates')[1].replace(/\.dust|\//g, '')
        callback null, "module.exports = '#{content}';"
      catch error
        callback error
