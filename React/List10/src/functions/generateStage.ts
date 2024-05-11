import { Item } from "../interfaces/Item";
import { Stage } from "../interfaces/Stage";

const getRandomItem = (items: Item[]): Item => {
  const randomIndex = Math.floor(Math.random() * items.length);
  return items[randomIndex];
}

const shuffleStrings = (a: string, b: string, c: string, d: string): string[] => {
  const stringsArray: string[] = [a, b, c, d];

  for (let i = stringsArray.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [stringsArray[i], stringsArray[j]] = [stringsArray[j], stringsArray[i]];
  }

  return stringsArray;
}

export const generateStage = (items: Item[]): Stage => {
  const correctItem = getRandomItem(items);
  const badItem1 = getRandomItem(items);
  const badItem2 = getRandomItem(items);
  const badItem3 = getRandomItem(items);

  const answers = shuffleStrings(correctItem.name, badItem1.name, badItem2.name, badItem3.name);

  const stage: Stage = {
    question: correctItem.effect,
    correctAnswer: correctItem.name,
    imageUrl: correctItem.image ? correctItem.image : undefined,
    answers: answers
  }

  return stage;
}