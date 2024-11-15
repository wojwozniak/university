// Just a simple bubblesort style solution with a escape clause (if we reach
// currect reachable maximum (full length of outside loop) then we instant return
// to not waste time. We could aim for some small optimisation here (f.e.
// go from top to bottom in middle loop and do max_diff check after first iter)
fn largest_difference(data: &[i32]) -> usize {
    let mut max_diff = 0;
    let n = data.len();

    for i in 0..n {
        for j in i..n {
            if data[i] <= data[j] {
                max_diff = max_diff.max(j - i);
            }
        }
        if n - i - 1 == max_diff {
            return max_diff;
        }
    }

    max_diff
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_example_1() {
        assert_eq!(largest_difference(&[1, 2, 3]), 2);
    }

    #[test]
    fn test_no_valid_pairs() {
        assert_eq!(largest_difference(&[3, 2, 1]), 0);
    }

    #[test]
    fn test_all_elements_equal() {
        assert_eq!(largest_difference(&[1, 1, 1]), 2);
    }

    #[test]
    fn test_pair_1_3() {
        assert_eq!(largest_difference(&[1, 2, 1, 3]), 3);
    }

    #[test]
    fn test_pair_1_3_with_extra() {
        assert_eq!(largest_difference(&[1, 2, 1, 3, 2]), 4);
    }

    #[test]
    fn test_single_element() {
        assert_eq!(largest_difference(&[5]), 0);
    }

    #[test]
    fn test_small_array_valid_pair() {
        assert_eq!(largest_difference(&[1, 2]), 1);
    }

    #[test]
    fn test_small_array_no_valid_pair() {
        assert_eq!(largest_difference(&[2, 1]), 0);
    }

    #[test]
    fn test_pair_1_5() {
        assert_eq!(largest_difference(&[1, 3, 2, 1, 5]), 4);
    }

    #[test]
    fn test_no_valid_pairs_large() {
        assert_eq!(largest_difference(&[10, 8, 4, 2, 1]), 0);
    }
}
