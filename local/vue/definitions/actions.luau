local Action = require('vue/Action')

local dialogs = require('vue/definitions/dialogs')
local requests = require('vue/definitions/requests')

local actions = {}

actions.action_dispatch_message_open_dialog = Action
  :from_dialog(dialogs.dialog_dispatch_message, 'dispatch_message')

actions.action_dispatch_message_remove_selected = Action
  :from_request(requests.request_dispatch_remove_all, 'dispatch_remove_selected')

return actions
