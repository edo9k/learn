
// from rosettacode.org 

fn bubble_sort<T: Ord>(values: &mut[T]) {
    let mut n = values.len();
    let mut swapped = true;

    while swapped {
        swapped = false;

        for i in 1..n {
            if values[i - 1] > values[i] {
                values.swap(i - 1, i);
                swapped = true;
            }
        }

        n = n - 1;
    }
}

fn main() {
    // to be sorted
    let mut numbers = [9, 7, 8, 3, 4, 2, 0, 1, 6, 5];
    println!("unsorted list: {:?}", numbers);

    bubble_sort(&mut numbers);
    println!("sorted list:   {:?}", numbers);
}

