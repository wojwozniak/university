db.createCollection("booksvalidated",
    {
        validator: {
            $jsonSchema: {
                bsonType: "object",
                required: [
                    "ISBN",
                    "title",
                    "author",
                    "year_of_publication",
                    "price",
                    "borrowed_last_month",
                    "copies"
                ],
                properties: {
                    ISBN: {
                        bsonType: "string",
                        description: "ISBN must be a string and is required"
                    },
                    title: {
                        bsonType: "string",
                        description: "Title must be a string and is required"
                    },
                    author: {
                        bsonType: "string",
                        description: "Author must be a string and is required"
                    },
                    year_of_publication: {
                        bsonType: "int",
                        minimum: 1000,
                        maximum: 9999,
                        description: "Year of publication must be a 4-digit integer and is required"
                    },
                    price: {
                        bsonType: "decimal",
                        minimum: 0,
                        description: "Price must be a positive decimal number and is required"
                    },
                    borrowed_last_month: {
                        bsonType: "bool",
                        description: "borrowed_last_month must be a boolean and is required"
                    },
                    copies: {
                        bsonType: "array",
                        items: {
                            bsonType: "object",
                            required: [
                                "copyId",
                                "signature",
                                "status"
                            ],
                            properties: {
                                copyId: {
                                    bsonType: "int",
                                    minimum: 1,
                                    description: "copyId must be an integer greater than 0 and is required"
                                },
                                signature: {
                                    bsonType: "string",
                                    pattern: "^[A-Za-z0-9]{8}$",
                                    description: "Signature must be an 8-character alphanumeric string and is required"
                                },
                                status: {
                                    bsonType: "string",
                                    enum: [
                                        "available",
                                        "borrowed",
                                        "reserved"
                                    ],
                                    description: "Status must be one of 'available', 'borrowed', or 'reserved'"
                                },
                                borrowedBy: {
                                    bsonType: [
                                        "int",
                                        "null"
                                    ],
                                    description: "borrowedBy can be an integer or null"
                                },
                                borrowDate: {
                                    bsonType: [
                                        "date",
                                        "null"
                                    ],
                                    description: "borrowDate can be a date or null"
                                },
                                returnDate: {
                                    bsonType: [
                                        "date",
                                        "null"
                                    ],
                                    description: "returnDate can be a date or null"
                                }
                            }
                        },
                        description: "Copies must be an array of objects and is required"
                    }
                }
            }
        }
    })
