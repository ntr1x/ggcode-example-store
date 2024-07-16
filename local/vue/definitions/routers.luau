local Router = require('vue/Router')

local routes = require('vue/definitions/routes')
local views = require('vue/definitions/views')

local routers = {}

routers.router_personal = Router
  :from_view(views.view_personal, 'personal')
  :with_rules {
    routes.route_dashboard,
  }

routers.router_admin = Router
  :from_view(views.view_admin, 'admin')
  :with_rules {
    routes.route_customer_list,
    routes.route_customer_info,
    routes.route_agent_list,
    routes.route_agent_info,
    routes.route_order_list,
    routes.route_order_info,
    routes.route_payment_list,
    routes.route_category_list,
    routes.route_product_list,
    routes.route_product_info,
    routes.route_item_list,
    routes.route_region_list,
    routes.route_shop_list,
    routes.route_order_type_list,
    routes.route_order_status_list,
    routes.route_payment_type_list,
    routes.route_payment_status_list,
    routes.route_source_type_list,
    routes.route_promotion_type_list,
    routes.route_promotion_list,
    routes.route_event_list,
    routes.route_event_sources,
    routes.route_event_types,
    routes.route_event_topics,
    routes.route_subscription_list,
    routes.route_subscription_type_list,
    routes.route_dispatch_list,
    routes.route_dispatch_status_list,
    routes.route_dispatch_type_list,
    routes.route_template_list,
    routes.route_template_shape_list,
    routes.route_template_type_list,
  }

return routers
