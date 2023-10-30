const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const wylosowanaLiczba = Math.floor(Math.random() * 101);

function rozpocznijGre() {
  rl.question('Zgadnij liczbę od 0 do 100: ', (odpowiedz) => {
    const liczba = parseInt(odpowiedz);

    if (liczba === wylosowanaLiczba) {
      console.log('To jest właśnie ta liczba!');
      rl.close();
    } else if (liczba < wylosowanaLiczba) {
      console.log('Moja liczba jest większa.');
      rozpocznijGre();
    } else {
      console.log('Moja liczba jest mniejsza.');
      rozpocznijGre();
    }
  });
}
rozpocznijGre();