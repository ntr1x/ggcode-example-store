local Select = require('vue/control/Select')

local requests = require('vue/definitions/requests')

local selects = {}

selects.select_category_id = Select
  :from_request(requests.request_category_select, 'category_id')

selects.select_region_id = Select
  :from_request(requests.request_region_select, 'region_id')

selects.select_shop_id = Select
  :from_request(requests.request_shop_select, 'shop_id')

selects.select_promotion_id = Select
  :from_request(requests.request_promotion_select, 'promotion_id')

selects.select_product_id = Select
  :from_request(requests.request_product_select, 'product_id')

selects.select_source_type = Select
  :from_request(requests.request_source_type_select, 'source_type')
  :with_field_description('description')

selects.select_order_type = Select
  :from_request(requests.request_order_type_select, 'order_type')
  :with_field_description('description')

selects.select_order_status = Select
  :from_request(requests.request_order_status_select, 'order_status')
  :with_field_description('description')

selects.select_payment_type = Select
  :from_request(requests.request_payment_type_select, 'payment_type')
  :with_field_description('description')

selects.select_payment_status = Select
  :from_request(requests.request_payment_status_select, 'payment_status')
  :with_field_description('description')

selects.select_promotion_type = Select
  :from_request(requests.request_promotion_type_select, 'promotion_type')
  :with_field_description('description')

selects.select_source_type = Select
  :from_request(requests.request_source_type_select, 'source_type')
  :with_field_description('description')

selects.select_event_type = Select
  :from_request(requests.request_event_type_select, 'event_type')
  :with_field_id('name')
  :with_field_description('description')

selects.select_event_source = Select
  :from_request(requests.request_event_source_select, 'event_source')
  :with_field_id('name')
  :with_field_description('description')

selects.select_event_topic = Select
  :from_request(requests.request_event_topic_select, 'event_topic')
  :with_field_id('name')
  :with_field_description('description')

selects.select_dispatch_type = Select
  :from_request(requests.request_dispatch_type_select, 'dispatch_type')
  :with_field_description('description')

selects.select_dispatch_status = Select
  :from_request(requests.request_dispatch_status_select, 'dispatch_status')
  :with_field_description('description')

selects.select_subscription_type = Select
  :from_request(requests.request_subscription_type_select, 'subscription_type')
  :with_field_description('description')

selects.select_template_type = Select
  :from_request(requests.request_template_type_select, 'template_type')
  :with_field_description('description')

selects.select_template_shape = Select
  :from_request(requests.request_template_shape_select, 'template_shape')
  :with_field_description('description')

return selects