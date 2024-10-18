const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('Podaj swoje imię: ', (imię) => {
  console.log(`Witaj ${imię}!`);
  rl.close();
});