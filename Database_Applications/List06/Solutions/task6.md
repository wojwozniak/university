# Refer to the sharding tutorial at https://docs.mongodb.com/manual/sharding/. Prepare a small example (similar the replication one) to explain the concept.

## Sharding
Sharding divides large datasets across multiple servers (called shards) for horizontal scaling

Servers are grouped into:
- Shards: Store actual data
- Config Server: Maintains metadata about the cluster
- Mongos Router: Directs queries to the appropriate shard(s)

- Start by creating databases
```js
c:\Data\Databases\MongoDB\shard1
c:\Data\Databases\MongoDB\shard2
c:\Data\Databases\MongoDB\config
```
- Launch metadata server
```js
start "ConfigServer" mongod --configsvr --dbpath c:\Data\Databases\MongoDB\config --port 40000
```

- Start shards
```
start "Shard1" mongod --shardsvr --dbpath c:\Data\Databases\MongoDB\shard1 --port 50000
start "Shard2" mongod --shardsvr --dbpath c:\Data\Databases\MongoDB\shard2 --port 50001
```

- Start router

```js
start "Router" mongos --configdb localhost:40000 --port 60000
```

- Connect to router
```js
mongo --port 60000
```

- Handle sharding
```js
sh.addShard("localhost:50000");
sh.addShard("localhost:50001");
sh.enableSharding("testdb");
db.createCollection("testCollection");
sh.shardCollection("testdb.testCollection", { _id: "hashed" });
use testdb;
for (let i = 0; i < 100; i++) {
    db.testCollection.insert({ _id: i, value: `Document ${i}` });
}
```

- Check data distribution
```js
sh.status();
db.testCollection.getShardDistribution();
```

