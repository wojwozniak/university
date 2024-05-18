import { useQuery } from "@tanstack/react-query";

async function fetchBooks(searchTitle?: string, searchAuthor?: string) {
  const res = await fetch(`http://localhost:3000/books`);
  return await res.json();
}

function useBooks(searchTitle?: string, searchAuthor?: string) {
  return useQuery({
    queryKey: ["books", "list", { searchTitle, searchAuthor }],
    queryFn: () => fetchBooks(searchTitle, searchAuthor),
  });
}

export default useBooks;