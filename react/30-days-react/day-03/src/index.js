import React, { Component } from 'react';
import ReactDOM from 'react-dom';
//import './index.css';
//import App from './App';
import reportWebVitals from './reportWebVitals';

class App extends Component {
  constructor(props) {
    super(props)
    console.log('contructor function (first to run)')
    this.state = { firstName: '' }
  }

  static getDerivedStateFromProps(props, state) {
    console.log('getDerivedStateFromProps (second to run)')
    return null
  }

  componentDidMount() {
    console.log('componentDidMount (last to run)')
  }

  render() {
    console.log('render function (third to run)')
    return (
      <div className='App'>
        <h1>React Component Life Cycle</h1>
      </div>
    )
  }
}


ReactDOM.render(<App />, document.getElementById('root'))

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();

