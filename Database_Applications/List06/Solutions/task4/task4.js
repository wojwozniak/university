
// query 1 - we just adjust skip and limit to 2
let totalCount = db.booksvalidated.countDocuments();
let start = Math.floor((totalCount - 2) / 2);

db.booksvalidated.find()
    .sort({ title: 1 })
    .skip(start)
    .limit(2)
    .pretty();

// query 2 - some condition applied on the nested structure
db.booksvalidated.find(
    { "copies.status": "borrowed" },
    { title: 1, "copies.$": 1 }
).pretty();