fluid = require 'fluid'

module.exports = ios = (grunt) ->
  tasks =
    buildIcons: require('./ios/icons')(grunt).build
    buildScreens: require('./ios/screens')(grunt).build
    setWhiteStatusBar: require('./ios/plist')(grunt).setWhiteStatusBar

  run: (fn) ->
    fluid(tasks)
      .buildIcons()
      .buildScreens()
      .setWhiteStatusBar()
      .go (err, result) ->
        if err then grunt.fatal err
        if fn then fn()
