{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'slider-number:up': => @up()

    @subscriptions.add atom.commands.add 'atom-workspace',
      'slider-number:down': => @down()

    @subscriptions.add atom.commands.add 'atom-workspace',
      'slider-number:big-down': => @bigdown()

    @subscriptions.add atom.commands.add 'atom-workspace',
      'slider-number:big-up': => @bigup()

  deactivate: ->
    @subscriptions.dispose()

  up: ->
    if editor = atom.workspace.getActiveTextEditor()
       selection = editor.getSelectedText()
       number = parseInt( selection, 10 )
       number = number + 1
       editor.insertText("#{number}", {select:true})

  down: ->
    if editor = atom.workspace.getActiveTextEditor()
       selection = editor.getSelectedText()
       number = parseInt( selection, 10 )
       number = number - 1
       editor.insertText("#{number}", {select:true})

  bigup: ->
    if editor = atom.workspace.getActiveTextEditor()
       selection = editor.getSelectedText()
       number = parseInt( selection, 10 )
       number = number + 10
       editor.insertText("#{number}", {select:true})

  bigdown: ->
    if editor = atom.workspace.getActiveTextEditor()
       selection = editor.getSelectedText()
       number = parseInt( selection, 10 )
       number = number - 10
       editor.insertText("#{number}", {select:true})
