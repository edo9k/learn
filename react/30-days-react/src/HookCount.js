import React, { useState } from 'react'

const HookCount = () => {
  const [count, setCount] = useState(0)

  return (
    <div className='HookCount'>
      <h1>{count}</h1>
      <button onClick={ () => setCount(count + 1) }> Add one </button>
    </div>
  )
}

export default HookCount
