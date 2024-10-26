mod complex;
mod image;

fn generate_mandelbrot(width: u32, height: u32, filename: &str) {
    let mut img = image::Image::new(width, height);

    let (xmin, xmax, ymin, ymax) = (-2.00, 0.47, -1.12, 1.12);

    for x in 0..width {
        let re = xmin as f64 + (x as f64 / width as f64) * (xmax - xmin) as f64;
        for y in 0..height {
            let im = ymin as f64 + (y as f64 / height as f64) * (ymax - ymin) as f64;
            let mut z = complex::Complex::new(0.0, 0.0);
            let c = complex::Complex::new(re, im);
            let max_iterations: u32 = 1000;

            let mut iteration = 0;
            while iteration < max_iterations && z.magnitude_squared() <= 4.0 {
                z = z.multiply(z).add(c);
                iteration += 1;
            }

            let color: (u8, u8, u8);

            if iteration == max_iterations {
                color = (0, 0, 0)
            } else {
                let color_val = (255 * iteration / max_iterations) as u8;
                color = (color_val, color_val, color_val);
            }

            img.set_pixel(x, y, color.0, color.1, color.2);
        }
    }

    img.save_to_ppm(filename)
        .expect("Failed to save mandelbrot image!");
}

fn main() {
    generate_mandelbrot(800, 800, "mandelbrot.ppm");
}
