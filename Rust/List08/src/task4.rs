fn calculate_katas(n_max: i32) -> (Vec<i32>, Vec<i32>) {
    let n_max_usize = n_max as usize;

    let mut ann_katas: Vec<i32> = vec![0; n_max_usize];
    ann_katas[0] = 1;

    let mut john_katas: Vec<i32> = vec![0; n_max_usize];
    john_katas[0] = 0;

    for n in 1..n_max_usize {
        // John at t equal Ann at n - 1
        let t1 = ann_katas[n - 1];

        // Ann at day n should do n minus john at day t
        ann_katas[n] = n as i32 - john_katas[t1 as usize];

        // Ann at t equal to john at n - 1
        let t2 = john_katas[n - 1];

        // John at n should be n minus ann at day t
        john_katas[n] = n as i32 - ann_katas[t2 as usize];
    }

    (ann_katas, john_katas)
}

fn john(n: i32) -> Vec<i32> {
    let (_, john_katas) = calculate_katas(n);
    john_katas
}

fn ann(n: i32) -> Vec<i32> {
    let (ann_katas, _) = calculate_katas(n);
    ann_katas
}

fn sum_john(n: i32) -> i32 {
    john(n).iter().sum()
}

fn sum_ann(n: i32) -> i32 {
    ann(n).iter().sum()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_john() {
        assert_eq!(john(11), vec![0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6]);
    }

    #[test]
    fn test_ann() {
        assert_eq!(ann(6), vec![1, 1, 2, 2, 3, 3]);
    }

    #[test]
    fn test_sum_john() {
        assert_eq!(sum_john(75), 1720);
    }

    #[test]
    fn test_sum_ann() {
        assert_eq!(sum_ann(150), 6930);
    }

    #[test]
    fn test_john_single_element() {
        assert_eq!(john(1), vec![0]);
    }

    #[test]
    fn test_ann_single_element() {
        assert_eq!(ann(1), vec![1]);
    }

    #[test]
    fn test_sum_john_small() {
        assert_eq!(sum_john(3), 1);
    }

    #[test]
    fn test_sum_ann_small() {
        assert_eq!(sum_ann(3), 4);
    }

    #[test]
    fn test_sum_john_large() {
        assert_eq!(sum_john(1000), 308819);
    }

    #[test]
    fn test_sum_ann_large() {
        assert_eq!(sum_ann(1000), 308834);
    }
}
