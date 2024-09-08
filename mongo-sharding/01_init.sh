#!/bin/bash
set -x

###
# Инициализируем бд
###

docker compose exec configSrv sh -c "mongosh --port 27020 < /scripts/init-configserver.js"

docker compose exec shard1 sh -c "mongosh --port 27018 < /scripts/init-shard01.js"
docker compose exec shard2 sh -c "mongosh --port 27019 < /scripts/init-shard02.js"

docker compose exec mongos_router sh -c "mongosh --port 27017 < /scripts/init-mongos-router.js"