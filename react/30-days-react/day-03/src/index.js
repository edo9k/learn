import React, { Component } from 'react';
import ReactDOM from 'react-dom';
//import './index.css';
//import App from './App';
import reportWebVitals from './reportWebVitals';

const Button = ({ onClick, text, style }) => {
  return (
    <button onClick={onClick} style={style}>
      {text}
    </button>
  )
}

const buttonWithStyles = (CompParam, name = 'default') => {
  const colors = [
    {
      name: 'default',
      backgroundColor: '#e7e7e7',
      color: '#000000'
    },
    {
      name: 'react',
      backgroundColor: '#61dbfb',
      color: '#ffffff'
    },

    {
      name: 'success',
      backgroundColor: '#4caf50',
      color: '#ffffff'
    },

    {
      name: 'info',
      backgroundColor: '#2196f3',
      color: '#ffffff'
    },

    {
      name: 'warning',
      backgroundColor: '#ff9800',
      color: '#ffffff'
    },

    {
      name: 'danger',
      backgroundColor: '#f44336',
      color: '#ffffff'
    },
  ]

  const { backgroundColor, color } = colors.find( c => c.name === name )

  const buttonStyles = {
    backgroundColor,
    padding: '10px 45px',
    border: 'none',
    borderRadius: 3,
    margin: 3,
    cursor: 'pointer',
    fontSize: '1.25rem',
    color,
  }

  return props => {
    return <CompParam {...props} style={buttonStyles} />
  }

}

const NewButton = buttonWithStyles(Button)
const ReactButton = buttonWithStyles(Button, 'react')
const InfoButton = buttonWithStyles(Button, 'info')
const SuccessButton = buttonWithStyles(Button, 'success')
const WarningButton = buttonWithStyles(Button, 'warning')
const DangerButton = buttonWithStyles(Button, 'danger')

class App extends Component {
  render() {
    return (
      <div className='App'>

        <Button text='No Style' onClick={ () => alert('I am not styled yet') } />

        <NewButton
          text='Styled Button'
          onClick={ () => alert('I am the default style') } />

        <ReactButton
          text='React'
          onClick={ () => alert('I have react style') } />

        <InfoButton
          text='Info'
          onClick={ () => alert('I have info style') } />

        <SuccessButton
          text='Success'
          onClick={ () => alert('I have success style') } />

        <WarningButton
          text='Warning'
          onClick={ () => alert('I have warning style') } />

        <DangerButton
          text='Danger'
          onClick={ () => alert('I have danger style') } />
 
      </div>
    )

  }
}


ReactDOM.render(<App />, document.getElementById('root'))

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();

