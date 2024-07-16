local ggcode = require('core/ggcode')
local Project = require('core/Project')
local Liquibase = require('migrate/Liquibase')
local ChangeLog = require('migrate/ChangeLog')

local project = Project:from('store_migrate')

local datasource_app = {
  uri = 'jdbc:postgresql://env_postgres:5432/app',
  username = 'app',
  password = 'app'
}

local datasource_app_local = {
  uri = 'jdbc:postgresql://localhost:5432/app',
  username = 'app',
  password = 'app'
}

local datasource_app_host = {
  uri = 'jdbc:postgresql://host.docker.internal:5432/app',
  username = 'app',
  password = 'app'
}

local changelog = ChangeLog
  :from(project)
  :with_rules {
    ChangeLog.ChangeSet
      :from('1.0.0', 'Developer', "Setup profile tables")
      :with_up_scripts({
        'ddl/public/create/customer.sql',
        'ddl/public/create/customer_verify_email.sql',
        'ddl/public/create/customer_verify_phone.sql',
        'ddl/public/create/customer_bonus.sql',
        'ddl/public/create/agent.sql',
      })
      :with_down_scripts({
        'ddl/public/drop/agent.sql',
        'ddl/public/drop/customer_bonus.sql',
        'ddl/public/drop/customer_verify_phone.sql',
        'ddl/public/drop/customer_verify_email.sql',
        'ddl/public/drop/customer.sql',
      }),
    ChangeLog.ChangeSet
      :from('1.0.1', 'Developer', "Setup catalogue tables")
      :with_up_scripts({
        'ddl/public/create/image_type.sql',
        'ddl/public/create/attachment_type.sql',
        'ddl/public/create/source_type.sql',
        'ddl/public/create/region.sql',
        'ddl/public/create/shop.sql',
        'ddl/public/create/category.sql',
        'ddl/public/create/product.sql',
        'ddl/public/create/product_attachment.sql',
        'ddl/public/create/product_image.sql',
        'ddl/public/create/promotion_type.sql',
        'ddl/public/create/promotion.sql',
        'ddl/public/create/promotion_image.sql',
        'ddl/public/create/promotion_target.sql',
        'ddl/public/create/item.sql',
      })
      :with_down_scripts({
        'ddl/public/drop/item.sql',
        'ddl/public/drop/promotion_target.sql',
        'ddl/public/drop/promotion_image.sql',
        'ddl/public/drop/promotion.sql',
        'ddl/public/drop/promotion_type.sql',
        'ddl/public/drop/product_image.sql',
        'ddl/public/drop/product_attachment.sql',
        'ddl/public/drop/product.sql',
        'ddl/public/drop/category.sql',
        'ddl/public/drop/shop.sql',
        'ddl/public/drop/region.sql',
        'ddl/public/drop/source_type.sql',
        'ddl/public/drop/attachment_type.sql',
        'ddl/public/drop/image_type.sql',
      }),
    ChangeLog.ChangeSet
      :from('1.0.2', 'Developer', "Setup payment tables")
      :with_up_scripts({
        'ddl/public/create/favorite.sql',
        'ddl/public/create/basket.sql',
        'ddl/public/create/basket_entry.sql',
        'ddl/public/create/order_status.sql',
        'ddl/public/create/order_type.sql',
        'ddl/public/create/order.sql',
        'ddl/public/create/order_entry.sql',
        'ddl/public/create/order_discount.sql',
        'ddl/public/create/payment_status.sql',
        'ddl/public/create/payment_type.sql',
        'ddl/public/create/payment.sql',
      })
      :with_down_scripts({
        'ddl/public/drop/payment.sql',
        'ddl/public/drop/payment_type.sql',
        'ddl/public/drop/payment_status.sql',
        'ddl/public/drop/order_discount.sql',
        'ddl/public/drop/order_entry.sql',
        'ddl/public/drop/order.sql',
        'ddl/public/drop/order_type.sql',
        'ddl/public/drop/order_status.sql',
        'ddl/public/drop/basket_entry.sql',
        'ddl/public/drop/basket.sql',
        'ddl/public/drop/favorite.sql',
      }),
    ChangeLog.ChangeSet
      :from('1.0.3', 'Developer', "Setup event tables")
      :with_up_scripts({
        'ddl/public/create/event_source_info.sql',
        'ddl/public/create/event_topic_info.sql',
        'ddl/public/create/event_type_info.sql',
        'ddl/public/create/event.sql',
        'ddl/public/create/subscription_type.sql',
        'ddl/public/create/subscription.sql',
        'ddl/public/create/template_type.sql',
        'ddl/public/create/template_shape.sql',
        'ddl/public/create/template.sql',
        'ddl/public/create/dispatch_type.sql',
        'ddl/public/create/dispatch_status.sql',
        'ddl/public/create/dispatch.sql',
      })
      :with_down_scripts({
        'ddl/public/drop/dispatch.sql',
        'ddl/public/drop/dispatch_status.sql',
        'ddl/public/drop/dispatch_type.sql',
        'ddl/public/drop/template.sql',
        'ddl/public/drop/template_shape.sql',
        'ddl/public/drop/template_type.sql',
        'ddl/public/drop/subscription.sql',
        'ddl/public/drop/subscription_type.sql',
        'ddl/public/drop/event.sql',
        'ddl/public/drop/event_type_info.sql',
        'ddl/public/drop/event_topic_info.sql',
        'ddl/public/drop/event_source_info.sql',
      }),
  }

local liquibase = Liquibase:from(changelog, 'liquibase', datasource_app)
local liquibase_local = Liquibase:from(changelog, 'liquibase_local', datasource_app_local)
local liquibase_host = Liquibase:from(changelog, 'liquibase_host', datasource_app_host)

ggcode.generate "migrate/project" { target = '@store', variables = project:unwrap() }
ggcode.generate "migrate/changelog" { target = '@store', variables = changelog:unwrap() }
ggcode.generate "migrate/liquibase" { target = '@store', variables = liquibase:unwrap() }
ggcode.generate "migrate/liquibase" { target = '@store', variables = liquibase_local:unwrap() }
ggcode.generate "migrate/liquibase" { target = '@store', variables = liquibase_host:unwrap() }
