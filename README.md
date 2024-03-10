# Online Store Example

This example demonstrates how to use GGCode Spring, Docker, and Central repositories together. Use it to bootstrap a local environment with Postgres, PGAdmin, Kafka, KafkaUI, and HaProxy, along with a multi-module Spring Boot project featuring Product Catalog, Customer Database, Customer Basket, and specialized Payments microservices.

## Quick Start

### Prerequisites

#### Step 1

You need Java 17+ and Maven 3.8.8+ to build and run the application. Make sure that your Maven points to Java 17+.

#### Step 1

Upload your SSH Key to a GitHub. It is usually located in `~/.ssh/id_rsa.pub` on Linux.

#### Step 2

Add this routes to your hosts file:

```
127.0.0.1   swagger-ui.local.example.com
127.0.0.1   kafka-ui.local.example.com
127.0.0.1   pgadmin.local.example.com
127.0.0.1   api.local.example.com
```

It is usually located in `/etc/hosts` on Linux.

#### Step 3

Make sure that ports `80`, `5432` and `9092` are free on your system.

### Bootstraping

```bash
# Clone
git clone https://github.com/ntr1x/ggcode-example-store

# Go to the project root directory
cd ggcode-example-store

# Generate compose manifests
ggcode run @/run/generate-compose

# Generate spring boot applicaiton
ggcode run @/run/generate-spring
```

### Launching

#### Step 1

Launch required containers:

```bash
cd app
docker compose --profile env up -d
```

#### Step 2

Build the application:

```bash
cd store
mvn clean install
```

#### Step 3

Open the application in your IDE and launch these applications:

```
com.example.service.basket.ServiceBasketApplicationLocal
com.example.service.catalog.ServiceCatalogApplicationLocal
com.example.service.customers.ServiceCustomersApplicationLocal
com.example.service.payments.ServicePaymentsApplicationLocal
```

#### Step 4

Open in your browser:

- http://swagger-ui.local.example.com/
- http://kafka-ui.local.example.com/
- http://pgadmin.local.example.com/

## Futher Development

This project is a greate template for your real-world adoptions. If you want to develop your own application:

1. Move this project to your own Git repository.
1. Optionally remove the contents of the `app/` directory from `.gitignore` file.
1. Make some modifications in action scripts (they are located in `./run` directory)
1. Overwrite generated content using `ggcode run` command.
1. Commit & Push it to your Git repository.
