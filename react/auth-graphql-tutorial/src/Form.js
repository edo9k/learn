import React, { useState } from 'react'
import { navigate } from '@reach/router'

const url = 'http://localhost:3666/login'

const Form = () => {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')

  const submitForm = event => {
    event.preventDefault()

    const options = {
      method: 'post',
      credentials: 'include',
      headers: {
        'Content-type' : 'application/x-www-form-urlencoded; charset=UTF-8'
      },
      body: `email=${email}&password=${password}`
    }

    fetch(url, options)
    .then(response => {
      if (!response.ok) {
        if (404 === response.status) 
          alert('Email not found.')
        if (401 === response.status)
          alert('Email and password do not match.')
      }
      return response
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        document.cookie = 'signedin=true'  //`token=${data.token}&signedin=true`
        navigate('/private-area')
      } 
    })
  }

  return (
    <>
      <form onSubmit={submitForm}>
        <div>
          Email: 
          <input type='text' 
            onChange={event => setEmail(event.target.value)}
          />
        </div>

        <div>
          Password:
          <input type='password'
            onChange={event => setPassword(event.target.value)}
          />
        </div>

        <div>
          <button type='submit'>
            Login
          </button>
        </div>
      </form>
    </>
  )
}

export default Form 

