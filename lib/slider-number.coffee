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
       if !isNaN(selection)
          number = parseInt( selection, 10 )
          number = number + 1
          editor.insertText("#{number}", {select:true})
          editor.save()

  down: ->
    if editor = atom.workspace.getActiveTextEditor()
       selection = editor.getSelectedText()
       if !isNaN(selection)
           number = parseInt( selection, 10 )
           number = number - 1
           editor.insertText("#{number}", {select:true})
           editor.save()

  bigup: ->
    if editor = atom.workspace.getActiveTextEditor()
       selection = editor.getSelectedText()
       if !isNaN(selection)
           number = parseInt( selection, 10 )
           number = number + 10
           editor.insertText("#{number}", {select:true})
           editor.save()

  bigdown: ->
    if editor = atom.workspace.getActiveTextEditor()
       selection = editor.getSelectedText()
       if !isNaN(selection)
           number = parseInt( selection, 10 )
           number = number - 10
           editor.insertText("#{number}", {select:true})
           editor.save()
