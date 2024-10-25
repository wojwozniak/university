use std::fs::File;
use std::io;
use std::io::Write;

// We start by defining our Image struct.
pub struct Image {
    width: u32,
    height: u32,
    pixels: Vec<u8>, // 0-255, ideal for 24-bit colours
}

impl Image {
    // Constructor
    pub fn new(width: u32, height: u32) -> Image {
        let size = (width * height * 3) as usize; // 3 bytes per pixel (r, g, b)

        // Return image of set size
        Image {
            width,
            height,
            pixels: vec![0; size], // Initialisation with black pixels
        }
    }

    // Function setting pixels
    pub fn set_pixel(&mut self, x: u32, y: u32, r: u8, g: u8, b: u8) {
        let index = (y * self.width + x) * 3; // 3 bytes per pixel

        // Check if index is correct, set pixel if it is
        if index < self.pixels.len() as u32 {
            self.pixels[index as usize] = r;
            self.pixels[(index + 1) as usize] = g;
            self.pixels[(index + 2) as usize] = b;
        }
    }

    // Function saving to ppm
    pub fn save_to_ppm(&self, filename: &str) -> io::Result<()> {
        // # File looks like this #
        // P3
        // width height
        // colour depth (0 - 255)
        // (colours pixel by pixel r g b,
        // length of row, then overflow to next line)
        // empty line

        // In this file we will have a lot of "?" -> it's to avoid unnecessary error
        // handling boilerplate. If an error happens it will be propagated to main

        let mut file = File::create(filename)?;
        writeln!(file, "P3")?;
        writeln!(file, "{} {}", self.width, self.height)?;
        writeln!(file, "255")?;

        // Save each pixel
        for i in (0..self.pixels.len()).step_by(3) {
            writeln!(
                file,
                "{} {} {}",
                self.pixels[i],
                self.pixels[i + 1],
                self.pixels[i + 2]
            )?;
        }

        Ok(()) // Return success (any error would be returned by usage of "?")
    }
}

#[cfg(test)]
mod tests {
    use super::Image;
    use std::fs;

    #[test]
    fn test_can_create_file() {
        let mut img = Image::new(100, 100);
        img.set_pixel(50, 50, 255, 0, 0);

        let filename = "test_output.ppm";
        img.save_to_ppm(filename).expect("Failed to save image");

        assert!(fs::metadata(filename).is_ok());
        fs::remove_file(filename).expect("Failed to delete test image file");
    }
}
