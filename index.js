const express = require('express')
const app = express()
const port = process.env.PORT || 3000
const message = process.env.RESPONSE_MESSAGE

app.get('/', (req, res) => {
  res.send(message || "Hello World!")
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})