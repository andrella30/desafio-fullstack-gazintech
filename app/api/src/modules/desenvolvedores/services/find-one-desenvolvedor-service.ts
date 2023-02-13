import AppDataSource from "../../../database/data_source";
import { Messages } from "../../shared/messages";
import { Desenvolvedor } from "../entities/Desenvolvedor";

class FindOneDesenvolvedorService {

    constructor(
        private desenvolvedorRepository = AppDataSource.getRepository(Desenvolvedor)
    ) {}

    public async execute(id: number): Promise<Desenvolvedor> {

        const desenvolvedor = await this.desenvolvedorRepository.findOne({
            where: {
              id,
            },
            relations: ['nivel'],
          });
      
          if (!desenvolvedor) {
            throw new Error(Messages.MESSAGE_NOT_FOUND);
          }
      
          return desenvolvedor;
    }
}


export default FindOneDesenvolvedorService