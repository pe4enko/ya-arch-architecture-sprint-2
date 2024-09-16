sh.addShard( "shard1ReplSet/shard1-1:27018");
sh.addShard( "shard1ReplSet/shard1-2:27018");
sh.addShard( "shard1ReplSet/shard1-3:27018");

sh.addShard( "shard2ReplSet/shard2-1:27019");
sh.addShard( "shard2ReplSet/shard2-2:27019");
sh.addShard( "shard2ReplSet/shard2-3:27019");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )

use somedb

for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})

db.helloDoc.countDocuments()

exit();