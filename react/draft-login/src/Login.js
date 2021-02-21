import React, { useState } from 'react'

const Login = ({ attemptServerLogin }) => {
  const [credentials, setCredentials] = useState({
    email: '',
    password: ''
  })

  const onChange = e => {
    e.preventDefault()
    setCredentials({ [e.target.name]: e.target.value })
  }

  const submitLogin = e => {
    e.preventDefault()
    attemptServerLogin(credentials)
  }

  return( 
    <>
      <form>
        <input 
          type='text' 
          id='email'
          value={credentials.email} 
          onChange={onChange} 
          placeholder='your@email.com' 
        />
        
        <input 
          type='password' 
          id='password'
          value={credentials.password} 
          onChange={onChange} 
          placeholder='*******' 
        />

        <button onClick={ submitLogin }>
          Login
        </button>
      </form>
    </>
  )

}

export default Login
