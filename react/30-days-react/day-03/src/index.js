import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
//import App from './App';
import reportWebVitals from './reportWebVitals';


class Header extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <header>
        <div className='header-wrapper'>
          <h1>Ablublue Ablublue React Something Something</h1>
          <h2>Some other text</h2>
          <small>2021</small>
        </div>
      </header>
    )
  }
}


class TechList extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    const techs = 'HTML CSS Javascript PHP MySQL Haskell COBOL Assembly'.split(' ')
    const techsFormatted = techs.map( tech => <li key={tech}>{tech}</li> )
    return techsFormatted
  }
}

class Main extends React.Component {
  constructor(props) {
    super(props) 
  }

  render() {
    return (
      <main>
        <div className='main-wrapper'>
          <p>A bunch of tech chosen for no reason at all:</p>
          <ul>
            <TechList />
          </ul>
        </div>
      </main>
    )
  }
}

class Footer extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <footer>
        <div className='footer-wrapper'>
          <p>Copyleft 2021</p>
        </div>
      </footer>
    )
  }
}

class App extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div className='app'>
        <Header />
        <Main />
        <Footer />
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
