pub fn get_color(iteration: u32, max_iterations: u32) -> (u8, u8, u8) {
    if iteration == max_iterations {
        (0, 0, 0)
    } else {
        let color_val = (255 * iteration / max_iterations) as u8;
        (color_val, color_val, color_val)
    }
}

pub fn get_hsv_color(iteration: u32, max_iterations: u32) -> (u8, u8, u8) {
    if iteration == max_iterations {
        (0, 0, 0)
    } else {
        let s = iteration as f64 / max_iterations as f64;
        let h = (360.0 * s) % 360.0;
        let v = if iteration < max_iterations { 1.0 } else { 0.0 };
        hsv_to_rgb(h, 1.0, v)
    }
}

fn hsv_to_rgb(h: f64, s: f64, v: f64) -> (u8, u8, u8) {
    let c = v * s;
    let x = c * (1.0 - ((h / 60.0) % 2.0 - 1.0).abs());
    let m = v - c;

    let (r, g, b) = match h as u32 {
        0..=59 => (c, x, 0.0),
        60..=119 => (x, c, 0.0),
        120..=179 => (0.0, c, x),
        180..=239 => (0.0, x, c),
        240..=299 => (x, 0.0, c),
        300..=359 => (c, 0.0, x),
        _ => (0.0, 0.0, 0.0),
    };

    (
        ((r + m) * 255.0) as u8,
        ((g + m) * 255.0) as u8,
        ((b + m) * 255.0) as u8,
    )
}
