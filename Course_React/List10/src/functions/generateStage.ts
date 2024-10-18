import { Item } from "../interfaces/Item";
import { Stage } from "../interfaces/Stage";

const getRandomItem = (items: Item[]): Item => {
  const randomIndex = Math.floor(Math.random() * items.length);
  return items[randomIndex];
}

const shuffleStrings = (strings: string[]): string[] => {
  const shuffledStrings = [...strings];

  for (let i = shuffledStrings.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [shuffledStrings[i], shuffledStrings[j]] = [shuffledStrings[j], shuffledStrings[i]];
  }

  return shuffledStrings;
}

export const generateStage = (items: Item[]): Stage => {
  let correctItem: Item;
  let badItems: Item[] = [];

  do {
    correctItem = getRandomItem(items);
  } while (!correctItem.effect.trim());

  while (badItems.length < 3) {
    const newItem = getRandomItem(items);
    if (!badItems.some(item => item.id === newItem.id) && newItem.id !== correctItem.id) {
      badItems.push(newItem);
    }
  }

  const answers = shuffleStrings([correctItem.name, ...badItems.map(item => item.name)]);

  const stage: Stage = {
    question: correctItem.effect,
    correctAnswer: correctItem.name,
    imageUrl: correctItem.image,
    answers: answers
  };

  return stage;
}