import Nullstack from "nullstack"

class Headless extends Nullstack {

  /*
    This is a headless component.
    It can perform any Javascript action,
    but won't render to anything on the page. 
  */

  render() {
    return false
  }
}

export default Headless
