local ggcode = require('core/ggcode')

local projects = require('vue/definitions/projects')
local dockerfiles = require('vue/definitions/dockerfiles')
local remotes = require('vue/definitions/remotes')
local views = require('vue/definitions/views')
local requests = require('vue/definitions/requests')
local queries = require('vue/definitions/queries')
local symbols = require('vue/definitions/symbols')
local grids = require('vue/definitions/grids')
local fieldsets = require('vue/definitions/fieldsets')
local selects = require('vue/definitions/selects')
local searches = require('vue/definitions/searches')
local toolbars = require('vue/definitions/toolbars')
local pages = require('vue/definitions/pages')
local routers = require('vue/definitions/routers')
local menus = require('vue/definitions/menus')
local widgets = require('vue/definitions/widgets')
local dialogs = require('vue/definitions/dialogs')
local actions = require('vue/definitions/actions')

-- Generate Projects
for _, project in projects do
  ggcode.generate "vue/project" { target = '@store', variables = project:unwrap() }
end

-- Generate Dockerfiles
for _, docker in dockerfiles do
  ggcode.generate "vue/docker" { target = '@store', variables = docker:unwrap() }
end

-- Generate Routers
for _, router in routers do
  ggcode.generate "vue/router" { target = '@store', variables = router:unwrap() }
end

-- Generate Remotes
for _, remote in remotes do
  ggcode.generate "vue/remote" { target = '@store', variables = remote:unwrap() }
end

-- Generate Views
for _, view in views do
  ggcode.generate "vue/view" { target = '@store', variables = view:unwrap() }
end

-- Generate Select Controls
for _, select in selects do
  ggcode.generate "vue/select" { target = '@store', variables = select:unwrap() }
end

-- Generate Search Controls
for _, search in searches do
  ggcode.generate "vue/search" { target = '@store', variables = search:unwrap() }
end

-- Generate Symbols
for _, symbol in symbols do
  ggcode.generate "vue/symbol" { target = '@store', variables = symbol:unwrap() }
end

-- Generate Grids
for _, grid in grids do
  ggcode.generate "vue/grid" { target = '@store', variables = grid:unwrap() }
end

-- Generate Fieldsets
for _, fieldset in fieldsets do
  ggcode.generate "vue/fieldset" { target = '@store', variables = fieldset:unwrap() }
end

-- Generate Toolbars
for _, toolbar in toolbars do
  ggcode.generate "vue/toolbar" { target = '@store', variables = toolbar:unwrap() }
end

-- Generate Pages
for _, page in pages do
  ggcode.generate "vue/page" { target = '@store', variables = page:unwrap() }
end

-- Generate Menus
for _, menu in menus do
  ggcode.generate "vue/menu" { target = '@store', variables = menu:unwrap() }
end

-- Generate Widgets
for _, widget in widgets do
  ggcode.generate "vue/widget" { target = '@store', variables = widget:unwrap() }
end

-- Generate Dialogs
for _, dialog in dialogs do
  ggcode.generate "vue/dialog" { target = '@store', variables = dialog:unwrap() }
end

-- Generate Actions
for _, action in actions do
  ggcode.generate "vue/action" { target = '@store', variables = action:unwrap() }
end
