# Refer to aggregations described at https://docs.mongodb.com/manual/aggregation/. Prepare a small example (similar the replication one) to explain the concept.

## Agreggation
Operation on multiple documents from a collection (done in db instead of querying documents and processing them manually)

- Sample collection
```js
use salesDB;

db.sales.insertMany([
    { item: "apple", quantity: 10, price: 2, category: "fruit", date: new Date("2024-11-01") },
    { item: "banana", quantity: 20, price: 1, category: "fruit", date: new Date("2024-11-02") },
    { item: "carrot", quantity: 15, price: 3, category: "vegetable", date: new Date("2024-11-03") },
    { item: "apple", quantity: 5, price: 2, category: "fruit", date: new Date("2024-11-04") },
    { item: "carrot", quantity: 7, price: 3, category: "vegetable", date: new Date("2024-11-05") },
    { item: "apple", quantity: 8, price: 2, category: "fruit", date: new Date("2024-11-06") }
]);
```

- Perform agreggation
```js
db.sales.aggregate([
    {
        $group: {
            _id: "$item", // Group by item
            totalQuantity: { $sum: "$quantity" }, // Calculate total quantity
            totalRevenue: { $sum: { $multiply: ["$quantity", "$price"] } } // Calculate total revenue
        }
    }
]);
```