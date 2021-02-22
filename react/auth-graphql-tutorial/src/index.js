import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

// graphql, apollo, etc...
import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'
import { ApolloProvider } from 'react-apollo'
import { Router } from '@reach/router'
import { navigate } from '@reach/router'
import Cookies from 'js-cookie'

// -- our components
import Form from './Form'
import PrivateArea from './PrivateArea'


const httpLink = new HttpLink({
  uri: 'http://localhost:3666/graphql', 
  credentials: 'include'
})

const client = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache()
})

if (Cookies.get('signedin')) 
  navigate('/private-area')

ReactDOM.render(
  <div>
    <ApolloProvider client={client}>
      <Router>
        <Form path="/" />
        <PrivateArea path="/private-area" />
      </Router>
    </ApolloProvider>
    <App />
  </div>,
  document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();

