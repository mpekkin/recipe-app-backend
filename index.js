import express from "express"
import cors from "cors"
import pg from "pg"
import dotenv from "dotenv"

const app = express()
const main_port = 3000

dotenv.config()

app.listen(main_port, () => {
    console.log(`Listening on port ${main_port}`);
  })

app.use(cors({origin: "http://localhost:5173"}))
app.use(express.json())

const pool = new pg.Pool({
    host: process.env.PGHOST,
    user: process.env.PGUSER,
    database: process.env.PGDATABASE,
    password: process.env.PGPASSWORD,
    port: process.env.PGPORT,
  })


const test = async () => {
    pool.connect
 
    console.log(await pool.query('SELECT NOW()'))
     
    await pool.end()
}

test()
  