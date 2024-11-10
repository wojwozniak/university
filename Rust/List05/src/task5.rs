fn execute(s: &str) -> String {
    // Six auxiliary values that will let us determine height and width of the grid
    let mut curr_w = 0; // width of grid - current value
    let mut max_w = 0; // max value that width had
    let mut min_w = 0; // min value that width had
    let mut curr_h = 0; // height of grid - current value
    let mut max_h = 0; // max value that height had
    let mut min_h = 0; // min value that height had

    let mut command_string = String::new(); // We generate command string,
                                            // unwrapping numbers if there are any

    let mut dir = 'R'; // T - top, B - bottom, L - left, R - right

    // We go over chars, unwrapping numbers and calculating dimensions in the process
    for c in s.chars() {
        // First we go over and determine direction and add unwrapped to command string
        if c == 'L' || c == 'R' {
            dir = rotate(dir, c);
            command_string.push(c);
        } else if c == 'F' {
            command_string.push('F');
            match dir {
                'R' => curr_w += 1,
                'L' => curr_w -= 1,
                'B' => curr_h += 1,
                'T' => curr_h -= 1,
                _ => {}
            }
        } else if let Some(num) = c.to_digit(10) {
            for _ in 0..num - 1 {
                command_string.push('F');
            }
            match dir {
                'R' => curr_w += (num - 1) as i32,
                'L' => curr_w -= (num - 1) as i32,
                'B' => curr_h += (num - 1) as i32,
                'T' => curr_h -= (num - 1) as i32,
                _ => {}
            }
        }
        max_w = max_w.max(curr_w);
        min_w = min_w.min(curr_w);
        max_h = max_h.max(curr_h);
        min_h = min_h.min(curr_h);
    }

    // Calculate full width and height
    let full_width = (max_w - min_w + 1) as usize;
    let full_height = (max_h - min_h + 1) as usize;

    // Initialize grid. We could not use it, but this way it is more understandable
    let mut grid = vec![vec![' '; full_width]; full_height];

    // Initialise start position
    let mut x = (0 - min_w) as usize;
    let mut y = (0 - min_h) as usize;
    grid[y][x] = '*';

    // Fill movement
    for command in command_string.chars() {
        if command == 'F' {
            match dir {
                'R' => x += 1,
                'L' => x -= 1,
                'B' => y += 1,
                'T' => y -= 1,
                _ => {}
            }
            if x < full_width && y < full_height {
                grid[y][x] = '*';
            }
        } else {
            dir = rotate(dir, command);
        }
    }

    // Convert the grid to the required output string format
    let output = grid
        .into_iter()
        .map(|row| row.iter().collect::<String>())
        .collect::<Vec<_>>()
        .join("\r\n");

    output
}

/* Auxiliary function returning new direction */
fn rotate(curr_dir: char, command: char) -> char {
    match (curr_dir, command) {
        ('T', 'R') => 'R',
        ('R', 'R') => 'B',
        ('B', 'R') => 'L',
        ('L', 'R') => 'T',
        ('T', 'L') => 'L',
        ('L', 'L') => 'B',
        ('B', 'L') => 'R',
        ('R', 'L') => 'T',
        _ => 'U', // undefined
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_1() {
        assert_eq!(execute(""), "*");
    }

    #[test]
    fn test_2() {
        assert_eq!(execute("FFFFF"), "******");
    }

    #[test]
    fn test_3() {
        assert_eq!(
            execute("FFFFFLFFFFFLFFFFFLFFFFFL"),
            "******\r\n*    *\r\n*    *\r\n*    *\r\n*    *\r\n******"
        );
    }

    #[test]
    fn test_4() {
        assert_eq!(
            execute("LFFFFFRFFFRFFFRFFFFFFF"),
            "    ****\r\n    *  *\r\n    *  *\r\n********\r\n    *   \r\n    *   "
        );
    }

    #[test]
    fn test_5() {
        assert_eq!(
            execute("LF5RF3RF3RF7"),
            "    ****\r\n    *  *\r\n    *  *\r\n********\r\n    *   \r\n    *   "
        );
    }
}
