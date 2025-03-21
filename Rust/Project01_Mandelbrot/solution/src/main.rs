mod color;
mod complex;
mod image;

use color::{get_color, get_hsv_color};
use std::env;

fn generate_mandelbrot(
    width: u32,
    height: u32,
    filename: &str,
    use_coloring: bool,
    xmin: f64,
    xmax: f64,
    ymin: f64,
    ymax: f64,
) {
    let mut img = image::Image::new(width, height);
    let scale_x = (xmax - xmin) / width as f64;
    let scale_y = (ymax - ymin) / height as f64;
    let max_iterations: u32 = 1000;

    for x in 0..width {
        let re = xmin + x as f64 * scale_x;
        for y in 0..height {
            let im = ymin + y as f64 * scale_y;
            let mut z = complex::Complex::new(0.0, 0.0);
            let c = complex::Complex::new(re, im);
            let mut iteration = 0;

            while iteration < max_iterations && z.magnitude_squared() <= 4.0 {
                z = z.multiply(z).add(c);
                iteration += 1;
            }

            let color = if use_coloring {
                get_hsv_color(iteration, max_iterations)
            } else {
                get_color(iteration, max_iterations)
            };
            img.set_pixel(x, y, color.0, color.1, color.2);
        }
    }

    img.save_to_ppm(filename)
        .expect("Failed to save mandelbrot image!");
}

fn main() {
    let args: Vec<String> = env::args().collect();

    let width = args.get(1).and_then(|s| s.parse().ok()).unwrap_or(800);
    let height = args.get(2).and_then(|s| s.parse().ok()).unwrap_or(800);
    let filename = args.get(3).map(|s| s.as_str()).unwrap_or("mandelbrot.ppm");
    let is_colored = args.get(4).and_then(|s| s.parse().ok()).unwrap_or(true);
    let x_min = args.get(5).and_then(|s| s.parse().ok()).unwrap_or(-2.0);
    let x_max = args.get(6).and_then(|s| s.parse().ok()).unwrap_or(0.47);
    let y_min = args.get(7).and_then(|s| s.parse().ok()).unwrap_or(-1.12);
    let y_max = args.get(8).and_then(|s| s.parse().ok()).unwrap_or(1.12);

    generate_mandelbrot(
        width, height, filename, is_colored, x_min, x_max, y_min, y_max,
    );
}
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_default_mandelbrot() {
        generate_mandelbrot(800, 800, "test_default.ppm", false, -2.0, 0.47, -1.12, 1.12);
    }

    #[test]
    fn test_default_mandelbrot_coloured() {
        generate_mandelbrot(
            800,
            800,
            "test_default_coloured.ppm",
            true,
            -2.0,
            0.47,
            -1.12,
            1.12,
        );
    }

    #[test]
    fn test_zoomed_mandelbrot_classic() {
        generate_mandelbrot(
            800,
            800,
            "test_zoomed_classic.ppm",
            true,
            -0.75,
            -0.5,
            -0.1,
            0.1,
        );
    }

    #[test]
    fn test_zoomed_mandelbrot_buddhabrot() {
        generate_mandelbrot(
            800,
            800,
            "test_zoomed_buddhabrot.ppm",
            true,
            -0.3,
            -0.25,
            -0.7,
            -0.6,
        );
    }

    #[test]
    fn test_zoomed_mandelbrot_celtic_knot() {
        generate_mandelbrot(
            800,
            800,
            "test_zoomed_celtic_knot.ppm",
            true,
            -0.1,
            0.1,
            -0.7,
            -0.5,
        );
    }

    #[test]
    fn test_high_res_mandelbrot() {
        generate_mandelbrot(
            1920,
            1080,
            "test_high_res.ppm",
            true,
            -2.0,
            0.47,
            -1.12,
            1.12,
        );
    }

    #[test]
    fn test_low_res_mandelbrot() {
        generate_mandelbrot(400, 400, "test_low_res.ppm", false, -2.0, 0.47, -1.12, 1.12);
    }
}
