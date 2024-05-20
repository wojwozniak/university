import { useMutation, useQueryClient } from "@tanstack/react-query";
import { Book } from "../interfaces/Book";

async function updateBook(updatedBook: Book) {
  const res = await fetch(`http://localhost:3000/books/${updatedBook.id}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(updatedBook),
  });
  return await res.json();
}

function useUpdateBook() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: updateBook,
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: ["books", "list"],
      });
    },
  });
}

export default useUpdateBook;