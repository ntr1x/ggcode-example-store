local Remote = require('vue/Remote')

local projects = require('vue/definitions/projects')

local remotes = {}

remotes.remote_security = Remote:from(projects.project, 'security', 'http://api.local.example.com/api/assembly_web')
remotes.remote_customers = Remote:from(projects.project, 'customers', 'http://api.local.example.com/api/assembly_web')
remotes.remote_products = Remote:from(projects.project, 'products', 'http://api.local.example.com/api/assembly_web')
remotes.remote_payments = Remote:from(projects.project, 'payments', 'http://api.local.example.com/api/assembly_web')
remotes.remote_events = Remote:from(projects.project, 'events', 'http://api.local.example.com/api/assembly_web')

return remotes
