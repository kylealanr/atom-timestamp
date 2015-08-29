module.exports =
class Iso8601TimestampView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('iso8601-timestamp')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The Iso8601Timestamp package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
