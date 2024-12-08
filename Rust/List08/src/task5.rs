fn get_n_smallest(arr: Vec<i32>, n: usize) -> Vec<i32> {
    if n == 0 {
        return Vec::new();
    }

    let mut store: Vec<i32> = Vec::new();

    for &num in &arr {
        if store.len() < n {
            store.push(num);
        } else {
            if let Some(&max_in_store) = store.iter().max() {
                if num < max_in_store {
                    if let Some(pos) = store.iter().position(|&x| x == max_in_store) {
                        store.remove(pos);
                    }
                    store.push(num);
                }
            }
        }
    }

    store
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_sorted_array() {
        let arr = vec![1, 2, 3, 4, 5];
        let result = get_n_smallest(arr, 3);
        assert_eq!(result, vec![1, 2, 3]);
    }

    #[test]
    fn test_reverse_sorted_array() {
        let arr = vec![5, 4, 3, 2, 1];
        let result = get_n_smallest(arr, 3);
        assert_eq!(result, vec![3, 2, 1]);
    }

    #[test]
    fn test_with_duplicates() {
        let arr = vec![1, 2, 3, 4, 1];
        let result = get_n_smallest(arr, 3);
        assert_eq!(result, vec![1, 2, 1]);
    }

    #[test]
    fn test_with_negative_numbers() {
        let arr = vec![1, 2, 3, -4, 0];
        let result = get_n_smallest(arr, 3);
        assert_eq!(result, vec![1, -4, 0]);
    }

    #[test]
    fn test_zero_elements() {
        let arr = vec![1, 2, 3, 4, 5];
        let result = get_n_smallest(arr, 0);
        assert_eq!(result, Vec::<i32>::new());
    }

    #[test]
    fn test_n_equals_list_length() {
        let arr = vec![1, 2, 3, 4, 5];
        let result = get_n_smallest(arr, 5);
        assert_eq!(result, vec![1, 2, 3, 4, 5]);
    }

    #[test]
    fn test_n_greater_than_list_length() {
        let arr = vec![1, 2, 3, 4, 5];
        let result = get_n_smallest(arr, 10);
        assert_eq!(result, vec![1, 2, 3, 4, 5]);
    }

    #[test]
    fn test_all_elements_same() {
        let arr = vec![1, 1, 1, 1, 1];
        let result = get_n_smallest(arr, 3);
        assert_eq!(result, vec![1, 1, 1]);
    }

    #[test]
    fn test_all_negative_elements() {
        let arr = vec![-5, -4, -3, -2, -1];
        let result = get_n_smallest(arr, 3);
        assert_eq!(result, vec![-5, -4, -3]);
    }

    #[test]
    fn test_empty_array() {
        let arr: Vec<i32> = Vec::new();
        let result = get_n_smallest(arr, 3);
        assert_eq!(result, Vec::<i32>::new());
    }
}
