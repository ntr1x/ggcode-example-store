local Symbol = require('vue/control/Symbol')

local projects = require('vue/definitions/projects')

local symbols = {}

symbols.symbol_datetime = Symbol
  :from(projects.project, 'datetime')
  :with_import('date-fns', { format = 'formatDate' })
  :with_label('props.value == null ? null : formatDate(props.value, "PPpp")')

symbols.symbol_customer = Symbol
  :from(projects.project, 'customer')
  :with_label('props.value == null ? null : [props.value.name, props.value.patronymic, props.value.surname].filter(item => item != null).join(" ")')
  :with_route('props.value == null ? null : `/admin/customers/${props.value.id}`')
  :with_icon('"pi pi-user"')

symbols.symbol_agent = Symbol
  :from(projects.project, 'agent')
  :with_label('(props.value == null || props.value.customer == null) ? null : [props.value.customer.name, props.value.customer.patronymic, props.value.customer.surname].filter(item => item != null).join(" ")')
  :with_icon('"pi pi-user"')

symbols.symbol_id = Symbol
  :from(projects.project, 'id')
  :with_label('props.value')
  :with_decoration('"text-xs text-ellipsis"')

symbols.symbol_agent_ref = Symbol
  :from(projects.project, 'agent_ref')
  :with_label('"AGENT"')
  :with_route('`/admin/agents/${props.value}`')
  :with_decoration('"text-[0.6rem]"')

symbols.symbol_price = Symbol
  :from(projects.project, 'price')
  :with_label('props.value')
  :with_icon('"pi pi-money-bill"')

symbols.symbol_region = Symbol
  :from(projects.project, 'region')
  :with_label('props.value.name')
  :with_icon('"pi pi-map"')

symbols.symbol_source_type = Symbol
  :from(projects.project, 'source_type')
  :with_label('props.value.description')
  :with_decoration('decorations[props.value.name]')
  :with_record('decorations', {
    web = 'rounded bg-blue-800 text-white',
    mobile = 'rounded bg-purple-800 text-white',
  })

symbols.symbol_order_type = Symbol
  :from(projects.project, 'order_type')
  :with_label('props.value.description')
  :with_decoration('decorations[props.value.name]')
  :with_record('decorations', {
    CASH = 'rounded bg-green-800 text-white',
    CARD_INPLACE = 'rounded bg-teal-800 text-white',
    CARD_ONLINE = 'rounded bg-sky-800 text-white',
  })

symbols.symbol_order_status = Symbol
  :from(projects.project, 'order_status')
  :with_label('props.value.description')
  :with_decoration('decorations[props.value.name]')
  :with_record('decorations', {
    NEW = 'rounded bg-blue-800 text-white',
    ACCEPTED = 'rounded bg-green-800 text-white',
    REJECTED = 'rounded bg-red-800 text-white',
    CANCELED = 'rounded bg-orange-800 text-white',
  })

symbols.symbol_payment_type = Symbol
  :from(projects.project, 'payment_type')
  :with_label('props.value.description')
  :with_decoration('decorations[props.value.name]')
  :with_record('decorations', {
    CASH = 'rounded bg-green-800 text-white',
    CARD_INPLACE = 'rounded bg-teal-800 text-white',
    CARD_ONLINE = 'rounded bg-sky-800 text-white',
  })

symbols.symbol_payment_status = Symbol
  :from(projects.project, 'payment_status')
  :with_label('props.value.description')
  :with_decoration('decorations[props.value.name]')
  :with_record('decorations', {
    NEW = 'rounded bg-blue-800 text-white',
    ACCEPTED = 'rounded bg-green-800 text-white',
    REJECTED = 'rounded bg-red-800 text-white',
    CANCELED = 'rounded bg-orange-800 text-white',
  })

