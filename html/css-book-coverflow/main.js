const books = document.querySelectorAll('.book');

books.forEach((book, index) => {
  book.addEventListener('click', () => {
    clearActive();
    setActive(book, index);
  });
});

// Clears the previous active state
function clearActive() {
  books.forEach((book) => {
    book.classList.remove('active', 'left', 'right');
  });
}

// Set the clicked book as active and adjust the rest
function setActive(activeBook, activeIndex) {
  activeBook.classList.add('active');
  
  books.forEach((book, index) => {
    if (index < activeIndex) {
      book.classList.add('left');
    } else if (index > activeIndex) {
      book.classList.add('right');
    }
  });
}
