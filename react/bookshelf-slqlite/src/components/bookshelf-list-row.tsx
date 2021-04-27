
import React from 'react'

interface BookshelfListRowUI {
  position: number;
  book: {
    id: number;
    author: string;
    title: string;
    pubDate: string;
    rating: string;
  }
  handleBookRemove: (id: number, title: string) => void;
}

// component
export const BookshelfListRow = (props: BookshelfListRowUI) => (
  <tr className="table-row">
    <td className="table-item">
      {props.position}
    </td>

    <td className="table-item">
      {props.book.title}
    </td>

    <td className="table-item">
      {props.book.author}
    </td>

    <td className="table-item">
      {props.book.pubDate}
    </td>

    <td className="table-item">
      {props.book.rating}
    </td>

    <td className="table-item">
      <button 
        className="btn btn-remove"
        onClick={ () => props.handleBookRemove(
          props.book.id, props.book.title
        )}>
        Remove Book
      </button>
    </td>
  </tr>
)

