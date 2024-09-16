rs.initiate(
    {
        _id : "shard2ReplSet",
        members: [
            { _id : 3, host : "shard2-1:27019" },
            { _id : 4, host : "shard2-2:27019" },
            { _id : 5, host : "shard2-3:27019" }
        ]
    }
);

exit();