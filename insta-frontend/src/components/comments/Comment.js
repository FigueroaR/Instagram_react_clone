import React from 'react'

function Comment(props) {
   console.log(props)
  return(<div>
    {<img src={props.user.image} width='50' />}{props.content}
  </div>)
}

export default Comment