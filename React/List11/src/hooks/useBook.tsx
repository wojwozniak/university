import { useQuery } from "@tanstack/react-query";
import { getEmptyBook } from "../functions/getEmptyBook";

async function fetchBook(id: number) {
  if (id === 0) return getEmptyBook();
  const res = await fetch(`http://localhost:3000/books/${id}`);
  return await res.json();
}

function useBook(id: number) {
  return useQuery({
    queryKey: ["book", id],
    queryFn: () => fetchBook(id),
  });
}

export default useBook;