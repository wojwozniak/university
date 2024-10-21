// Let's notice that the pattern is just square getting bigger and alternating
// edge colours
// black 1x1
// white 3x3 edge
// black 5x5 edge
// So easiest and fastest way is to go down from each edge at once
// - Fill outermost edge with starting colour
// - Toggle colour
// - Fill outermost - 1 from each side
// -> repeat until we fill center black

fn zoom(n_int: i32) -> String {
    let n = n_int as usize;
    // Initialize n x n matrix of empty chars
    let mut matrix = vec![vec![' '; n]; n];

    // Determine starting layer character
    let starts_with_filled_layer = (n - 1) % 4 == 0;
    let mut curr_layer = 0;

    let mut next_char: char;
    while curr_layer < (n + 1) / 2 {
        // Determine the character to use for the current layer
        if (curr_layer % 2 == 0) == starts_with_filled_layer {
            next_char = '■';
        } else {
            next_char = '□';
        }

        // Fill the current layer
        for i in curr_layer..n - curr_layer {
            // Top left going right
            matrix[curr_layer][i] = next_char;
            // Bottom left going right
            matrix[n - 1 - curr_layer][i] = next_char;
            // Top left going down
            matrix[i][curr_layer] = next_char;
            // Top right going down
            matrix[i][n - 1 - curr_layer] = next_char;
        }

        curr_layer += 1;
    }

    // Convert into string and return
    matrix
        .iter()
        .map(|row| row.iter().collect::<String>())
        .collect::<Vec<String>>()
        .join("\n")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_zoom_1() {
        assert_eq!(zoom(1), "■");
    }

    #[test]
    fn test_zoom_3() {
        assert_eq!(zoom(3), "□□□\n□■□\n□□□");
    }

    #[test]
    fn test_zoom_5() {
        assert_eq!(zoom(5), "■■■■■\n■□□□■\n■□■□■\n■□□□■\n■■■■■");
    }

    #[test]
    fn test_zoom_7() {
        assert_eq!(
            zoom(7),
            "□□□□□□□\n□■■■■■□\n□■□□□■□\n□■□■□■□\n□■□□□■□\n□■■■■■□\n□□□□□□□"
        );
    }

    #[test]
    fn test_zoom_9() {
        assert_eq!(
            zoom(9),
            "■■■■■■■■■\n■□□□□□□□■\n■□■■■■■□■\n■□■□□□■□■\n■□■□■□■□■\n■□■□□□■□■\n■□■■■■■□■\n■□□□□□□□■\n■■■■■■■■■"
        );
    }
}
