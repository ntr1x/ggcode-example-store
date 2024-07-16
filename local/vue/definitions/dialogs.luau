local Dialog = require('vue/Dialog')

local projects = require('vue/definitions/projects')

local dialogs = {}

dialogs.dialog_dispatch_message = Dialog:from(projects.project, 'dispatch_message')

return dialogs
