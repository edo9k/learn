# Simple Twitter Bot

This bot runs on Heroku, and needs Twitter developer credentials to post tweets. 

It's built with Node (Javascript), and uses the `Twit` library to access Twitter. 

All sensitive data is stored in a .env file, and pulled in with the `dotenv` library. 

You also need a Heroku account, and their CLI tool to deploy the bot. 

Tutorial link: https://digitalinnovation.one/artigos/como-construir-um-bot-para-twitter-nodejs

It only posts a hardcoded string with a timestamp of when the tweet was sent. But it's a good boiler plate for a bot that actually does something. 

