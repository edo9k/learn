import logo from './logo.svg'
import './App.css'

import Login from './Login.js'

// graphql stuff
import { 
  ApolloClient, 
  ApolloProvider,
  InMemoryCache, 
  gql 
} from '@apollo/client'

// assuming the URL is public o_o"
const endpoint = 'https://cms.trial-task.k8s.ext.fcse.io/graphql'

const client = new ApolloClient({
  uri: endpoint,
  cache: new InMemoryCache()
})


// the function that actually handles the login
const attemptServerLogin = async ({ email, password }) => {
  try {
    const response = await client.mutate({
      mutation: gql`
        mutation {
          login(input: {
            identifier: "${email}",
            password: "${password}"
          }) {
            jwt
          }
        }
      `
    })

    alert('foi...?')
    console.log(response)

  } catch (e) {
    alert('deu ruim')
  }

}


function App() {
  return (
    <>
      <ApolloProvider client={client}>
        <div className='draft'>
          <Login attemptServerLogin={attemptServerLogin} />
        </div>
      </ApolloProvider>

      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>
            Edit <code>src/App.js</code> and save to reload.
          </p>
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
        </header>
      </div>
    </>
  );
}

export default App;
