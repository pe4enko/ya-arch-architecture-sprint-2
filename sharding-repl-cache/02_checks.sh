#!/bin/bash
set -x

###
# Проверка шарда 1
###
echo "Проверка шарда 1"
docker compose exec -T shard1-1 mongosh --port 27018 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

###
# Проверка шарда 2
###
echo "Проверка шарда 2"
docker compose exec -T shard2-1 mongosh --port 27019 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

###
# Проверка кластера Redis
###
echo "Проверка кластера Redis"
docker compose exec redis_1 redis-cli cluster nodes