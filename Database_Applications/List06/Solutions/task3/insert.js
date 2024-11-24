db.booksvalidated.insertMany([
    {
        _id: 1,
        ISBN: "978-83-01-15905-3",
        title: "Mistrz i Małgorzata",
        author: "Mikhail Bulgakov",
        year_of_publication: 1967,
        price: NumberDecimal("30.00"),
        borrowed_last_month: false,
        copies: [
            {
                copyId: 1,
                signature: "A1234567",
                status: "available"
            },
            {
                copyId: 2,
                signature: "A1234568",
                status: "borrowed",
                borrowedBy: 1,
                borrowDate: new Date("2024-11-22"),
                returnDate: null
            }
        ]
    },
    {
        _id: 2,
        ISBN: "978-83-01-16788-1",
        title: "Wyznania gejszy",
        author: "Arthur Golden",
        year_of_publication: 1997,
        price: NumberDecimal("25.00"),
        borrowed_last_month: true,
        copies: [
            {
                copyId: 1,
                signature: "B1234567",
                status: "available"
            },
            {
                copyId: 2,
                signature: "B1234568",
                status: "borrowed",
                borrowedBy: 2,
                borrowDate: new Date("2024-11-20"),
                returnDate: new Date("2024-11-25")
            }
        ]
    }
]);
