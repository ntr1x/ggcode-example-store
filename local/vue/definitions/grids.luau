local Grid = require('vue/Grid')

local queries = require('vue/definitions/queries')
local symbols = require('vue/definitions/symbols')

local grids = {}

grids.grid_customer = Grid
  :from_query(queries.query_customer_select, 'customers')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/customers/${slotProps.data.id}`'),
    Grid.Column:from_symbol('name', symbols.symbol_customer),
    Grid.Column:from_path('email', 'email'),
    Grid.Column:from_path('phone', 'phone'),
  }

grids.grid_agent = Grid
  :from_query(queries.query_agent_select, 'agents')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/agents/${slotProps.data.id}`'),
    Grid.Column:from_path('title', 'title'),
    Grid.Column:from_symbol('customer', symbols.symbol_customer, 'customer'),
  }

grids.grid_item = Grid
  :from_query(queries.query_item_select, 'items')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/items/${slotProps.data.id}`'),
    Grid.Column:from_path('product', 'product.name'),
    Grid.Column:from_symbol('price', symbols.symbol_price, 'product.price'),
    Grid.Column:from_path('category', 'product.category.name'),
    Grid.Column:from_path('region', 'shop.region.name'),
    Grid.Column:from_path('shop', 'shop.name'),
  }

grids.grid_product = Grid
  :from_query(queries.query_product_select, 'products')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/products/${slotProps.data.id}`'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('category', 'category.name'),
    Grid.Column:from_symbol('price', symbols.symbol_price, 'price'),
  }

grids.grid_category = Grid
  :from_query(queries.query_category_select, 'categories')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/categories/${slotProps.data.id}`'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_region = Grid
  :from_query(queries.query_region_select, 'regions')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/regions/${slotProps.data.id}`'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_shop = Grid
  :from_query(queries.query_shop_select, 'shops')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/shops/${slotProps.data.id}`'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('region', 'region.name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_promotion_type = Grid
  :from_query(queries.query_promotion_type_select, 'promotion_types')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_promotion_target = Grid
  :from_query(queries.query_promotion_target_select, 'promotion_targets')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/promotion_target/${slotProps.data.id}`'),
    Grid.Column:from_symbol('promotion_type', symbols.symbol_promotion_type, 'promotion.type'),
    Grid.Column:from_path('promotion', 'promotion.name'),
  }

grids.grid_order_type = Grid
  :from_query(queries.query_order_type_select, 'order_types')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_order_status = Grid
  :from_query(queries.query_order_status_select, 'order_statuses')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_source_type = Grid
  :from_query(queries.query_source_type_select, 'source_types')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_payment_type = Grid
  :from_query(queries.query_payment_type_select, 'payment_types')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_payment_status = Grid
  :from_query(queries.query_payment_status_select, 'payment_statuses')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_promotion = Grid
  :from_query(queries.query_promotion_select, 'promotions')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/promotions/${slotProps.data.id}`'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_symbol('promotion_type', symbols.symbol_promotion_type, 'type'),
  }

grids.grid_order = Grid
  :from_query(queries.query_order_select, 'orders')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/orders/${slotProps.data.id}`'),
    Grid.Column:from_symbol('customer', symbols.symbol_customer, 'customer'),
    Grid.Column:from_symbol('order_type', symbols.symbol_order_type, 'orderType'),
    Grid.Column:from_symbol('order_status', symbols.symbol_order_status, 'orderStatus'),
    Grid.Column:from_path('region', 'region.name'),
    Grid.Column:from_symbol('source_type', symbols.symbol_source_type, 'sourceType'),
    Grid.Column:from_symbol('price', symbols.symbol_price, 'price'),
    Grid.Column:from_symbol('created_at', symbols.symbol_datetime, 'createdAt'),
  }

