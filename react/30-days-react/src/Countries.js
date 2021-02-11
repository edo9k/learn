import { Component } from 'react'
import axios from 'axios'

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

export { 
  Country,
  CountriesAxios,
  CountriesFetch
}
