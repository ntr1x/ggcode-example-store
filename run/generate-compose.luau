local ggcode = require("ggcode")
local route = require("compose/haproxy/route")

ggcode.generate "compose/compose" {
    target = '@',
    variables = {
        config = {
            include = {
                { path = "compose/env/env_haproxy.compose.yaml" },
                { path = "compose/env/env_kafka.compose.yaml" },
                { path = "compose/env/env_kafka_ui.compose.yaml" },
                { path = "compose/env/env_pgadmin.compose.yaml" },
                { path = "compose/env/env_postgres.compose.yaml" },
                { path = "compose/env/env_swagger_ui.compose.yaml" },
            }
        }
    }
}

ggcode.generate "compose/haproxy" {
    target = '@',
    variables = {
        routes = {
            route.route('env_kafka_ui', 'http://kafka-ui.local.example.com') {
                route.proxy('/', 'http://env_kafka_ui:8080', { check = true })
            };
            route.route('env_pgadmin', 'http://pgadmin.local.example.com') {
                route.proxy('/', 'http://env_pgadmin:80', { check = true })
            };
            route.route('env_swagger_ui', 'http://swagger-ui.local.example.com') {
                route.proxy('/', 'http://env_swagger_ui:8080', { check = true });
            };
            route.route('api', 'http://api.local.example.com') {
                route.proxy('/api/service_catalog', 'http://host.docker.internal:8080', { cors = "*", optional = true });
                route.proxy('/api/service_customers', 'http://host.docker.internal:8081', { cors = "*", optional = true });
                route.proxy('/api/service_basket', 'http://host.docker.internal:8082', { cors = "*", optional = true });
                route.proxy('/api/service_payments', 'http://host.docker.internal:8083', { cors = "*", optional = true });
            };
        }
    }
}

ggcode.generate "compose/kafka" { target = '@' }
ggcode.generate "compose/kafka_ui" { target = '@' }
ggcode.generate "compose/pgadmin" { target = '@' }
ggcode.generate "compose/postgres" { target = '@' }

ggcode.generate "compose/swagger_ui" {
    target = '@',
    variables = {
        config = {
            urls = {
                { name = "Service Catalogue", url = "http://api.local.example.com/api/service_catalog/v3/api-docs" },
                { name = "Service Customers", url = "http://api.local.example.com/api/service_customers/v3/api-docs" },
                { name = "Service Basket", url = "http://api.local.example.com/api/service_basket/v3/api-docs" },
                { name = "Service Payments", url = "http://api.local.example.com/api/service_payments/v3/api-docs" },
            }
        }
    }
}
