import { useQuery } from "@tanstack/react-query";

async function fetchBook(id: number) {
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