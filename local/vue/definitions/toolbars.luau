local Toolbar = require('vue/Toolbar')

local queries = require('vue/definitions/queries')
local selects = require('vue/definitions/selects')
local searches = require('vue/definitions/searches')

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
    Toolbar.Sorter:from('customerId'),
    Toolbar.Sorter:from('orderTypeId'),
    Toolbar.Sorter:from('orderStatusId'),
    Toolbar.Sorter:from('createdAt'),
    Toolbar.Sorter:from('updatedAt'),
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
    Toolbar.Sorter:from('ceSource'),
    Toolbar.Sorter:from('ceType'),
    Toolbar.Sorter:from('topic'),
    Toolbar.Sorter:from('createdAt'),
  }

toolbars.toolbar_subscription = Toolbar
  :from_query(queries.query_subscription_select, 'subscriptions')
  :with_rules {
    Toolbar.Filter:from_search(searches.search_customer_id, 'customer_id'),
    Toolbar.Filter:from_select(selects.select_subscription_type, 'type_id'),
    Toolbar.Sorter:from('id'),
    Toolbar.Sorter:from('createdAt'),
    Toolbar.Sorter:from('typeId'),
  }

toolbars.toolbar_dispatch = Toolbar
  :from_query(queries.query_dispatch_select, 'dispatches')
  :with_rules {
    Toolbar.Filter:from_search(searches.search_customer_id, 'customer_id'),
    Toolbar.Filter:from_select(selects.select_dispatch_type, 'type_id'),
    Toolbar.Filter:from_select(selects.select_dispatch_status, 'status_id'),
    Toolbar.Sorter:from('id'),
    Toolbar.Sorter:from('createdAt'),
    Toolbar.Sorter:from('updatedAt'),
    Toolbar.Sorter:from('typeId'),
    Toolbar.Sorter:from('statusId'),
    Toolbar.Action:from('remove_selected', 'danger'):with_selection(true),
    Toolbar.Action:from('create_dispatch'),
  }

return toolbars