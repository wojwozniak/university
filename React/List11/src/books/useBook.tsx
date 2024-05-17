import { useQuery } from "@tanstack/react-query";

async function fetchBooks(id: string) {
  const res = await fetch(`http://localhost:3000/book/${id}`);
  return await res.json();
}

function useBook(id: string) {
  return useQuery({
    queryKey: ["books", "book", id],
    queryFn: () => fetchBooks(id),
  });
}

export default useBook;