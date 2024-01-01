const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const r = Math.floor(Math.random() * 101);

function rozpocznijGre() {
  rl.question('Zgadnij liczbę od 0 do 100: ', (odpowiedz) => {
    const liczba = parseInt(odpowiedz);

    if (liczba === r) {
      console.log('to jest właśnie ta liczba');
      rl.close();
    } else if (liczba < r) {
      console.log('moja liczba jest większa');
      rozpocznijGre();
    } else {
      console.log('moja liczba jest mniejsza');
      rozpocznijGre();
    }
  });
}
rozpocznijGre();