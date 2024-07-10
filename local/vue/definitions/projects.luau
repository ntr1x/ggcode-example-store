local Project = require('vue/Project')

local projects = {}

projects.project = Project
  :from('store_admin')
  :with_router('personal')
  :with_router('admin')
  :with_menu('personal')
  :with_menu('orders')
  :with_menu('profiles')
  :with_menu('catalogue')
  :with_menu('notifications')
  :with_menu('dictionaries')

return projects
