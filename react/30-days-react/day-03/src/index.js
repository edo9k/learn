import React, { Component } from 'react';
import ReactDOM from 'react-dom';
//import './index.css';
//import App from './App';
import reportWebVitals from './reportWebVitals';

class App extends Component {
  state = {
    firstName: '',
    message: '',
    key: ''
  }

  handleClick = e => {
    this.setState({
      message: 'Welcome to the React Events example.'
    })
  }

  handleMouseMove = e => {
    this.setState({ message: 'mouse movement detected' })
  }

  handleChange = e => {
    this.setState({
      firstName: e.target.value,
      message: e.target.value
    })
  }

  handleKeyPress = e => {
    this.setState({ 
      message: `${ e.target.value } was pressed, with keycode ${ e.charCode }`
    })
  }
  
  handleBlur = e => {
    this.setState({ message: 'input field has lost focus.' })
  }

  handleCopy = e => {
    this.setState({ message: 'noob copying methods are not allowed.' })
  }

  render() {
    return (
      <div>
        <h1>Events example</h1>

        <button onClick={this.handleClick}>Click me</button>
        <button onMouseMove={this.handleMouseMove}>Move mouse over this button </button>

        <p onCopy={this.handleCopy}>
          Try to copy this text.
        </p>

        <p>{this.state.message}</p>
        <label htmlFor=''> Test for onKeyPress Event: </label>
        <input type='text' onKeyPress={this.handleKeyPress}/>
        <br />
        
        <label htmlFor=''> Test for onBlur Event: </label>
        <input type='text' onBlur={this.handleBlur}/>

        <form onSubmit={this.handleSubmit}>
          <div>
            <label htmlFor='firstName'>First Name: </label>
            <input
              onChange={this.handleChange}
              name='firstName'
              value={this.state.value}/>
          </div>

          <div>
            <input type='submit' value='Submit'/>
          </div>
        </form>
      </div>
    )
  }
}

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
