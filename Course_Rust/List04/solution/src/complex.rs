#[derive(Debug, Clone, Copy, PartialEq)]
// Using derive to make Rust generate some properties by itself
// - debug makes print debugging very simple
// (f.e. println!("{:?}, x") will print all props and values of x)
// - clone and copy allows simple copying by assignment
// - PartialEq implements equality comparisions

// We define complex number by defining it's real and imaginary part
pub struct Complex {
    real: f64,
    imag: f64,
}

// Simple implementation - constructor and basic operations
impl Complex {
    pub fn new(real: f64, imag: f64) -> Complex {
        Complex { real, imag }
    }

    pub fn add(self, other: Complex) -> Complex {
        Complex {
            real: self.real + other.real,
            imag: self.imag + other.imag,
        }
    }

    pub fn subtract(self, other: Complex) -> Complex {
        Complex {
            real: self.real - other.real,
            imag: self.imag - other.imag,
        }
    }

    pub fn multiply(self, other: Complex) -> Complex {
        Complex {
            real: self.real * other.real - self.imag * other.imag,
            imag: self.real * other.imag + self.imag * other.real,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::Complex;

    #[test]
    fn test_add() {
        let c1 = Complex::new(3.0, 4.0);
        let c2 = Complex::new(1.0, 2.0);
        let result = c1.add(c2);
        assert_eq!(result, Complex::new(4.0, 6.0));
    }

    #[test]
    fn test_subtract() {
        let c1 = Complex::new(3.0, 4.0);
        let c2 = Complex::new(1.0, 2.0);
        let result = c1.subtract(c2);
        assert_eq!(result, Complex::new(2.0, 2.0));
    }

    #[test]
    fn test_multiply() {
        let c1 = Complex::new(3.0, 4.0);
        let c2 = Complex::new(1.0, 2.0);
        let result = c1.multiply(c2);
        assert_eq!(result, Complex::new(-5.0, 10.0));
    }
}
