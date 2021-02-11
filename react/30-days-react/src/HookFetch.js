import React, { useState, useEffect } from 'react'
import { Country } from './Countries'
//import axios from 'axios'
//import { findDOMNode } from 'react-dom'

const HookFetch = props => {
  const [data, setData] = useState([])

  useEffect( () => {
    fetchData()
  }, [])

  const fetchData = async () => {
    const url = 'https://restcountries.eu/rest/v2/all'
    try {
      const response = await fetch(url)
      const data = await response.json()
      setData(data)
    } catch (error) {
      console.log(error)
    }
  }

  return (
    <div className='HookFetch'>
      <h1>Fetching Data Using Hooks and Axios</h1>
      <h2>Calling API</h2>
      <div>
        <p>There are {data.length} countries in the API</p>
        <div className='countries-wrapper'>
          { data.map( country => (
            <Country country={country} />
          ))}
        </div>
      </div>
    </div>
  )
}

export default HookFetch
