var booksCount = function() {
	var count = db.books.count();
	print("Number: "+count);
};

booksCount();