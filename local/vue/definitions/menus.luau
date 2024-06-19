local Menu = require('vue/Menu')

local projects = require('vue/definitions/projects')
local pages = require('vue/definitions/pages')
local routers = require('vue/definitions/routers')

local menus = {}

menus.menu_orders = Menu
  :from(projects.project, 'orders')
  :with_rules {
    Menu.Item:from_page(routers.router_admin, pages.page_order_list):with_font_icon('pi pi-shopping-bag'),
    Menu.Item:from_page(routers.router_admin, pages.page_payment_list):with_font_icon('pi pi-money-bill'),
  }

menus.menu_profiles = Menu
  :from(projects.project, 'profiles')
  :with_rules {
    Menu.Item:from_page(routers.router_admin, pages.page_customer_list):with_font_icon('pi pi-users'),
    Menu.Item:from_page(routers.router_admin, pages.page_agent_list):with_font_icon('pi pi-id-card'),
  }

menus.menu_notifications = Menu
  :from(projects.project, 'notifications')
  :with_rules {
    Menu.Item:from_page(routers.router_admin, pages.page_dispatch_list):with_font_icon('pi pi-bell'),
    Menu.Item:from_page(routers.router_admin, pages.page_subscription_list):with_font_icon('pi pi-directions'),
    Menu.Item:from_page(routers.router_admin, pages.page_event_list):with_font_icon('pi pi-bolt'),
  }

menus.menu_catalogue = Menu
  :from(projects.project, 'catalogue')
  :with_rules {
    Menu.Item:from_page(routers.router_admin, pages.page_category_list):with_font_icon('pi pi-tags'),
    Menu.Item:from_page(routers.router_admin, pages.page_product_list):with_font_icon('pi pi-table'),
    Menu.Item:from_page(routers.router_admin, pages.page_item_list):with_font_icon('pi pi-box'),
    Menu.Item:from_page(routers.router_admin, pages.page_promotion_list):with_font_icon('pi pi-gift'),
    Menu.Item:from_page(routers.router_admin, pages.page_region_list):with_font_icon('pi pi-map'),
    Menu.Item:from_page(routers.router_admin, pages.page_shop_list):with_font_icon('pi pi-warehouse'),
  }

menus.menu_dictionaries = Menu
  :from(projects.project, 'dictionaries')
  :with_rules {
    Menu.Item:from_page(routers.router_admin, pages.page_order_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_page(routers.router_admin, pages.page_order_status_list):with_font_icon('pi pi-database'),
    Menu.Item:from_page(routers.router_admin, pages.page_payment_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_page(routers.router_admin, pages.page_payment_status_list):with_font_icon('pi pi-database'),
    Menu.Item:from_page(routers.router_admin, pages.page_promotion_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_page(routers.router_admin, pages.page_source_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_page(routers.router_admin, pages.page_subscription_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_page(routers.router_admin, pages.page_dispatch_type_list):with_font_icon('pi pi-database'),
    Menu.Item:from_page(routers.router_admin, pages.page_dispatch_status_list):with_font_icon('pi pi-database'),
    Menu.Item:from_page(routers.router_admin, pages.page_event_sources):with_font_icon('pi pi-database'),
    Menu.Item:from_page(routers.router_admin, pages.page_event_topics):with_font_icon('pi pi-database'),
    Menu.Item:from_page(routers.router_admin, pages.page_event_types):with_font_icon('pi pi-database'),
  }

return menus