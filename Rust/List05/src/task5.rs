fn execute(s: &str) -> String {
    // Six auxilliary values that will let us determine height and width of the grid
    let mut curr_w = 0; // width of grid - current value
    let mut max_w = i32::MIN; // max value that width had
    let mut min_w = i32::MAX; // min value that width had
    let mut curr_h = 0; // height of grid - current value
    let mut max_h = i32::MIN; // max value that height had
    let mut min_h = i32::MAX; // min value that height had

    let mut command_string = String::new(); // We generate command string,
                                            // unwrapping numbers if there are any

    let mut dir = 'U'; // T - top, B - bottom, L - left, R - right, U - undefined

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
                'L' => curr_w -= (num + 1) as i32,
                'B' => curr_h += (num - 1) as i32,
                'T' => curr_h -= (num + 1) as i32,
                _ => {}
            }
        }
        max_w = max_w.max(curr_w);
        min_w = min_w.min(curr_w);
        max_h = max_h.max(curr_h);
        min_h = min_h.min(curr_h);
    }

    let mut full_width = max_w - min_w;
    let mut full_height = max_h - min_h;

    // In this place, we have unwrapped command string and target width and
    // height. Now we can generate output string

    let mut output = String::new();

    command_string
    //output
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
