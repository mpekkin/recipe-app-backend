import express from "express"
import cors from "cors"
import pg from "pg"

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