const Twit = require('twit')

require('dotenv').config()

const bot = new Twit({
  consumer_key: process.env.CONSUMER_KEY,
  consumer_secret: process.env.CONSUMER_SECRET,

  access_token: process.env.ACCESS_TOKEN,
  access_token_secret: process.env.ACCESS_TOKEN_SECRET,

  timeout_ms: 60 * 1000
})

const botAction = () => {
  const datetime = (new Date).toLocaleString()

  const postTweet = `ping (bot test, timestamp: ${datetime})`
  
  bot.post(
    'statuses/update',
    {status: postTweet},
    function (err, data, response) {
      if (err) {
        console.log(`Error: ${err}`)
        return false
      }

      console.log('Success: test tweet posted.')
    }
  )
}

botAction()

// setInterval(botAction, 4 * 60 * 60 * 1000) 
