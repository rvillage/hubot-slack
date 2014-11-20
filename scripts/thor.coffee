# Description:
#   Execute ruby script
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   HUBOT_GITHUB_REPOSITORY
#
# Commands:
#   hubot thor <command> - <Execute thor script>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   rvillage

exec = require('child_process').exec

thorExec = (msg, command) ->
  exec ('bundle exec thor ' + command), (error, stdout, stderr) ->
    if error
      msg.send stderr
    else
      msg.send stdout

module.exports = (robot) ->
  robot.respond /thor (.+)?/i, (msg) ->
    thorExec(msg, msg.match[1])
