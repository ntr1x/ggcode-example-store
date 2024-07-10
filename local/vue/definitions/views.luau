local View = require('vue/View')

local projects = require('vue/definitions/projects')
local remotes = require('vue/definitions/remotes')

local views = {}

views.view_personal = View
  :from(projects.project, 'personal')
  :with_rules {
    View.Socket:from_remote(remotes.remote_events, 'ws', 'events'),
    View.Subscription:from('events'):with_rules {
      View.Subscription.Selector:from()
        :with_header('channel', 'public_dispatch'),
    },
  }

views.view_admin = View
  :from(projects.project, 'admin')
  :with_rules {
    View.Socket:from_remote(remotes.remote_events, 'ws', 'events'),
    View.Subscription:from('events'):with_rules {
      View.Subscription.Selector:from()
        :with_header('channel', 'public_dispatch'),
    },
  }

return views