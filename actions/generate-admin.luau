local ggcode = require('core/ggcode')

local projects = require('vue/definitions/projects')
local remotes = require('vue/definitions/remotes')
local requests = require('vue/definitions/requests')
local queries = require('vue/definitions/queries')
local symbols = require('vue/definitions/symbols')
local grids = require('vue/definitions/grids')
local fieldsets = require('vue/definitions/fieldsets')
local selects = require('vue/definitions/selects')
local toolbars = require('vue/definitions/toolbars')
local pages = require('vue/definitions/pages')
local routers = require('vue/definitions/routers')
local menus = require('vue/definitions/menus')

-- Generate Projects
for _, project in projects do
  ggcode.generate "vue/project" { target = '@app', variables = project:unwrap() }
end

-- Generate Routers
for _, router in routers do
  ggcode.generate "vue/router" { target = '@app', variables = router:unwrap() }
end

-- Generate Remotes
for _, remote in remotes do
  ggcode.generate "vue/remote" { target = '@app', variables = remote:unwrap() }
end

-- Generate Controls
for _, select in selects do
  ggcode.generate "vue/select" { target = '@app', variables = select:unwrap() }
end

-- Generate Symbols
for _, symbol in symbols do
  ggcode.generate "vue/symbol" { target = '@app', variables = symbol:unwrap() }
end

-- Generate Grids
for _, grid in grids do
  ggcode.generate "vue/grid" { target = '@app', variables = grid:unwrap() }
end

-- Generate Fieldsets
for _, fieldset in fieldsets do
  ggcode.generate "vue/fieldset" { target = '@app', variables = fieldset:unwrap() }
end

-- Generate Toolbars
for _, toolbar in toolbars do
  ggcode.generate "vue/toolbar" { target = '@app', variables = toolbar:unwrap() }
end

-- Generate Pages
for _, page in pages do
  ggcode.generate "vue/page" { target = '@app', variables = page:unwrap() }
end

-- Generate Menu
for _, menu in menus do
  ggcode.generate "vue/menu" { target = '@app', variables = menu:unwrap() }
end
