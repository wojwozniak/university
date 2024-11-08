import { useQuery } from "@tanstack/react-query";

async function fetchBooks() {
  const res = await fetch(`http://localhost:3000/books`);
  return await res.json();
}

function useBooks() {
  return useQuery({
    queryKey: ["books", "list"],
    queryFn: () => fetchBooks(),
  });
}

export default useBooks;