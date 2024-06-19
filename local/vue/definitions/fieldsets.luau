local Fieldset = require('vue/Fieldset')

local queries = require('vue/definitions/queries')
local symbols = require('vue/definitions/symbols')

local fieldsets = {}

fieldsets.fieldset_customer_info = Fieldset
  :from_query(queries.query_customer_get, 'customer_info')
  :with_rules {
    Fieldset.Field:from_path('name', 'name'),
    Fieldset.Field:from_path('patronymic', 'patronymic'),
    Fieldset.Field:from_path('surname', 'surname'),
    Fieldset.Field:from_path('email', 'email'),
    Fieldset.Field:from_path('phone', 'phone'),
  }

fieldsets.fieldset_agent_info = Fieldset
  :from_query(queries.query_agent_get, 'agent_info')
  :with_rules {
    Fieldset.Field:from_path('title', 'title'),
    Fieldset.Field:from_symbol('customer', symbols.symbol_customer, 'customer'),
  }

fieldsets.fieldset_order_info = Fieldset
  :from_query(queries.query_order_get, 'order_info')
  :with_rules {
    Fieldset.Field:from_symbol('customer', symbols.symbol_customer, 'customer'),
    Fieldset.Field:from_symbol('source_type', symbols.symbol_source_type, 'sourceType'),
    Fieldset.Field:from_symbol('order_type', symbols.symbol_order_type, 'orderType'),
    Fieldset.Field:from_symbol('order_status', symbols.symbol_order_status, 'orderStatus'),
    Fieldset.Field:from_symbol('region', symbols.symbol_region, 'region'),
    Fieldset.Field:from_symbol('price', symbols.symbol_price, 'price'),
    Fieldset.Field:from_symbol('discount', symbols.symbol_price, 'discount'),
    Fieldset.Field:from_symbol('spend', symbols.symbol_price, 'spend'),
    Fieldset.Field:from_symbol('bonus', symbols.symbol_price, 'bonus'),
    Fieldset.Field:from_symbol('created_at', symbols.symbol_datetime, 'createdAt'),
    Fieldset.Field:from_symbol('updated_at', symbols.symbol_datetime, 'updatedAt'),
  }

fieldsets.fieldset_product_info = Fieldset
  :from_query(queries.query_product_get, 'product_info')
  :with_rules {
    Fieldset.Field:from_path('name', 'name'),
    Fieldset.Field:from_path('description', 'description'),
  }

return fieldsets