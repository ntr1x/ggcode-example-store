local Menu = require('vue/Menu')

local projects = require('vue/definitions/projects')
local pages = require('vue/definitions/pages')
local routers = require('vue/definitions/routers')
local routes = require('vue/definitions/routes')

local menus = {}

menus.menu_personal = Menu
  :from(projects.project, 'personal')
  :with_rules {
    Menu.Item:from_route(routers.router_personal, routes.route_dashboard):with_font_icon('pi pi-home'),
  }

menus.menu_orders = Menu
  :from(projects.project, 'orders')
  :with_roles({'realm:developer', 'realm:admin'})
  :with_rules {
    Menu.Item:from_route(routers.router_admin, routes.route_order_list):with_font_icon('pi pi-shopping-bag'),
    Menu.Item:from_route(routers.router_admin, routes.route_payment_list):with_font_icon('pi pi-money-bill'),
  }

menus.menu_profiles = Menu
  :from(projects.project, 'profiles')
  :with_roles({'realm:developer', 'realm:admin', 'realm:support'})
  :with_rules {
    Menu.Item:from_route(routers.router_admin, routes.route_customer_list):with_font_icon('pi pi-users'),
    Menu.Item:from_route(routers.router_admin, routes.route_agent_list):with_font_icon('pi pi-id-card'),
  }

menus.menu_notifications = Menu
  :from(projects.project, 'notifications')
  :with_roles({'realm:developer', 'realm:admin', 'realm:support'})
  :with_rules {
    Menu.Item:from_route(routers.router_admin, routes.route_dispatch_list):with_font_icon('pi pi-bell'),
    Menu.Item:from_route(routers.router_admin, routes.route_subscription_list):with_font_icon('pi pi-directions'),
    Menu.Item:from_route(routers.router_admin, routes.route_event_list):with_font_icon('pi pi-bolt'),
    Menu.Item:from_route(routers.router_admin, routes.route_template_list):with_font_icon('pi pi-file'),
  }

menus.menu_catalogue = Menu
  :from(projects.project, 'catalogue')
  :with_roles({'realm:developer', 'realm:admin'})
  :with_rules {
    Menu.Item:from_route(routers.router_admin, routes.route_category_list):with_font_icon('pi pi-tags'),
    Menu.Item:from_route(routers.router_admin, routes.route_product_list):with_font_icon('pi pi-table'),
    Menu.Item:from_route(routers.router_admin, routes.route_item_list):with_font_icon('pi pi-box'),
    Menu.Item:from_route(routers.router_admin, routes.route_promotion_list):with_font_icon('pi pi-gift'),
    Menu.Item:from_route(routers.router_admin, routes.route_region_list):with_font_icon('pi pi-map'),
    Menu.Item:from_route(routers.router_admin, routes.route_shop_list):with_font_icon('pi pi-warehouse'),
  }

menus.menu_dictionaries = Menu
  :from(projects.project, 'dictionaries')
  :with_roles({'realm:developer', 'realm:admin'})
  :with_rules {
    Menu.Item:from_route(routers.router_admin, routes.route_order_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_order_status_list):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_payment_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_payment_status_list):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_promotion_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_source_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_subscription_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_dispatch_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_dispatch_status_list):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_event_sources):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_event_topics):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_event_types):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_template_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_route(routers.router_admin, routes.route_template_shape_list):with_font_icon('pi pi-database'),
  }

return menus