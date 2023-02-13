import express from 'express'

import "./database"
import desenvolvedorRouter from './modules/desenvolvedores/routes/desenvolvedor.routes'
import niveisRouter from './modules/niveis/routes/niveis.routes'


const app = express()
app.use(express.json())

app.use("/niveis", niveisRouter)
app.use("/desenvolvedor", desenvolvedorRouter)

app.listen(3333, () => console.log("Server is running")) 