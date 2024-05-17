import { useMutation, useQueryClient } from "@tanstack/react-query";

async function addBook(title: string) {
  const res = await fetch("http://localhost:3000/posts", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    // #TODO --- body: JSON.stringify({ title, author: "me" }),
  });
  return await res.json();
}

function useAddPosts() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: addBook,
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: ["books", "list"],
      });
    },
  });
}

export default useAddPosts;