Iso8601TimestampView = require './iso8601-timestamp-view'
{CompositeDisposable} = require 'atom'

module.exports = Iso8601Timestamp =

  activate: ->
    atom.commands.add 'atom-workspace', "iso8601-timestamp:utc", => @utc()
    atom.commands.add 'atom-workspace', "iso8601-timestamp:local", => @local()

  utc: ->
    editor = atom.workspace.getActivePaneItem()
    moment_timezone = require 'moment-timezone'
    utc_time = moment_timezone().tz("utc").format() # Timestamp ending +00:00
    utc_time = utc_time.replace(/\+00:00$/, "Z") # Change +00:00 -> "Z"
    editor.insertText(utc_time)

  local: ->
    editor = atom.workspace.getActivePaneItem()
    moment = require 'moment'
    local_time = moment().format()
    editor.insertText(local_time)
