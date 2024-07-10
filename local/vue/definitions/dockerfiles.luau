local Docker = require('vue/docker/Docker')

local projects = require('vue/definitions/projects')

local dockerfiles = {}

dockerfiles.docker = Docker
  :from(projects.project)
  :with_namespace('store')
  :with_image('admin_ui')

return dockerfiles
