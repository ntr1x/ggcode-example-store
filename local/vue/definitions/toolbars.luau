local Toolbar = require('vue/Toolbar')

local queries = require('vue/definitions/queries')
local selects = require('vue/definitions/selects')
local searches = require('vue/definitions/searches')
local actions = require('vue/definitions/actions')

local toolbars = {}

toolbars.toolbar_product = Toolbar
  :from_query(queries.query_product_select, 'products')
  :with_rules {
    Toolbar.Filter:from_select(selects.select_category_id),
    Toolbar.Sorter:from('id'),
    Toolbar.Sorter:from('name'),
  }

toolbars.toolbar_item = Toolbar
  :from_query(queries.query_item_select, 'items')
  :with_rules {
    Toolbar.Filter:from_select(selects.select_shop_id),
  }

toolbars.toolbar_shop = Toolbar
  :from_query(queries.query_shop_select, 'shops')
  :with_rules {
    Toolbar.Filter:from_select(selects.select_region_id),
  }

toolbars.toolbar_promotion = Toolbar
  :from_query(queries.query_promotion_select, 'promotions')
  :with_rules {
    Toolbar.Filter:from_select(selects.select_promotion_type),
  }

toolbars.toolbar_promotion_target = Toolbar
  :from_query(queries.query_promotion_target_select, 'promotion_targets')
  :with_rules {
    Toolbar.Filter:from_select(selects.select_promotion_id),
  }

toolbars.toolbar_order = Toolbar
  :from_query(queries.query_order_select, 'orders')
  :with_rules {
    Toolbar.Filter:from_search(searches.search_customer_id),
    Toolbar.Filter:from_select(selects.select_source_type),
    Toolbar.Filter:from_select(selects.select_order_type),
    Toolbar.Filter:from_select(selects.select_order_status),
    Toolbar.Filter:from_select(selects.select_region_id),
    Toolbar.Sorter:from('id'),
    Toolbar.Sorter:from('customer_id'),
    Toolbar.Sorter:from('order_type_id'),
    Toolbar.Sorter:from('order_status_id'),
    Toolbar.Sorter:from('created_at'),
    Toolbar.Sorter:from('updated_at'),
  }

toolbars.toolbar_payment = Toolbar
  :from_query(queries.query_payment_select, 'payments')
  :with_rules {
    Toolbar.Filter:from_select(selects.select_payment_type),
    Toolbar.Filter:from_select(selects.select_payment_status),
    Toolbar.Filter:from_select(selects.select_order_type),
    Toolbar.Filter:from_select(selects.select_order_status),
  }

toolbars.toolbar_event = Toolbar
  :from_query(queries.query_event_select, 'events')
  :with_rules {
    Toolbar.Filter:from_select(selects.select_event_source),
    Toolbar.Filter:from_select(selects.select_event_topic),
    Toolbar.Filter:from_select(selects.select_event_type),
    Toolbar.Sorter:from('id'),
    Toolbar.Sorter:from('ce_source'),
    Toolbar.Sorter:from('ce_type'),
    Toolbar.Sorter:from('topic'),
    Toolbar.Sorter:from('created_at'),
  }

toolbars.toolbar_subscription = Toolbar
  :from_query(queries.query_subscription_select, 'subscriptions')
  :with_rules {
    Toolbar.Filter:from_search(searches.search_customer_id, 'customer_id'),
    Toolbar.Filter:from_select(selects.select_subscription_type, 'type_id'),
    Toolbar.Sorter:from('id'),
    Toolbar.Sorter:from('created_at'),
    Toolbar.Sorter:from('type_id'),
  }

toolbars.toolbar_dispatch = Toolbar
  :from_query(queries.query_dispatch_select, 'dispatches')
  :with_rules {
    Toolbar.Filter:from_search(searches.search_customer_id, 'customer_id'),
    Toolbar.Filter:from_select(selects.select_dispatch_type, 'type_id'),
    Toolbar.Filter:from_select(selects.select_dispatch_status, 'status_id'),
    Toolbar.Sorter:from('id'),
    Toolbar.Sorter:from('created_at'),
    Toolbar.Sorter:from('updated_at'),
    Toolbar.Sorter:from('type_id'),
    Toolbar.Sorter:from('status_id'),
    Toolbar.Column:from('id', 'string'),
    Toolbar.Handle
      :from(actions.action_dispatch_message_remove_selected, 'remove_selected')
      :with_severity('danger')
      :with_selection(true)
      :with_expression('selection.value.map(item => ({ id: item.id }))'),
    Toolbar.Handle
      :from(actions.action_dispatch_message_open_dialog,'create_dispatch'),
  }

toolbars.toolbar_template = Toolbar
  :from_query(queries.query_template_select, 'templates')
  :with_rules {
    Toolbar.Filter:from_select(selects.select_template_type, 'type_id'),
    Toolbar.Filter:from_select(selects.select_template_shape, 'shape_id'),
    Toolbar.Sorter:from('id'),
    Toolbar.Sorter:from('name'),
    Toolbar.Sorter:from('type_id'),
    Toolbar.Sorter:from('shape_id'),
  }

return toolbars