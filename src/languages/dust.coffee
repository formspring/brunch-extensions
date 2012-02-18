dust = require 'dust'
{BaseLanguage} = require './base'

class exports.DustLanguage extends BaseLanguage
  compile: (file, callback) ->
    @readFile file, (error, data) ->
      return callback error if error?
      try
        content = dust.compile data, file.split('templates/')[1].replace(/\.dust/, '')
        callback null, "module.exports = " + JSON.stringify(content) + ";"
      catch error
        callback error
