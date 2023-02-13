import { createConnection } from "./data_source";

createConnection()

// export function createConnection(
//     host = 'database_gazin',
//   ): Promise<DataSource> {
//     return AppDataSource.setOptions({ host }).initialize();
//   }

// export default AppDataSource;

//yarn typeorm migration:create ./src/database/migrations