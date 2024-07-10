local Search = require('vue/control/Search')

local requests = require('vue/definitions/requests')

local searches = {}

searches.search_customer_id = Search
  :from_request(requests.request_customer_select, 'customer_id')
  :with_field_name('fullName')
  :with_field_description('email')

return searches