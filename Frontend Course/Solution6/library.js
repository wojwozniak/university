const libraryStore = [];

//1. Wcześniejsze rozwiązanie z prototypem nie było wywoływane w poprawny sposób (przez co nie był rozpoznawany string)

const capitalize = (str) => str.length === 0 ? '' : str[0].toUpperCase() + str.slice(1);

/*
console.log("Zadanie 1: ");
console.log(capitalize('alice')); // 'Alice'
console.log(capitalize('')); // ''
*/

const capitalizeSentence = (str) => {
  let output = '';
  if(str.length == 0) {
    return '';
  }
  output += str[0].toUpperCase();
  for(let i=1; i<str.length; i++) {
    if(str[i-1]==' ') {
      output += str[i].toUpperCase();
    } else {
      output+= str[i];
    }
  }
  return output;
}

/*
console.log('Zadanie 2: ');
console.log(capitalizeSentence('alice')) // 'Alice'
console.log(capitalizeSentence('alice in Wonderland')) // 'Alice In Wonderland'
*/

class Media {
  #title;
  #ratings;
  #available;

  constructor(props) {
    try {
      if(!props.hasOwnProperty('title')) {
        throw new Error ("No props"); 
      } 
      if(typeof(props.title) !== 'string') {
        throw new Error ("Wrong type of title");
      }
    } catch (e) {
      throw new Error(e);
    }
    this.#title = capitalizeSentence(props.title);
    this.#ratings = [];
    this.#available = true
  }

  getTitle() {
    return this.#title;
  }

  getRatings() {
    return this.#ratings;
  }

  getAvailibility() {
    return this.#available;
  }

  setAvailibility() {
    this.#available = !this.#available;
    return this.#available;
  }

  addRating(rating) {
    try {
      if(typeof(rating) !== 'number') {
        throw new Error("Not a number in rating!");
      }
      if(rating <= 0) {
        throw new Error("Rating has to be a positive number!");
      }
    } catch (e) {
      throw new Error(e);
    }
    this.#ratings.push(rating);
  }

  orderMedia() {
    return new Promise((resolve, reject) => {
      if (this.getAvailibility()) {
        setTimeout(() => {
          this.setAvailibility();
          resolve();
        }, 1000)
        return;
      }

      reject("Not available")
    })
  }

  returnMedia() {
    return new Promise((resolve, reject) => {
      if (!this.getAvailibility()) {
        setTimeout(() => {
          this.setAvailibility();
          resolve();
        }, 1000)
        return;
      }

      reject("Already returned")
    })
  }
}

// Testy do zad 3
/*
const media = new Media({title: 'alice in wonderland'})
console.log(media.getTitle()) // 'Alice In Wonderland'
console.log(media.getRatings()) // []
console.log(media.getAvailibility()) // true

media.addRating(9);
media.addRating(8.5);
console.log(media.getRatings()); // [9, 8.5]

media.title = "not alice"
media.ratings = [1, 1]
media.available = false
console.log(media.getTitle()) // 'Alice In Wonderland'
console.log(media.getRatings()) // [9, 8.5]
console.log(media.getAvailibility()) // true
*/

// Testy do zad 4
/*
const test = async () => {
  const media = new Media({title: 'alice in wonderland'})

  await media.orderMedia() 
  console.log(media.getAvailibility()) // false

 await media.returnMedia()
 console.log(media.getAvailibility()) // true
}
test();

*/

//Zad 5
class Book extends Media {
  #author
  #pages

  constructor(props) {
    try {
      if(props.pages <= 0) {
        throw new Error("Wrong number of pages!");
      }
      if(props.author == undefined || props.pages == undefined) {
        throw new Error("Lacking props!");
     }
    } catch (e) {
      throw new Error(e);
    }
    super(props);
    this.#author = capitalizeSentence(props.author);
    this.#pages = props.pages;
  }

  getAuthor() {
    return this.#author;
  }

  getPages() {
    return this.#pages;
  }

  orderBook = () => this.orderMedia();
  returnBook = () => this.returnMedia();
}

//Testy do zad 5
/*

const test = async () => {
  const book = new Book({
    title: "alice's adventures in wonderland",
    author: 'lewis carroll',
    pages: 136
  })

  console.log(book.getTitle()) // "Alice's Adventures In Wonderland"
  console.log(book.getRatings()) // []
  console.log(book.getAvailibility()) // true
  console.log(book.getAuthor()) // 'Lewis Carroll'
  console.log(book.getPages()) // 136

  book.addRating(9)
  book.addRating(8.5)
  console.log(book.getRatings()); // [9, 8.5]

  book.title = "not alice"
  book.ratings = [1, 1]
  book.available = false
  book.author = "Charles Dickens"
  book.pages = 500
  console.log(book.getTitle()) // "Alice's Adventures In Wonderland"
  console.log(book.getRatings()) // [9, 8.5]
  console.log(book.getAvailibility()) // true
  console.log(book.getAuthor()) // 'Lewis Carroll'
  console.log(book.getPages()) // 136

  await book.orderBook()
  console.log(book.getAvailibility()) // false

  await book.returnBook()
  console.log(book.getAvailibility()) // true
}

test();
*/


// zad6
class Movie extends Media {
  #director
  #length

