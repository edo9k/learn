
// libs
import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'
import reportWebVitals from './reportWebVitals'

import { BrowserRouter as Router, 
  Route, Switch } from 'react-router-dom'

// components
import Navbar from './Navbar'
import { Home, About, Contact, 
  Challenges, NotFound } from './DumbComponents'

const Country = ({ country }) => {

  const { name, flag, population, currency } = country

  return (
    <div className='country'>
      <div className='country_flag'>
        <img src={flag} alt={name} style={{maxWidth: '100%'}} />
      </div>
      
      <h3 className='country_name'>{name.toUpperCase()}</h3>
      
      <div class='country_text'>
        <p>
          <span>Population: </span>
          {population}
        </p>
        <p>
          <span>Currency: </span>
          {currency}
        </p>  
      </div>
    </div>
  )
}

class CountriesAxios extends Component {
  state = {
    data: []
  }

  componentDidMount() {
    this.fetchCountryData()
  }

  fetchCountryData = async () => {
    const url = 'https://restcountries.eu/rest/v2/all'

    try {
      const response = await axios.get(url)
      const { data } = await response
      this.setState({ data })
    } catch (error) {
      console.log(error)
    }
  }

  render () {
    return (
      <div className='ShowCountries'>
        <h2>There are {this.state.data.length} countries in the API.</h2>
        
        <ul className='country-list'>
          {this.state.data.map( country => (
            <li><Country country={country} /></li>
          ))}
        </ul>
      </div>
    )
  }
}

class CountriesFetch extends Component {
  state = {
    data: []
  }

  componentDidMount() {
    this.fetchCountryData()
  }

  fetchCountryData = async () => {
    const url = 'https://restcountries.eu/rest/v2/all'
    try {
      const response = await fetch(url)
      const data = await response.json()
      this.setState({ data })
    } catch (error) {
      console.log(error)
    }
  }

  render () {
    return (
      <div className='ShowCountries'>
        <h2>There are {this.state.data.length} countries in the API.</h2>
        
        <ul className='country-list'>
          {this.state.data.map( country => (
            <li><Country country={country} /></li>
          ))}
        </ul>
      </div>
    )
  }
}

class App extends Component {
  render() {
    return (
      <Router>
        <div className='App'>
          <Navbar />
          <Switch>
            <Route path='/about'            component={About}           />
            <Route path='/contact'          component={Contact}         />
            <Route path='/challenges'       component={Challenges}      />
            <Route path='/countries-fetch'  component={CountriesFetch}  />
            <Route path='/countries-axios'  component={CountriesAxios}  />
            <Route exact path='/'           component={Home}            />
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

