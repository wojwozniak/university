import { Item } from '../interfaces/Item';
import { Endpoint } from '../interfaces/Endpoint';
import { CategoryData } from '../interfaces/CategoryData';

export async function fetchData(endpoints: Endpoint[]): Promise<CategoryData[]> {
  try {
    const requests = endpoints.map(async endpoint => {
      const response = await fetch(endpoint.url);
      const { data } = await response.json();

      const transformedData: Item[] = data.map((item: any) => {
        const { id, attributes } = item;
        const { name, effect, image } = attributes;
        return { id, name, effect, image };
      });
      return { categoryName: endpoint.category, items: transformedData };
    });

    const results = await Promise.all(requests);
    return results;
  } catch (error) {
    console.error('Error fetching data:', error);
    return [{ categoryName: "", items: [] }]
  }
}