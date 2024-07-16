local Router = require('vue/Router')

local pages = require('vue/definitions/pages')

local routes = {}

routes.route_dashboard = Router.Route
  :from_page(pages.page_dashboard)
  :with_auth()

routes.route_customer_list = Router.Route
  :from_page(pages.page_customer_list)
  :with_roles({'realm:developer', 'realm:admin', 'realm:support'})

routes.route_customer_info = Router.Route
  :from_page(pages.page_customer_info)
  :with_path('customers/:customerId')
  :with_roles({'realm:developer', 'realm:admin', 'realm:support'})

routes.route_agent_list = Router.Route
  :from_page(pages.page_agent_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_agent_info = Router.Route
  :from_page(pages.page_agent_info)
  :with_path('agents/:agentId')
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_order_list = Router.Route
  :from_page(pages.page_order_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_order_info = Router.Route
  :from_page(pages.page_order_info):with_path('orders/:orderId')
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_payment_list = Router.Route
  :from_page(pages.page_payment_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_category_list = Router.Route
  :from_page(pages.page_category_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_product_list = Router.Route
  :from_page(pages.page_product_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_product_info = Router.Route
  :from_page(pages.page_product_info):with_path('products/:productId')
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_item_list = Router.Route
  :from_page(pages.page_item_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_region_list = Router.Route
  :from_page(pages.page_region_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_shop_list = Router.Route
  :from_page(pages.page_shop_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_order_type_list = Router.Route
  :from_page(pages.page_order_type_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_order_status_list = Router.Route
  :from_page(pages.page_order_status_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_payment_type_list = Router.Route
  :from_page(pages.page_payment_type_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_payment_status_list = Router.Route
  :from_page(pages.page_payment_status_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_source_type_list = Router.Route
  :from_page(pages.page_source_type_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_promotion_type_list = Router.Route
  :from_page(pages.page_promotion_type_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_promotion_list = Router.Route
  :from_page(pages.page_promotion_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_event_list = Router.Route
  :from_page(pages.page_event_list)
  :with_roles({'realm:developer', 'realm:admin', 'realm:support'})

routes.route_event_sources = Router.Route
  :from_page(pages.page_event_sources)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_event_types = Router.Route
  :from_page(pages.page_event_types)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_event_topics = Router.Route
  :from_page(pages.page_event_topics)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_subscription_list = Router.Route
  :from_page(pages.page_subscription_list)
  :with_roles({'realm:developer', 'realm:admin', 'realm:support'})

routes.route_subscription_type_list = Router.Route
  :from_page(pages.page_subscription_type_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_dispatch_list = Router.Route
  :from_page(pages.page_dispatch_list)
  :with_roles({'realm:developer', 'realm:admin', 'realm:support'})

routes.route_dispatch_status_list = Router.Route
  :from_page(pages.page_dispatch_status_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_dispatch_type_list = Router.Route
  :from_page(pages.page_dispatch_type_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_template_list = Router.Route
  :from_page(pages.page_template_list)
  :with_roles({'realm:developer', 'realm:admin', 'realm:support'})

routes.route_template_shape_list = Router.Route
  :from_page(pages.page_template_shape_list)
  :with_roles({'realm:developer', 'realm:admin'})

routes.route_template_type_list = Router.Route
  :from_page(pages.page_template_type_list)
  :with_roles({'realm:developer', 'realm:admin'})

return routes
