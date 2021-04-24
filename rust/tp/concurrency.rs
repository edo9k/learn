
use std::thread;
use std::time::Duration;

fn main() {
    // new thread
    let handle = thread::spawn(|| {
        for i in 0..10 {
            println!("^ print #{} from spanwed thread.", i);
            thread::sleep(Duration::from_millis(2));
        }
    });

    for i in 0..5 {
        println!("~ print #{} from main thread.", i);
        thread::sleep(Duration::from_millis(2));
    }

    handle.join().unwrap(); // wait for thread to finish
}

