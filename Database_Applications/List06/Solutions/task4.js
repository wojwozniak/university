// query 1 - we just adjust skip and limit properly
db.booksvalidated.find()
    .sort({ title: 1 })
    .skip(1)
    .limit(2)
    .pretty();

// if we want to autocalculate we can use countDocuments() function
let totalCount = db.booksvalidated.countDocuments();

// query 2 - some condition applied on the nested structure
db.booksvalidated.find(
    { "copies.status": "borrowed" },
    { title: 1, "copies.$": 1 }
).pretty();