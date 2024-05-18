import { Book } from "../interfaces/Book";

export const getEmptyBook = (): Book => {
  const emptyBook: Book = {
    id: Date.now(),
    title: '',
    author: '',
    genre: '',
    numberOfCopies: 0,
    price: 0,
    publicationYear: 0
  }

  return emptyBook;
}