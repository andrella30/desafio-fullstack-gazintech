import AppDataSource from "../../../database/data_source";
import { Messages } from "../../shared/messages";
import { Desenvolvedor } from "../entities/Desenvolvedor";



class DeleteDesenvolvedorService {
    constructor(
        private desenvolvedorRepository = AppDataSource.getRepository(Desenvolvedor)
    ) {}

    public async execute(id: number) {
        const desenvolvedorToDelete = await this.desenvolvedorRepository.findOne({
            where: {
              id,
            },
          });
          
        if (!desenvolvedorToDelete) {
            throw new Error(Messages.MESSAGE_BAD_REQUEST);
        }
      
        return this.desenvolvedorRepository.delete(id);
    }

}


export default DeleteDesenvolvedorService