  constructor(props) {
    try {
      if(props.length <= 0) {
        throw new Error("Impossible length");
      }
      if(props.director == undefined || props.length == undefined) {
        throw new Error("Lacking props!");
      }
    } catch(e) {
      throw new Error(e);
    }
    super(props);
    this.#director = capitalizeSentence(props.director);
    this.#length = props.length;
  }

  getDirector() {
    return this.#director;
  }

  getLength() {
    return this.#length;
  }

  orderMovie = () => this.orderMedia();
  returnMovie = () => this.returnMedia();
}

//testy do zad6
/*

const test = async () => {
  const movie = new Movie({
    title: "alice in wonderland",
    director: 'tim burton',
    length: 108
  })

  console.log(movie.getTitle()) // 'Alice In Wonderland'
  console.log(movie.getRatings()) // []
  console.log(movie.getAvailibility()) // true
  console.log(movie.getDirector()) // 'Tim Burton'
  console.log(movie.getLength()) // 108

  movie.addRating(9)
  movie.addRating(8.5)
  console.log(movie.getRatings()) // [9, 8.5]

  movie.title = "not alice"
  movie.ratings = [1, 1]
  movie.available = false
  movie.director = "Tommy Wiseau"
  movie.length = 500
  console.log(movie.getTitle()) // 'Alice In Wonderland'
  console.log(movie.getRatings()) // [9, 8.5]
  console.log(movie.getAvailibility()) // true
  console.log(movie.getDirector()) // 'Tim Burton'
  console.log(movie.getLength()) // 108

  await movie.orderMovie()
  console.log(movie.getAvailibility()) // false

  await movie.returnMovie()
  console.log(movie.getAvailibility()) // true
}

test()
*/

//testy do zad. 7

//new Media()

//new Media({ title: 123 })

//new Book({ title: 123 })

//new Book({ title: "alice's adventures in wonderland" })

/*new Book({ 
  title: "alice's adventures in wonderland",
  author: 'Lewis Carroll',
  pages: -10
}) */

/* new Book({ 
  title: "alice's adventures in wonderland",
  author: 'Lewis Carroll',
}) */

//new Movie({ title: 123 })

//new Movie({ title: 'Alice in wonderland' })

/*new Movie({ 
  title: 'Alice in wonderland',
  director: 'tim burton',
  length: -10
}) */

/*new Movie({ 
  title: 'Alice in wonderland',
  director: 'tim burton',
}) */

/*new Media({ 
  title: 'Alice in wonderland',
}).addRating(0) */

/*
new Media({ 
  title: 'Alice in wonderland',
}).addRating([1,2,3])

*/


const addToLibrary = (props) => {
  let media;
  if(props == undefined) {
    console.log("You need to add props!");
    return undefined;
  }
  switch(props.type) {
    case "book": 
    if(props.title == undefined) {
      console.log("Wrong title");
      return undefined;
    }
      media = new Book(props)
      libraryStore.push(media)
      return media;
    case "movie": 
      media = new Movie(props)
      libraryStore.push(media)
      return media;
    default: 
      media = new Media(props);
      libraryStore.push(media)
      return media;
  }
}

// Test do zad 8

/*
const book = addToLibrary({
  type: 'book',
  title: "alice's adventures in wonderland",
  author: 'lewis carroll',
  pages: 136
})
const movie = addToLibrary({
  type: 'movie',
  title: "alice in wonderland",
  director: 'tim burton',
  length: 108
})
const media = addToLibrary({
  title: 'Media'
})

console.log(libraryStore) 
*/
/*
[ Book { _title: 'Alice\'s Adventures In Wonderland',
    _ratings: [],
    _available: true,
    _author: 'Lewis Carroll',
    _pages: 136 
  },
  Movie { _title: 'Alice In Wonderland',
    _ratings: [],
    _available: true,
    _director: 'Tim Burton',
    _length: 108 
  },
  Media { _title: 'Media', _ratings: [], _available: true }
]
*/

const book1 = addToLibrary({
  type: 'book',
  author: 'lewis carroll',
  pages: 136
}) // Wrong title
const book2 = addToLibrary({
  type: 'book',
  title: "alice's adventures in wonderland",
  pages: 136
}) // Wrong author
const book3 = addToLibrary({
  type: 'book',
  title: "alice's adventures in wonderland",
  author: 'lewis carroll',
}) // Wrong pages
const book4 = addToLibrary({
  type: 'book',
  title: "alice's adventures in wonderland",
  author: 'lewis carroll',
  pages: -10
}) // Wrong pages
const movie1 = addToLibrary({
  type: 'movie',
  director: 'tim burton',
  length: 108
}) // Wrong title
const movie2 = addToLibrary({
  type: 'movie',
  title: "alice in wonderland",
  length: 108
}) // Wrong director
const movie3 = addToLibrary({
  type: 'movie',
  title: "alice in wonderland",
  director: 'tim burton',
}) // Wrong length
const movie4 = addToLibrary({
  type: 'movie',
  title: "alice in wonderland",
  director: 'tim burton',
  length: -10
}) // Wrong length
const media2 = addToLibrary({
  title: 123
}) // Wrong title

function order(title) {
  for (let i = 0; i < libraryStore.length; i++) {
    if (libraryStore[i].title === title) {
      libraryStore[i].orderMedia().then(
        console.log("Order completed!")
      ).catch((e) => {
        console.log("Sorry! " + e)
      })
    }
  }
}