/*
export const a = 'Hello';
export const b = 'World';

const c = 'Hello, World!';
export default c;
const d = 'Hello, World!';
*/
// export default d; // SyntaxError: 'default' modifier may appear only once per module

// ale powyższego kodu nie uruchomimy bez zmian w konfiguracji więc można uzyć module.exports
module.exports.a = 'Hello';
module.exports.b = 'World';
module.exports.default = 'Hello, World!';