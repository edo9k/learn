import React, { useRef } from 'react'

const InputWithRef = props => {
  const ref = useRef(null)
  const onClick = () => {
    let value = ref.current.value
    alert(value)
  }

  return (
    <div className='users-ref'>
      <h1>Using uncontrolled input with useRef</h1>
      <input type='text' ref={ref} />
      <br />
      <button onClick = { onClick }>Get input data</button>
    </div>
  )
}

export default InputWithRef
