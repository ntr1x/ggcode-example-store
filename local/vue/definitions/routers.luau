local Router = require('vue/Router')

local projects = require('vue/definitions/projects')
local pages = require('vue/definitions/pages')

local routers = {}

routers.router_admin = Router
  :from(projects.project, 'admin')
  :with_rules {
    Router.Route:from_page(pages.page_customer_list),
    Router.Route:from_page(pages.page_customer_info):with_path('customers/:customerId'),
    Router.Route:from_page(pages.page_agent_list),
    Router.Route:from_page(pages.page_agent_info):with_path('agents/:agentId'),
    Router.Route:from_page(pages.page_order_list),
    Router.Route:from_page(pages.page_order_info):with_path('orders/:orderId'),
    Router.Route:from_page(pages.page_payment_list),
    Router.Route:from_page(pages.page_category_list),
    Router.Route:from_page(pages.page_product_list),
    Router.Route:from_page(pages.page_product_info):with_path('products/:productId'),
    Router.Route:from_page(pages.page_item_list),
    Router.Route:from_page(pages.page_region_list),
    Router.Route:from_page(pages.page_shop_list),
    Router.Route:from_page(pages.page_order_type_list),
    Router.Route:from_page(pages.page_order_status_list),
    Router.Route:from_page(pages.page_payment_type_list),
    Router.Route:from_page(pages.page_payment_status_list),
    Router.Route:from_page(pages.page_source_type_list),
    Router.Route:from_page(pages.page_promotion_type_list),
    Router.Route:from_page(pages.page_promotion_list),
    Router.Route:from_page(pages.page_event_list),
    Router.Route:from_page(pages.page_event_sources),
    Router.Route:from_page(pages.page_event_types),
    Router.Route:from_page(pages.page_event_topics),
    Router.Route:from_page(pages.page_subscription_list),
    Router.Route:from_page(pages.page_subscription_type_list),
    Router.Route:from_page(pages.page_dispatch_list),
    Router.Route:from_page(pages.page_dispatch_status_list),
    Router.Route:from_page(pages.page_dispatch_type_list),
  }

return routers
