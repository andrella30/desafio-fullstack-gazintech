import express from 'express'
import cors from 'cors'
import "./database"
import desenvolvedorRouter from './modules/desenvolvedores/routes/desenvolvedor.routes'
import niveisRouter from './modules/niveis/routes/niveis.routes'


const app = express()
app.use(cors())
app.use(express.json())


app.use("/niveis", niveisRouter)
app.use("/desenvolvedores", desenvolvedorRouter)

app.listen(3333, () => console.log("Server is running")) 