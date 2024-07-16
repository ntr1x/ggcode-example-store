local Query = require('vue/Query')

local requests = require('vue/definitions/requests')

local queries = {}

queries.query_shop_select = Query
  :from_request(requests.request_shop_select, 'shop_select')
  :with_rules {
    Query.Filter:from('region_id', 'regionId'),
  }

queries.query_product_select = Query
  :from_request(requests.request_product_select, 'product_select')
  :with_rules {
    Query.Filter:from('category_id', 'categoryId'),
    Query.Sorter:from('id', 'id'),
    Query.Sorter:from('name', 'name'),
  }

queries.query_item_select = Query
  :from_request(requests.request_item_select, 'item_select')
  :with_rules {
    Query.Filter:from('shop_id', 'shopId'),
  }

queries.query_payment_select = Query
  :from_request(requests.request_payment_select, 'payment_select')
  :with_rules {
    Query.Filter:from('order_id', 'orderId', 'route.params.orderId'),
    Query.Filter:from('customer_id', 'customerId', 'route.params.customerId'),
    Query.Filter:from('payment_type', 'paymentTypeId'),
    Query.Filter:from('payment_status', 'paymentStatusId'),
    Query.Filter:from('order_type', 'order.orderTypeId'),
    Query.Filter:from('order_status', 'order.orderStatusId'),
  }

queries.query_order_select = Query
  :from_request(requests.request_order_select, 'order_select')
  :with_rules {
    Query.Filter:from('customer_id', 'customerId', 'route.params.customerId'),
    Query.Filter:from('order_type', 'orderTypeId'),
    Query.Filter:from('order_status', 'orderStatusId'),
    Query.Filter:from('source_type', 'sourceTypeId'),
    Query.Filter:from('region_id', 'regionId'),
    Query.Sorter:from('order_type_id', 'orderType'),
    Query.Sorter:from('order_status_id', 'orderStatus'),
    Query.Sorter:from('id', 'id'),
    Query.Sorter:from('customer_id', 'customerId'),
    Query.Sorter:from('created_at', 'createdAt'),
    Query.Sorter:from('updated_at', 'updatedAt'),
  }

queries.query_promotion_select = Query
  :from_request(requests.request_promotion_select, 'promotion_select')
  :with_rules {
    Query.Filter:from('promotion_type', 'typeId'),
  }

queries.query_agent_select = Query
  :from_request(requests.request_agent_select, 'agent_select')
  :with_rules {
    Query.Filter:from('customer_id', 'customerId', 'route.params.customerId'),
  }

queries.query_customer_select = Query:from_request(requests.request_customer_select, 'customer_select')
queries.query_region_select = Query:from_request(requests.request_region_select, 'region_select')
queries.query_category_select = Query:from_request(requests.request_category_select, 'category_select')
queries.query_source_type_select = Query:from_request(requests.request_source_type_select, 'source_type_select')
queries.query_order_type_select = Query:from_request(requests.request_order_type_select, 'order_type_select')
queries.query_order_status_select = Query:from_request(requests.request_order_status_select, 'order_status_select')
queries.query_payment_type_select = Query:from_request(requests.request_payment_type_select, 'payment_type_select')
queries.query_payment_status_select = Query:from_request(requests.request_payment_status_select, 'payment_status_select')
queries.query_promotion_type_select = Query:from_request(requests.request_promotion_type_select, 'promotion_type_select')

queries.query_event_select = Query
  :from_request(requests.request_event_select, 'event_select')
  :with_rules {
    Query.Filter:from('event_source', 'ceSource'),
    Query.Filter:from('event_type', 'ceType'),
    Query.Filter:from('event_topic', 'topic'),
    Query.Sorter:from('id', 'id'),
    Query.Sorter:from('ce_source', 'ceSource'),
    Query.Sorter:from('ce_type', 'ceType'),
    Query.Sorter:from('topic', 'topic'),
    Query.Sorter:from('created_at', 'createdAt'),
  }

queries.query_event_type_select = Query
  :from_request(requests.request_event_type_select, 'event_type_select')
  :with_rules {
    Query.Sorter:from('name', 'name'),
    Query.Sorter:from('description', 'description'),
  }

