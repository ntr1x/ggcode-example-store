POST http://auth.local.example.com/auth/realms/application/protocol/openid-connect/token
[BasicAuth]
api: 4Ggxc50xzu5j1qFk5rZ4OPHwvNFXLpNX
[FormParams]
grant_type: password
scope: openid
username: admin
password: Qwerty123
HTTP 200
[Captures]
access_token: jsonpath "$.access_token"
refresh_token: jsonpath "$.refresh_token"

GET http://auth.local.example.com/auth/realms/application/protocol/openid-connect/userinfo
Authorization: Bearer {{access_token}}
HTTP 200
[Captures]
customer_id: jsonpath "$.sub"

POST http://api.local.example.com/api/assembly_web/system/public_category
Authorization: Bearer {{access_token}}
{
  "name": "Demo Group",
  "description": "Demo Group Description"
}
HTTP 200
[Captures]
group_id: jsonpath "$.created.id"

POST http://api.local.example.com/api/assembly_web/system/public_category/select
Authorization: Bearer {{access_token}}
{}
HTTP 200

DELETE http://api.local.example.com/api/assembly_web/system/public_category/i/{{group_id}}
Authorization: Bearer {{access_token}}
HTTP 200
