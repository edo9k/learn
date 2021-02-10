import React, { useState } from 'react'

const options = [ 
  {
    value: '',
    value: '-- Select Country --',
  },
  { 
    value: 'Finland',
    label: 'Finland'
  },
  {
    value: 'Sweden',
    label: 'Sweden'
  }
]

const HookForm = props => {
  const initialState = {
    firstName: '',
    lastName: '',
    email: '',
    title: '',
    country: '',
    skills: {
      html: false,
      css: false,
      javascript: false
    }
  }

  const [formData, setFormData] = useState(initialState)

  const onChange = e => {
    const { name, value, type, checked } = e.target

    if (type === 'checkbox') {
      setFormData({
        ...formData,
        skill: { ...formData.skills, [name]: checked }
      })
    } else if (type === 'file') {
      setFormData({ ...formData, [name]: e.target.files[0] })
    } else {
      setFormData({ ...formData, [name]: value })
    }
  }

  const onSubmit = e => {
    e.preventDefault()

    const { firstName, lastName, title, email, skills } = formData

    const formattedSkills = []
    for (const key in skills) {
      console.log(key)
      if (skills[key])
        formattedSkills.push(key.toUpperCase())
    }

    const data = { firstName, lastName, 
      title, email, 
      skills: formattedSkills }

    console.log(data)
  }

  const { firstName, lastName, title, email, skills } = formData

  return (
    <div class='HookForm'>
      <h3>Add Student</h3>
      <form onSubmit={onSubmit}>
        <div className='row'>
          <div className='form-group'>
            <label htmlFor='firstName'>First Name</label>
            <input 
              type='text'
              id='firstName'
              name='firstName'
              value={firstName}
              onChange={onChange}
              placeholder='First name'
            />
          </div>

          <div className='form-group'>
            <label htmlFor='lastName'>First Name</label>
            <input 
              type='text'
              id='lastName'
              name='lastName'
              value={lastName}
              onChange={onChange}
              placeholder='Last name'
            />
          </div>

          <div className='form-group'>
            <label htmlFor='title'>Title</label>
            <input 
              type='text'
              id='title'
              name='title'
              value={title}
              onChange={onChange}
              placeholder='Title'
            />
          </div>
       
          <div className='form-group'>
            <label htmlFor='email'>E-mail</label>
            <input 
              type='text'
              id='email'
              name='email'
              value={email}
              onChange={onChange}
              placeholder='E-mail'
            />
          </div>

          <div>
            <p>Select your skills</p>

            <div>
              <input type='checkbox' id='html' name='html' onChange={onChange} />
              <label htmlFor='html'>HTML</label>
            </div>
          </div>

        </div>
      </form>
    </div>)
}

export default HookForm
