import express from "express"
import dotenv from "dotenv"

const app = express()
dotenv.config()

const main_port = process.env.PORT

app.listen(main_port, () => {
    console.log(`Listening on port ${main_port}`);
  })
