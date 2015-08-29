Iso8601Timestamp = require '../lib/iso8601-timestamp'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Iso8601Timestamp", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('iso8601-timestamp')

  describe "when the iso8601-timestamp:toggle event is triggered", ->
    it "hides and shows the modal panel", ->
      # Before the activation event the view is not on the DOM, and no panel
      # has been created
      expect(workspaceElement.querySelector('.iso8601-timestamp')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'iso8601-timestamp:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.iso8601-timestamp')).toExist()

        iso8601TimestampElement = workspaceElement.querySelector('.iso8601-timestamp')
        expect(iso8601TimestampElement).toExist()

        iso8601TimestampPanel = atom.workspace.panelForItem(iso8601TimestampElement)
        expect(iso8601TimestampPanel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'iso8601-timestamp:toggle'
        expect(iso8601TimestampPanel.isVisible()).toBe false

    it "hides and shows the view", ->
      # This test shows you an integration test testing at the view level.

      # Attaching the workspaceElement to the DOM is required to allow the
      # `toBeVisible()` matchers to work. Anything testing visibility or focus
      # requires that the workspaceElement is on the DOM. Tests that attach the
      # workspaceElement to the DOM are generally slower than those off DOM.
      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.iso8601-timestamp')).not.toExist()

      # This is an activation event, triggering it causes the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'iso8601-timestamp:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        # Now we can test for view visibility
        iso8601TimestampElement = workspaceElement.querySelector('.iso8601-timestamp')
        expect(iso8601TimestampElement).toBeVisible()
        atom.commands.dispatch workspaceElement, 'iso8601-timestamp:toggle'
        expect(iso8601TimestampElement).not.toBeVisible()
