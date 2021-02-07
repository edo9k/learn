import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import reportWebVitals from './reportWebVitals'

import { 
  BrowserRouter as Router, 
  Route, Switch, 
  NavLink } from 'react-router-dom'


const Home = props => <h1>Welcome Home</h1>

const About = props => <h1>About us</h1>

const Contact = props => <h1>Contact us</h1>

const Challenges = props => (
  <div>
    <h1>30 Days of React</h1>
  </div>
)

const NotFound = props => <h1>Page not found.</h1>

const Navbar = () => (
  <ul>  
    <li>
      <NavLink to='/'>Home</NavLink>
    </li> 
    <li>
      <NavLink to='/about'>About</NavLink>
    </li> 
    <li>
      <NavLink to='/contact'>Contact</NavLink>
    </li> 
    <li>
      <NavLink to='/challenges'>Challenges</NavLink>
    </li> 
  </ul>
)


class App extends Component {
  render() {
    return (
      <Router>
        <div className='App'>
          <Navbar />
          <Switch>
            <Route path='/about'      component={About}       />
            <Route path='/contact'    component={Contact}     />
            <Route path='/challenges' component={Challenges}  />
            <Route exact path='/'     component={Home}        />
            <Route component={NotFound} />
          </Switch>
        </div>
      </Router>
    )
  }
}

ReactDOM.render(<App />, document.getElementById('root'))

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals()

