struct Sudoku {
    data: Vec<Vec<u32>>,
}

impl Sudoku {
    /*
        Valid sudoku has only one occurence of each number
        in each row, column and square
        I don't see any way to avoid doing separate checks
        for each part, so I just go through and check all.
        I will copy and sort each thing to simplify the
        checks and make it easier to deal with variable size
        I will divide checking columns, rows and squares into
        separate functions for easier debugging
    */
    fn is_valid(&self) -> bool {
        let n: usize = self.data.len();

        let sqrt_n = (n as f64).sqrt() as usize;
        if !self.is_perfect_square(sqrt_n, n) || !self.is_square() {
            return false;
        };

        // Expected values in the part
        let expected: Vec<u32> = (1..(n + 1) as u32).collect();

        // Check correctness of parts
        let rows_correct: bool = self.are_rows_correct(&expected);
        let columns_correct: bool = self.are_columns_correct(&expected, n);
        let squares_correct: bool = self.are_squares_correct(&expected, sqrt_n);

        rows_correct && columns_correct && squares_correct
    }

    fn are_squares_correct(&self, expected: &[u32], sqrt_n: usize) -> bool {
        // Do not be scared of this, it's O(n^2), amount of loops is just for
        // simplicity
        for square_row in 0..sqrt_n {
            for square_col in 0..sqrt_n {
                let mut square_values = vec![];
                for row in 0..sqrt_n {
                    for col in 0..sqrt_n {
                        let row_val: usize = (square_row * sqrt_n + row) as usize;
                        let col_val: usize = (square_col * sqrt_n + col) as usize;
                        square_values.push(self.data[row_val][col_val]);
                    }
                }
                square_values.sort();
                if square_values != expected {
                    return false;
                }
            }
        }
        true
    }

    fn are_columns_correct(&self, expected: &[u32], n: usize) -> bool {
        for col in 0..n {
            let mut col_values = vec![];
            for row in 0..n {
                col_values.push(self.data[row][col]);
            }
            col_values.sort();
            if col_values != expected {
                return false;
            }
        }
        true
    }

    fn are_rows_correct(&self, expected: &[u32]) -> bool {
        for row in &self.data {
            let mut row_sorted = row.clone();
            row_sorted.sort();
            if row_sorted != expected {
                return false;
            }
        }
        true
    }

    fn is_perfect_square(&self, sqrt_n: usize, n: usize) -> bool {
        if sqrt_n * sqrt_n != n {
            return false;
        }
        true
    }

    fn is_square(&self) -> bool {
        self.data.iter().all(|row| row.len() == self.data.len())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn good_sudoku() {
        let good_sudoku_1 = Sudoku {
            data: vec![
                vec![7, 8, 4, 1, 5, 9, 3, 2, 6],
                vec![5, 3, 9, 6, 7, 2, 8, 4, 1],
                vec![6, 1, 2, 4, 3, 8, 7, 5, 9],
                vec![9, 2, 8, 7, 1, 5, 4, 6, 3],
                vec![3, 5, 7, 8, 4, 6, 1, 9, 2],
                vec![4, 6, 1, 9, 2, 3, 5, 8, 7],
                vec![8, 7, 6, 3, 9, 4, 2, 1, 5],
                vec![2, 4, 3, 5, 6, 1, 9, 7, 8],
                vec![1, 9, 5, 2, 8, 7, 6, 3, 4],
            ],
        };

        let good_sudoku_2 = Sudoku {
            data: vec![
                vec![1, 4, 2, 3],
                vec![3, 2, 4, 1],
                vec![4, 1, 3, 2],
                vec![2, 3, 1, 4],
            ],
        };
        assert!(good_sudoku_1.is_valid());
        assert!(good_sudoku_2.is_valid());
    }

    #[test]
    fn bad_sudoku() {
        let bad_sudoku_1 = Sudoku {
            data: vec![
                vec![1, 2, 3, 4, 5, 6, 7, 8, 9],
                vec![1, 2, 3, 4, 5, 6, 7, 8, 9],
                vec![1, 2, 3, 4, 5, 6, 7, 8, 9],
                vec![1, 2, 3, 4, 5, 6, 7, 8, 9],
                vec![1, 2, 3, 4, 5, 6, 7, 8, 9],
                vec![1, 2, 3, 4, 5, 6, 7, 8, 9],
                vec![1, 2, 3, 4, 5, 6, 7, 8, 9],
                vec![1, 2, 3, 4, 5, 6, 7, 8, 9],
                vec![1, 2, 3, 4, 5, 6, 7, 8, 9],
            ],
        };

        let bad_sudoku_2 = Sudoku {
            data: vec![
                vec![1, 2, 3, 4, 5],
                vec![1, 2, 3, 4],
                vec![1, 2, 3, 4],
                vec![1],
            ],
        };
        assert!(!bad_sudoku_1.is_valid());
        assert!(!bad_sudoku_2.is_valid());
    }
}
