## Hasura Storage

1. Run the migration `000001_create-initial-tables.up.sql` with tracking and do not track the `000002_non-trackable-functions.up.sql`
2. Create a new app in CapRover and name it `hasura-storage`
3. Set "Container HTTP Port": 8000 (maybe needed to add instead under "Port Mapping" values to "Server Port" and "Container Port")
4. Create environment variables:
```
DATABASE_URL=postgres://pguser:Asdc1523!Asdc1523!@srv-captain--api-db:5432/default
S3_ACCESS_KEY=mykey
S3_SECRET_KEY=mysecret
S3_ENDPOINT=http://srv-captain--files:9001
GRAPHQL_ENGINE_BASE_URL=http://srv-captain--api:8080
GRAPHQL_ENDPOINT=https://api.admin.servicehost.io/v1/graphql
HASURA_GRAPHQL_ADMIN_SECRET=mysecret
JWT_SECRET= (where do I get this? I use Firebase? From Firebase console?)
KEY=RqlRuJ56jxgp2BtF8fsnWMmQ0w3JHDeVGhTbo+uZ/Uhq7C/0iglEsK6hWpT2q1W8 (generated here: https://generate-random.org/encryption-key-generator?count=1&bytes=32&cipher=aes-256-cbc&string=&password=)
```

MINIO_SERVER_URL: https://files-api.admin.servicehost.io

DEBUG: "true"

## TODO CLI

npm install -g nhost