grids.grid_payment = Grid
  :from_query(queries.query_payment_select, 'payments')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/payments/${slotProps.data.id}`'),
    Grid.Column:from_symbol('customer', symbols.symbol_customer, 'customer'),
    Grid.Column
      :from_symbol('order', symbols.symbol_id, 'order.id')
      :with_variable('label', "'ORDER REF'")
      :with_variable('route', '`/admin/orders/${slotProps.data.order.id}`'),
    Grid.Column:from_symbol('payment_type', symbols.symbol_payment_type, 'paymentType'),
    Grid.Column:from_symbol('payment_status', symbols.symbol_payment_status, 'paymentStatus'),
    Grid.Column:from_path('region', 'order.region.name'),
    Grid.Column:from_symbol('value', symbols.symbol_price, 'value'),
    Grid.Column:from_symbol('created_at', symbols.symbol_datetime, 'createdAt'),
  }

grids.grid_event = Grid
  :from_query(queries.query_event_select, 'events')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/events/${slotProps.data.id}`'),
    Grid.Column:from_symbol('event_source', symbols.symbol_event_source_info, 'ceSourceInfo'),
    Grid.Column:from_symbol('event_topic', symbols.symbol_event_topic_info, 'topicInfo'),
    Grid.Column:from_symbol('event_type', symbols.symbol_event_type_info, 'ceTypeInfo'),
    Grid.Column:from_path('content_type', 'contentType'),
    Grid.Column:from_path('version', 'ceSpecification'),
    Grid.Column:from_symbol('created_at', symbols.symbol_datetime, 'createdAt'),
  }

grids.grid_event_type = Grid
  :from_query(queries.query_event_type_select, 'event_types')
  :with_rules {
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_event_topic = Grid
  :from_query(queries.query_event_topic_select, 'event_topics')
  :with_rules {
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_event_source = Grid
  :from_query(queries.query_event_source_select, 'event_sources')
  :with_rules {
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_dispatch = Grid
  :from_query(queries.query_dispatch_select, 'dispatches')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/dispatches/${slotProps.data.id}`'),
    Grid.Column:from_symbol('customer', symbols.symbol_customer, 'customer'),
    Grid.Column:from_symbol('type', symbols.symbol_dispatch_type, 'type'),
    Grid.Column:from_symbol('status', symbols.symbol_dispatch_status, 'status'),
    Grid.Column:from_symbol('session_id', symbols.symbol_session_id, 'sessionId'),
    Grid.Column:from_symbol('created_at', symbols.symbol_datetime, 'createdAt'),
    Grid.Column:from_symbol('updated_at', symbols.symbol_datetime, 'updatedAt'),
  }

grids.grid_dispatch_type = Grid
  :from_query(queries.query_dispatch_type_select, 'dispatch_types')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_dispatch_status = Grid
  :from_query(queries.query_dispatch_status_select, 'dispatch_statuses')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_subscription = Grid
  :from_query(queries.query_subscription_select, 'subscriptions')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/subscriptions/${slotProps.data.id}`'),
    Grid.Column:from_symbol('type', symbols.symbol_subscription_type, 'type'),
    Grid.Column:from_symbol('customer', symbols.symbol_customer, 'customer'),
    Grid.Column:from_symbol('session_id', symbols.symbol_session_id, 'sessionId'),
    Grid.Column:from_symbol('created_at', symbols.symbol_datetime, 'createdAt'),
  }

grids.grid_subscription_type = Grid
  :from_query(queries.query_subscription_type_select, 'subscription_types')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_template = Grid
  :from_query(queries.query_template_select, 'templates')
  :with_rules {
    Grid.Column
      :from_symbol('id', symbols.symbol_id, 'id')
      :with_variable('label', "'REF'")
      :with_variable('route', '`/admin/templates/${slotProps.data.id}`'),
    Grid.Column:from_symbol('type', symbols.symbol_template_type, 'type'),
    Grid.Column:from_symbol('shape', symbols.symbol_template_shape, 'shape'),
    Grid.Column:from_path('name', 'name'),
  }

grids.grid_template_type = Grid
  :from_query(queries.query_template_type_select, 'template_types')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

grids.grid_template_shape = Grid
  :from_query(queries.query_template_shape_select, 'template_shapes')
  :with_rules {
    Grid.Column:from_symbol('id', symbols.symbol_id, 'id'),
    Grid.Column:from_path('name', 'name'),
    Grid.Column:from_path('description', 'description'),
  }

return grids