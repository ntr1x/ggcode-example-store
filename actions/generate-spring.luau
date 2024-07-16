local ggcode = require('core/ggcode')

local projects = require('spring/definitions/projects')
local poms = require('spring/definitions/poms')
local profiles = require('spring/definitions/profiles')
local modules = require('spring/definitions/modules')
local dockerfiles = require('spring/definitions/dockerfiles')
local units = require('spring/definitions/units')
local exchanges = require('spring/definitions/exchanges')
local projections = require('spring/definitions/projections')
local assemblies = require('spring/definitions/assemblies')
local listeners = require('spring/definitions/listeners')
local resources = require('spring/definitions/resources')
local statements = require('spring/definitions/statements')

-- Generate Projects
for _, pom in poms do
  ggcode.generate "spring/project" { target = '@store', variables = pom:unwrap() }
end

-- Generate Build Scripts
for _, docker in dockerfiles do
  ggcode.generate "spring/docker" { target = '@store', variables = docker:unwrap() }
end

-- Generate Assemblies
for _, assembly in assemblies do
  ggcode.generate "spring/assembly" { target = '@store', variables = assembly:unwrap() }
end

-- Generate Modules
for _, item in modules do
  if item.kind == 'web' then
    ggcode.generate "spring/module_web" { target = '@store', variables = item:unwrap() }
  elseif item.kind == 'lib' then
    ggcode.generate "spring/module_lib" { target = '@store', variables = item:unwrap() }
  elseif item.kind == 'gateway' then
    ggcode.generate "spring/module_web" { target = '@store', variables = item:unwrap() }
  elseif item.kind == 'security' then
    ggcode.generate "spring/module_security" { target = '@store', variables = item:unwrap() }
  end
end

-- Generate Exchanges
for _, exchange in exchanges do
  ggcode.generate "spring/exchange" { target = '@store', variables = exchange:unwrap() }
end

-- Generate Units
for _, unit in units do
  ggcode.generate "spring/unit" { target = '@store', variables = unit:unwrap() }
end

-- Generate Resources
for _, resource in resources do
  ggcode.generate "spring/resource" { target = '@store', variables = resource:unwrap() }
end

-- Generate Listeners
for _, listener in listeners do
  ggcode.generate "spring/listener" { target = '@store', variables = listener:unwrap() }
end

-- Generate DDL Statements
for _, statement in statements do
  ggcode.generate "spring/ddl" { target = '@store', variables = statement:unwrap() }
end
