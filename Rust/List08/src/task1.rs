struct PaintfuckInterpreter {
    grid: Vec<Vec<u8>>,
    pointer_x: usize,
    pointer_y: usize,
    width: usize,
    height: usize,
}

impl PaintfuckInterpreter {
    fn new(width: usize, height: usize) -> Self {
        Self {
            grid: vec![vec![0; width]; height],
            pointer_x: 0,
            pointer_y: 0,
            width,
            height,
        }
    }

    fn move_north(&mut self) {
        self.pointer_y = (self.pointer_y + self.height - 1) % self.height;
    }

    fn move_east(&mut self) {
        self.pointer_x = (self.pointer_x + 1) % self.width;
    }

    fn move_south(&mut self) {
        self.pointer_y = (self.pointer_y + 1) % self.height;
    }

    fn move_west(&mut self) {
        self.pointer_x = (self.pointer_x + self.width - 1) % self.width;
    }

    fn flip_bit(&mut self) {
        self.grid[self.pointer_y][self.pointer_x] ^= 1;
    }

    fn to_string(&self) -> String {
        self.grid
            .iter()
            .map(|row| row.iter().map(|&cell| cell.to_string()).collect::<String>())
            .collect::<Vec<String>>()
            .join("\r\n")
    }

    fn interpret(&mut self, code: &str, iterations: usize) -> String {
        let code_chars: Vec<char> = code.chars().collect();
        let mut index = 0;
        let mut iterations_performed = 0;

        while iterations_performed < iterations && index < code_chars.len() {
            let command = code_chars[index];
            match command {
                'n' => self.move_north(),
                'e' => self.move_east(),
                's' => self.move_south(),
                'w' => self.move_west(),
                '*' => self.flip_bit(),
                '[' => {
                    if self.grid[self.pointer_y][self.pointer_x] == 0 {
                        let mut bracket_count = 1;
                        while bracket_count > 0 && index < code_chars.len() - 1 {
                            index += 1;
                            match code_chars[index] {
                                '[' => bracket_count += 1,
                                ']' => bracket_count -= 1,
                                _ => {}
                            }
                        }
                    }
                }
                ']' => {
                    if self.grid[self.pointer_y][self.pointer_x] != 0 {
                        let mut bracket_count = 1;
                        while bracket_count > 0 && index > 0 {
                            index -= 1;
                            match code_chars[index] {
                                ']' => bracket_count += 1,
                                '[' => bracket_count -= 1,
                                _ => {}
                            }
                        }
                    }
                }
                _ => {}
            }

            index += 1;
            iterations_performed += 1;
        }

        self.to_string()
    }
}

fn interpreter(code: &str, iterations: usize, width: usize, height: usize) -> String {
    let mut paintfuck = PaintfuckInterpreter::new(width, height);
    paintfuck.interpret(code, iterations)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_grid_initialization() {
        let result = interpreter("", 0, 3, 3);
        assert_eq!(result, "000\r\n000\r\n000");
    }

    #[test]
    fn test_bit_flipping() {
        let result = interpreter("*", 1, 3, 3);
        assert_eq!(result, "100\r\n000\r\n000");
    }

    #[test]
    fn test_multiple_bit_flips() {
        let result = interpreter("**e*", 4, 3, 3);
        assert_eq!(result, "010\r\n000\r\n000");
    }

    #[test]
    fn test_movement_and_flipping() {
        let result = interpreter("nesw*", 5, 3, 3);
        assert_eq!(result, "100\r\n000\r\n000");
    }

    #[test]
    fn test_vertical_wrapping() {
        let result = interpreter("nnn*", 5, 3, 3);
        assert_eq!(result, "100\r\n000\r\n000");
    }

    #[test]
    fn test_horizontal_wrapping() {
        let result = interpreter("eee*", 4, 3, 3);
        assert_eq!(result, "100\r\n000\r\n000");
    }

    #[test]
    fn test_loop_skipping() {
        let result = interpreter("[*]e*", 4, 3, 3);
        assert_eq!(result, "010\r\n000\r\n000");
    }

    #[test]
    fn test_loop_execution() {
        let result = interpreter("*[*e*]", 5, 3, 3);
        assert_eq!(result, "010\r\n000\r\n000");
    }

    #[test]
    fn test_iteration_limit() {
        let result = interpreter("nesw*nesw*", 3, 3, 3);
        assert_eq!(result, "000\r\n000\r\n000");
    }

    #[test]
    fn test_non_command_characters() {
        let result = interpreter("hello*world", 7, 3, 3);
        assert_eq!(result, "010\r\n000\r\n000");
    }
}