symbols.symbol_promotion_type = Symbol
  :from(projects.project, 'promotion_type')
  :with_label('props.value.description')
  :with_decoration('decorations[props.value.name]')
  :with_record('decorations', {
    DISCOUNT = 'rounded bg-green-800 text-white',
    BONUSES = 'rounded bg-teal-800 text-white',
    FREE_SHIPPING = 'rounded bg-sky-800 text-white',
  })

symbols.symbol_subscription_type = Symbol
  :from(projects.project, 'subscription_type')
  :with_label('props.value.description')
  :with_decoration('decorations[props.value.name]')
  :with_record('decorations', {
    FCM = 'rounded bg-green-800 text-white',
    HMS = 'rounded bg-indigo-800 text-white',
  })

symbols.symbol_event_topic_info = Symbol
  :from(projects.project, 'event_topic_info')
  :with_label('props.value == null ? null : `${props.value.name} (${props.value.description})`')
  :with_decoration('"rounded border border-gray-500"')

symbols.symbol_event_source_info = Symbol
  :from(projects.project, 'event_source_info')
  :with_label('`${props.value.name} (${props.value.description})`')
  :with_decoration('"rounded border border-gray-500"')

symbols.symbol_event_type_info = Symbol
  :from(projects.project, 'event_type_info')
  :with_label('`${props.value.name} (${props.value.description})`')
  :with_decoration('decorations[props.value.name]')
  :with_record('decorations', {
    created = 'rounded bg-blue-800 text-white',
    updated = 'rounded bg-green-800 text-white',
    removed = 'rounded bg-red-800 text-white',
    replaced = 'rounded bg-orange-800 text-white',
    upserted = 'rounded bg-amber-800 text-white',
  })

symbols.symbol_session_id = Symbol
  :from(projects.project, 'session_id')
  :with_label('props.value')
  :with_decoration('"text-xs text-ellipsis"')

symbols.symbol_dispatch_status = Symbol
  :from(projects.project, 'dispatch_status')
  :with_label('props.value.description')
  :with_decoration('decorations[props.value.name]')
  :with_record('decorations', {
    NEW = 'rounded bg-blue-800 text-white',
    DISPATCHED = 'rounded bg-orange-800 text-white',
    CONFIRMED = 'rounded bg-green-800 text-white',
    FAILED = 'rounded bg-red-800 text-white',
  })

symbols.symbol_dispatch_type = Symbol
  :from(projects.project, 'dispatch_type')
  :with_label('props.value.description')
  :with_decoration('decorations[props.value.name]')
  :with_record('decorations', {
    CUSTOMER = 'rounded bg-blue-800 text-white',
    AGENT = 'rounded bg-orange-800 text-white',
    SESSION = 'rounded bg-green-800 text-white',
    CRITERIA = 'rounded bg-red-800 text-white',
  })

symbols.symbol_template_shape = Symbol
  :from(projects.project, 'template_shape')
  :with_label('props.value.description')
  :with_decoration('decorations[props.value.name]')
  :with_record('decorations', {
    TEXT = 'rounded bg-blue-800 text-white',
    EMAIL = 'rounded bg-orange-800 text-white',
  })

symbols.symbol_template_type = Symbol
  :from(projects.project, 'template_type')
  :with_label('props.value.description')
  :with_decoration('decorations[props.value.name]')
  :with_record('decorations', {
    ['message:info'] = 'rounded bg-red-800 text-white',
    ['security:signin'] = 'rounded bg-orange-800 text-white',
    ['security:signup'] = 'rounded bg-orange-800 text-white',
    ['profile:updated'] = 'rounded bg-green-800 text-white',
    ['order:created'] = 'rounded bg-blue-800 text-white',
    ['order:packaged'] = 'rounded bg-blue-800 text-white',
    ['order:paid'] = 'rounded bg-blue-800 text-white',
    ['order:failed'] = 'rounded bg-blue-800 text-white',
    ['order:canceled'] = 'rounded bg-blue-800 text-white',
    ['order:ready'] = 'rounded bg-blue-800 text-white',
    ['order:complete'] = 'rounded bg-blue-800 text-white',
  })

return symbols