queries.query_event_topic_select = Query
  :from_request(requests.request_event_topic_select, 'event_topic_select')
  :with_rules {
    Query.Sorter:from('name', 'name'),
    Query.Sorter:from('description', 'description'),
  }

queries.query_event_source_select = Query
  :from_request(requests.request_event_source_select, 'event_source_select')
  :with_rules {
    Query.Sorter:from('name', 'name'),
    Query.Sorter:from('description', 'description'),
  }

queries.query_dispatch_select = Query
  :from_request(requests.request_dispatch_select, 'dispatch_select')
  :with_rules {
    Query.Filter:from('customer_id', 'customerId', 'route.params.customerId'),
    Query.Filter:from('type_id', 'typeId'),
    Query.Filter:from('status_id', 'statusId'),
    Query.Sorter:from('id', 'id'),
    Query.Sorter:from('type_id', 'typeId'),
    Query.Sorter:from('status_id', 'statusId'),
    Query.Sorter:from('created_at', 'createdAt'),
    Query.Sorter:from('updated_at', 'updatedAt'),
  }

queries.query_dispatch_type_select = Query
  :from_request(requests.request_dispatch_type_select, 'dispatch_type_select')
  :with_rules {
    Query.Sorter:from('id', 'id'),
    Query.Sorter:from('name', 'name'),
    Query.Sorter:from('description', 'description'),
  }

queries.query_dispatch_status_select = Query
  :from_request(requests.request_dispatch_status_select, 'dispatch_status_select')
  :with_rules {
    Query.Sorter:from('id', 'id'),
    Query.Sorter:from('name', 'name'),
    Query.Sorter:from('description', 'description'),
  }

queries.query_subscription_select = Query
  :from_request(requests.request_subscription_select, 'subscription_select')
  :with_rules {
    Query.Filter:from('customer_id', 'customerId', 'route.params.customerId'),
    Query.Filter:from('type_id', 'typeId'),
    Query.Sorter:from('id', 'id'),
    Query.Sorter:from('created_at', 'createdAt'),
    Query.Sorter:from('type_id', 'typeId'),
  }

queries.query_subscription_type_select = Query
  :from_request(requests.request_subscription_type_select, 'subscription_type_select')
  :with_rules {
    Query.Filter:from('customer_id', 'customerId', 'route.params.customerId'),
    Query.Filter:from('type_id', 'typeId'),
    Query.Sorter:from('id', 'id'),
    Query.Sorter:from('name', 'name'),
    Query.Sorter:from('description', 'description'),
  }

queries.query_template_select = Query
  :from_request(requests.request_template_select, 'template_select')
  :with_rules {
    Query.Filter:from('type_id', 'typeId'),
    Query.Filter:from('shape_id', 'shapeId'),
    Query.Sorter:from('id', 'id'),
    Query.Sorter:from('name', 'name'),
    Query.Sorter:from('type_id', 'typeId'),
    Query.Sorter:from('shape_id', 'shapeId'),
  }

queries.query_template_type_select = Query
  :from_request(requests.request_template_type_select, 'template_type_select')
  :with_rules {
    Query.Sorter:from('id', 'id'),
    Query.Sorter:from('name', 'name'),
    Query.Sorter:from('description', 'description'),
  }

queries.query_template_shape_select = Query
  :from_request(requests.request_template_shape_select, 'template_shape_select')
  :with_rules {
    Query.Sorter:from('id', 'id'),
    Query.Sorter:from('name', 'name'),
    Query.Sorter:from('description', 'description'),
  }

queries.query_promotion_target_select = Query
  :from_request(requests.request_promotion_target_select, 'promotion_target_select')
  :with_rules {
    Query.Filter:from('product_id', 'productId', 'route.params.productId'),
    Query.Filter:from('promotion_id', 'promotionId', 'route.params.promotionId'),
  }

queries.query_customer_get = Query:from_request(requests.request_customer_get, 'customer_get')
queries.query_agent_get = Query:from_request(requests.request_agent_get, 'agent_get')
queries.query_order_get = Query:from_request(requests.request_order_get, 'order_get')
queries.query_product_get = Query:from_request(requests.request_product_get, 'product_get')

return queries