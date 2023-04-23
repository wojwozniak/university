/** 
 * Function returning random number in range from 0 to @param {number} max
 * 
*/
function getRandomInt(max) {
    return Math.floor(Math.random() * max);
} 

/** Variable containing current date in DD.MM.YYYY format */
let currentDate = new Date().toLocaleDateString();


/** Object array representing shopping list */
const list = [
     /**
     * Each object in this array consists of
     * @param {number} id - id of product
     * @param {string} name - name of product
     * @param {number} items - number of units of item to bu
     * @param {Date} date - date object in DD.MM.YYYY format representing last day we can buy given product 
     * @param {boolean} status - boolean representing if item is already bought
     * @param {number} price - price of 1 unit of product (set to 0 if status is false) 
     */
    {
        id: 0,
        name: 'boots',
        items: 1,
        date: '30.11.2022',
        status: false,
        price: 0
    },
    {
        id: 1,
        name: 'printer',
        items: 2,
        date: '30.12.2023',
        status: true,
        price: 25
    },
    {
        id: 2,
        name: 'markers',
        items: 20,
        date: '01.02.2024',
        status: false,
        price: 0
    },
    {
        id: 3,
        name: 'dog food',
        items: 1,
        date: currentDate,
        status: true,
        price: 40
    },
    {
        id: 5,
        name: 'dog',
        items: 5,
        date: currentDate,
        status: true,
        price: 200
    }
];

/**
 * Function adding new element to list
 * @param {string} name - name of item
 * @param {number} items - number of units needed
 * @param {Date} date - date object in DD.MM.YYYY format before which it needs to be bought
 * @param {boolean} status - boolean representing if item was bought yet
 * @param {number} price - price of one unit 
 * @returns {number} ID of newly added item 
 */
const addItemToList = (name, items, date, price, status) => {
    if(name === undefined || items === undefined || date === undefined) {
        throw new Error("Nie podano wystarczajacej ilosci argumentow!");
    }
    let newId = getRandomInt(21372137);
    let fixedDate = new Date(date).toLocaleDateString();
    let defaultStatus = false;
    let defaultPrice = 0;
    if(status) {
        defaultStatus = status;
    }
    if(price) {
        defaultPrice = price;
    }
    list.push(
        {
            id: newId,
            name: name,
            items: items,
            date: fixedDate,
            status: defaultStatus,
            price: defaultPrice
        }
    )
    return newId;
}

/**
 * Function deletes item with a given id
 * @param {number} id - id of item to delete
 */
const deleteItemFromList = (id) => {
    let i;
    let item = list.map(obj => {
        if(obj.id === id) {
            i = list.indexOf(obj);
        }
    });
    if(item.length != 0) {
        list.splice(i, 1);
    }
}

/**
 *  Function editing single property of item
 * @param {number} id - id of item to change
 * @param {string} property - name of property to change
 * @param {*} newValue - new value of property
 */
const editItem = (id, property, newValue) => {
    if(property === undefined || newValue === undefined) {
        throw new Error("Nie podano wystarczajacej ilosci argumentow!");
    }
    let item = list.map(obj => {
        if(obj.id === id) {
            obj[property] = newValue;
        }
    });
}

/**
 * Function that swaps two items' positions in the list
 * @param {number} id1 - id of first item to swap
 * @param {number} id2 - id of second item to swap
 */
const moveItem = (id1, id2) => {
    if(id1 === undefined || id2 === undefined) {
        throw new Error("Nie podano wystarczajacej ilosci argumentow!");
    }
    let i1 = 0, i2 = 0;
    let x  = list.map(obj => {
        if(obj.id == id1 && i1 == 0) {
            obj.id = id2;
            i1++;
        } else if(obj.id == id2 && i2 == 0) {
            obj.id = id1;
            i2++;
        }
    });
}

/**
 * Function returning array of objects with deadlines set on currentDay
 * @returns {object[]} - array of objects with deadlines set on currentDay
 */
const expiringToday = () => {
    let items = list.filter(obj => {
        return obj.date === currentDate;
    });
    return items;
}

/**
 * Function changing price of a given item. Assuming the item is getting bought - also changes status. Pass 0 as price to 'un-buy'
 * @param {number} id - Id of item
 * @param {number} price - New price
 */
const changePrice = (id,price) => {
    if(price === undefined) {
        throw new Error("Nie podano wystarczajacej ilosci argumentow!");
    }
    let item = list.map(obj => {
        if(obj.id===id) {
            if(price!=0) {
                obj['price'] = price;
                obj['status'] = true;
            } else {
                obj['price'] = price;
                obj['status'] = false;
            }
            
        }
    });
}

/**
 * Function returning all prices of items bought with deadline set to given day
 * @param {string} date - given date
 * @returns {number} Sum of all expenses on a given day 
 */
const priceOnDay = (date) => {
    let sum = 0;
    let x = list.map(obj => {
        if(obj.status === true && obj.date === date) {
            sum+=obj['price']*obj['items'];
        } 
    });
    return sum;
}

/**
 * Function allowing to mass format items with a given function
 * @param {array} ids - array of numbers containing all items' ids 
 * @param {function} func - function that we want to format items with
 */
const massFormat = (ids, func) => {
    if(func === undefined) {
        throw new Error("Nie podano wystarczajacej ilosci argumentow!");
    }
    for(let i=0; i<ids.length; i++) {
        func(id);
    }
}

/* ### Showcase ### */

console.log("Initial list");
console.table(list);


addItemToList('mouse', 2, "2014-02-11");
addItemToList('monitor', 1, "2014-02-21", 30, true);

console.log("Added two items");
console.table(list);


deleteItemFromList(0);

console.log("Deleted item with id 0");
console.table(list);


editItem(1, 'items', 1);

console.log("Changed amount of item with id 1!");
console.table(list);


moveItem(1,2);

console.log("Swapped ids of items 1 and 2!");
console.table(list);


console.log("Logging list of items expiring today!");
console.table(expiringToday());


changePrice(1, 0);
changePrice(2, 100);

console.log("Buying id 2 for 100, 'unbuying' item with id 1");
console.table(list);


console.log("Logging total price of items bought on 01.02.2024");
console.table(priceOnDay(currentDate));