# Refer to aggregations described at https://docs.mongodb.com/manual/aggregation/. Prepare a small example (similar the replication one) to explain the concept.

## Agreggation
Operation on multiple documents from a collection (done in db instead of querying documents and processing them manually)


### Show example

- I done this task in MongoDB Compass on `local/sales`. Example data in `data.json` in current directory

### Example aggregation
```js
db.sales.aggregate([
    {
        $group: {
            _id: "$item", // Group by item
            totalQuantity: { $sum: "$quantity" }, // Sum of quantities
            totalRevenue: { $sum: { $multiply: ["$quantity", "$price"] } } // Sum of total revenue (quantity * price)
        }
    }
]);
```