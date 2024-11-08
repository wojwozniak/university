// # Task 3 # - Circle area inside square

fn square_area_to_circle(area: f64) -> f64 {
    let radius = area.sqrt() / 2.0;
    std::f64::consts::PI * radius.powi(2)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_basic() {
        assert_eq!(
            square_area_to_circle(81.0),
            4.5_f64.powi(2) * std::f64::consts::PI
        );
    }

    #[test]
    fn test_basic_2() {
        assert_eq!(
            square_area_to_circle(64.0),
            4.0_f64.powi(2) * std::f64::consts::PI
        );
    }

    #[test]
    fn test_zero_area() {
        assert_eq!(square_area_to_circle(0.0), 0.0);
    }

    #[test]
    fn test_non_perfect_square_area() {
        let area: f64 = 50.0;
        let expected_circle_area = (area.sqrt() / 2.0).powi(2) * std::f64::consts::PI;
        assert!((square_area_to_circle(area) - expected_circle_area).abs() < 1e-10);
    }

    #[test]
    fn test_large_area() {
        let area: f64 = 1000000.0;
        let expected_circle_area = (area.sqrt() / 2.0).powi(2) * std::f64::consts::PI;
        assert!((square_area_to_circle(area) - expected_circle_area).abs() < 1e-10);
    }
}
