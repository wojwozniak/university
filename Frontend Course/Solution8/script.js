/**
 * Helper function used to capitalize pokemon name
 * @param {string} string - takes string to capitalize 
 * @returns {string} - capitalized string
 */
const capitalize = string => string[0].toUpperCase()+string.substring(1);

/**
 * Function handling errors - displaying message on screen
 * @param {error} error - error
 */
const handleError = (error) => {
    const screen = document.getElementById("screen");
    screen.innerHTML = ``;
    screen.style.backgroundColor = 'red';
    let errorMessage = document.createElement("p");
    errorMessage.classList.add("screen__error");
    let errorMessageContent = document.createTextNode(`
    Error!
    Problem might be caused by your internet connection.
    Try reloading page using 'F5' button!
    `);
    errorMessage.appendChild(errorMessageContent);
    screen.appendChild(errorMessage);
    console.error(error);
}

/**
 * Function taking url and returning flavour text about a spiecies
 * @param {string} url - url to species API endpoint 
 */
const handleFlavourText = (url, node) => {
    fetch(url)
    .then((response) => response.json())
    .then((data) => {
        let i = 0;
        data.flavor_text_entries.filter(entry => {
            if(entry.language.name == "en" && i == 0) {
                i++;
                node.textContent = entry.flavor_text;
            }
        }
    )})
    .catch((error) => handleError(error));
}

/**
 * Function rendering pokemons on display using response from pokeAPI
 * @param {object} data - response from pokeAPI
 */
const renderPokemon = (data) => {
    const screen = document.getElementById("screen");
    screen.innerHTML=``;

    let renderedName = document.createElement("h3");
    let text = document.createTextNode(capitalize(data.name));
    renderedName.appendChild(text);
    screen.appendChild(renderedName);

    let img_src = data.sprites.front_default;
    let renderedImg = document.createElement("img");
    renderedImg.setAttribute("src", img_src);
    screen.appendChild(renderedImg);

    let types = data.types;
    let typeDiv = document.createElement("div");
    typeDiv.classList.add("types");
    types.map(type => {
        let renderedType = document.createElement("p");
        let typeText = document.createTextNode(type.type.name);
        renderedType.appendChild(typeText);
        typeDiv.appendChild(renderedType);
    })
    screen.appendChild(typeDiv);

    let rendered_flavour = document.createElement("p");
    rendered_flavour.classList.add("screen__flavour_text");
    let flavour_text_content = document.createTextNode("Loading...");
    rendered_flavour.appendChild(flavour_text_content);
    handleFlavourText(data.species.url, rendered_flavour);
    screen.appendChild(rendered_flavour);
}

/**
 * Function rendering navigation with links to first 151 pokemons 
 * @param {object} data - response from pokeAPI
 */
const renderNav = (data) => {
    const list = document.getElementById("nav__list");
    const pokemons = data.results;
    pokemons.sort((a, b) => a.name.localeCompare(b.name));
    pokemons.map(pokemon => {
        let listElement = document.createElement("li");
        let link = document.createElement("a");
        link.classList.add("pokemon");
        let text = document.createTextNode(capitalize(pokemon.name));
        link.appendChild(text);
        link.setAttribute("href", "#");
        link.setAttribute("onclick", `handleClick("${pokemon.url}")`)
        listElement.appendChild(link);
        list.appendChild(listElement);
    });
}

/**
 * Function handling click in navigation menu, calling pokeAPI to get pokemon info
 * @param {string} url - url to call 
 */
const handleClick = (url) => {
    fetch(url)
    .then((response) => response.json())
    .then((data) => renderPokemon(data))
    .catch((error) => handleError(error));
}

// Fetching list of pokemons and passing it to renderNav function
fetch("https://pokeapi.co/api/v2/pokemon?limit=151")
.then((response) => response.json())
.then((data) => renderNav(data))
.catch((error) => handleError(error));