/** @format */

// libs
import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import reportWebVitals from './reportWebVitals'

import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'

// components
import Navbar from './Navbar'
import HookCount from './HookCount'
import HookForm from './HookForm'
import HookFetch from './HookFetch'
import InputWithRef from './UseRef'
import CustomHook from './CustomHooks'
import { CountriesAxios, CountriesFetch } from './Countries'
import { Home, About, Contact, Challenges, NotFound } from './DumbComponents'

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <Navbar />
          <Switch>
            <Route path="/about" component={About} />
            <Route path="/contact" component={Contact} />
            <Route path="/challenges" component={Challenges} />
            <Route path="/countries-fetch" component={CountriesFetch} />
            <Route path="/countries-axios" component={CountriesAxios} />
            <Route path="/hook-count" component={HookCount} />
            <Route path="/hook-form" component={HookForm} />
            <Route path="/hook-fetch" component={HookFetch} />
            <Route path="/custom-hook" component={CustomHook} />
            <Route path="/uses-ref" component={InputWithRef} />
            <Route exact path="/" component={Home} />
            <Route component={NotFound} />
          </Switch>
        </div>
      </Router>
    )
  }
}

ReactDOM.render(<App />, document.getElementById('root'))

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals()
