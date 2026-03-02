use std::io;

#[derive(Clone, Copy)]
struct HeapItem {
    val: u64,
    col: u32,
    row: u32,
}

struct MaxHeap {
    data: Vec<HeapItem>,
    heap_size: usize,
}

impl MaxHeap {
    fn new() -> Self {
        Self {
            data: Vec::new(),
            heap_size: 0,
        }
    }

    fn is_empty(&self) -> bool {
        self.heap_size == 0
    }

    fn push(&mut self, item: HeapItem) {
        if self.heap_size == self.data.len() {
            self.data.push(item);
        } else {
            self.data[self.heap_size] = item;
        }
        self.heap_size += 1;
        self.sift_up(self.heap_size - 1);
    }

    fn check_max(&self) -> Option<HeapItem> {
        if self.is_empty() {
            None
        } else {
            Some(self.data[0])
        }
    }

    fn replace_max(&mut self, new_item: HeapItem) -> Option<HeapItem> {
        if self.is_empty() {
            self.push(new_item);
            None
        } else {
            let max = self.data[0];
            self.data[0] = new_item;
            self.sift_down(0);
            Some(max)
        }
    }

    fn pop(&mut self) -> Option<HeapItem> {
        if self.is_empty() {
            None
        } else {
            let max = self.data[0];
            self.heap_size -= 1;
            if self.heap_size > 0 {
                self.data[0] = self.data[self.heap_size];
                self.sift_down(0);
            }
            Some(max)
        }
    }

    fn sift_down(&mut self, mut index: usize) {
        loop {
            let left = 2 * index + 1;
            let right = 2 * index + 2;
            let mut largest = index;

            if left < self.heap_size && self.data[left].val > self.data[largest].val {
                largest = left;
            }

            if right < self.heap_size && self.data[right].val > self.data[largest].val {
                largest = right;
            }

            if largest == index {
                break;
            }

            self.data.swap(index, largest);
            index = largest;
        }
    }

    fn sift_up(&mut self, mut index: usize) {
        while index > 0 {
            let parent = (index - 1) / 2;
            if self.data[index].val <= self.data[parent].val {
                break;
            }
            self.data.swap(index, parent);
            index = parent;
        }
    }
}

fn solve(m: u32, k: u32) {
    let m64 = m as u64;
    println!("{}", m64 * m64);

    let mut heap = MaxHeap::new();
    heap.push(HeapItem {
        val: m64 * (m64 - 1),
        col: m - 1,
        row: m,
    });
    heap.push(HeapItem {
        val: (m64 - 1) * (m64 - 1),
        col: m - 1,
        row: m - 1,
    });

    let mut last_printed: u64 = m64 * m64;
    let mut left_to_print = k - 1;

    while left_to_print > 0 {
        let max = heap.check_max().unwrap();

        if max.val != last_printed {
            println!("{}", max.val);
            last_printed = max.val;
        }

        if max.col != max.row {
            if max.row > 1 {
                heap.replace_max(HeapItem {
                    val: max.val - (max.row as u64),
                    col: max.col - 1,
                    row: max.row,
                });
            } else {
                heap.pop();
            }
        } else {
            if max.row > 1 && max.col > 1 {
                let new_val_left = max.val - max.row as u64;
                let new_val_left_up = new_val_left - (max.row - 1) as u64;
                heap.replace_max(HeapItem {
                    val: new_val_left,
                    col: max.col - 1,
                    row: max.row,
                });
                heap.push(HeapItem {
                    val: new_val_left_up,
                    col: max.col - 1,
                    row: max.row - 1,
                });
            } else if max.row > 1 {
                heap.replace_max(HeapItem {
                    val: max.val - max.row as u64,
                    col: max.col,
                    row: max.row - 1,
                });
            } else if max.col > 1 {
                heap.replace_max(HeapItem {
                    val: max.val - max.col as u64,
                    col: max.col - 1,
                    row: max.row,
                });
            } else {
                heap.pop();
            }
        }

        left_to_print -= 1;
    }
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let parts: Vec<u32> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().unwrap())
        .collect();
    let m = parts[0];
    let k = parts[1];

    solve(m, k);
}
