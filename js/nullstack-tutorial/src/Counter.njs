import Nullstack from 'nullstack'
import './Counter.scss'

class Counter extends Nullstack {
  
  count = 0

  increment() {
    this.count++
  }

  render() {
    return (
      <button class="btn-counter" onclick={this.increment}>
        {this.count}
      </button>
    )
  }
}

export default Counter
