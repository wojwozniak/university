mod color;
mod complex;
mod image;

use color::{get_color, get_hsv_color};

fn generate_mandelbrot(width: u32, height: u32, filename: &str, use_coloring: bool) {
    let mut img = image::Image::new(width, height);

    let (xmin, xmax, ymin, ymax) = (-2.00, 0.47, -1.12, 1.12);
    let scale_x = (xmax - xmin) as f64 / width as f64;
    let scale_y = (ymax - ymin) as f64 / height as f64;
    let max_iterations: u32 = 1000;

    for x in 0..width {
        let re = xmin as f64 + x as f64 * scale_x;
        for y in 0..height {
            let im = ymin as f64 + y as f64 * scale_y;
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
    generate_mandelbrot(800, 800, "mandelbrot.ppm", true);
}
