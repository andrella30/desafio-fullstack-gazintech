import "reflect-metadata"
import { DataSource } from "typeorm"

const AppDataSource = new DataSource({
    type: "postgres",
    host: "localhost",
    port: 5432,
    username: "docker",
    password: "gazin",
    database: "gazin_db",
    synchronize: true,
    migrations: ["./src/database/migrations/*.ts"],
    entities: [
        "./src/modules/niveis/entities/*.ts", 
        "./src/modules/desenvolvedores/entities/*.ts"
    ]          
})

export function createConnection(host = "database_gazin"): Promise<DataSource> {
    return AppDataSource.setOptions({ host }).initialize();
  }

  export default AppDataSource

  //const dataSource = AppDataSource.getRepository(Niveis)
