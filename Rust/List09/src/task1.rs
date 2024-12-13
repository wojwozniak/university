// Tricky task - my idea is to go front down to up, and for each cell
// on level n add cell value + max(n-1 below to left, n-1 below to right)
fn max_slide_down(pyramid: Vec<Vec<i32>>) -> i32 {
    let mut pyramid = pyramid;

    // [[3], [7, 4], [2, 4, 6], [8, 5, 9, 3]] <- example input
    // first vector chooses level, second chooses cell on given level
    // We start from second lowest level and work our way to the top
    for level in (0..pyramid.len() - 1).rev() {
        for cell in 0..pyramid[level].len() {
            // Reverse indices on level here because we used rev()
            pyramid[level][cell] += pyramid[level + 1][cell].max(pyramid[level + 1][cell + 1]);
        }
    }

    // Return top of pyramid
    pyramid[0][0]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_example() {
        let pyramid = vec![vec![3], vec![7, 4], vec![2, 4, 6], vec![8, 5, 9, 3]];
        assert_eq!(max_slide_down(pyramid), 23);
    }

    #[test]
    fn test_single_element() {
        let pyramid = vec![vec![42]];
        assert_eq!(max_slide_down(pyramid), 42);
    }

    #[test]
    fn test_two_levels() {
        let pyramid = vec![vec![1], vec![2, 3]];
        assert_eq!(max_slide_down(pyramid), 4);
    }

    #[test]
    fn test_large_pyramid() {
        let pyramid = vec![vec![1], vec![2, 3], vec![4, 5, 6], vec![7, 8, 9, 10]];
        assert_eq!(max_slide_down(pyramid), 20);
    }

    #[test]
    fn test_negative_numbers() {
        let pyramid = vec![
            vec![-1],
            vec![-2, -3],
            vec![-4, -5, -6],
            vec![-7, -8, -9, -10],
        ];
        assert_eq!(max_slide_down(pyramid), -14);
    }
}
