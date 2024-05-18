import { useMutation, useQueryClient } from "@tanstack/react-query";
import { Book } from "../interfaces/Book";

async function addBook(book: Book) {
  const res = await fetch("http://localhost:3000/books", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(book),
  });
  return await res.json();
}

function useAddBook() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: addBook,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["books", "list"] });
    },
  });
}

export default useAddBook;