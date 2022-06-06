import Nullstack from 'nullstack';
import './Application.scss';
import Home from './Home';

import HelloWorld from "./HelloWorld"
import Headless from "./Headless"
import Counter from "./Counter"

class Application extends Nullstack {

  prepare({ page }) {
    page.locale = 'pt-BR';
  }

  renderHead() {
    return (
      <head>
        <link 
          href="https://fonts.gstatic.com" rel="preconnect" />
        <link 
          href="https://fonts.googleapis.com/css2?family=Crete+Round&family=Roboto&display=swap"
          rel="stylesheet" />
      </head> 
    )
  }

  render() {
    return (
      <main>
        <HelloWorld />
        <Counter />
        <Head />
        <Home route="/" />

        <Headless />
      </main>
    )
  }

}

export default Application;
