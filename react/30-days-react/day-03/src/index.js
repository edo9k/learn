import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
//import App from './App';
import reportWebVitals from './reportWebVitals';

// header
const Header = () => (
  <header>
    <div className='header-wrapper'>
      <h1>This is the header</h1>
      <h2>and an H2 tag.</h2>
    </div>
  </header>
)

const CurrentDate = () => (
  <div><date>{ (new Date()).toLocaleString() }</date></div>
)

const App = () => (
  <div className='app'>
    <Header />
    <CurrentDate />
  </div>
)

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
