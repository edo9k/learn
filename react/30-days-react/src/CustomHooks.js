/** @format */

import React from 'react'
import { Country } from './Countries'
import useFetch from './useFetch'

const CustomHooks = props => {
  const url = 'https://restcountries.eu/rest/v2/all'
  const data = useFetch(url)

  return (
    <div className="CustomHooks">
      <h1>Fetching Data Using Hooks</h1>
      <h2>Calling API</h2>
      <div>
        <p>There are {data.length} countries in the API</p>
        <div className="countries-wrapper">
          {data.map(country => (
            <Country country={country} />
          ))}
        </div>
      </div>
    </div>
  )
}

export default CustomHooks
