import AppDataSource from "../../../database/data_source";
import { Desenvolvedor } from "../../desenvolvedores/entities/Desenvolvedor";
import { Messages } from "../../shared/messages";
import Niveis from "../entities/Nivel";

class DeleteNivelService {

    constructor(
        private nivelRepository = AppDataSource.getRepository(Niveis),
        private desenvolvedorRepository = AppDataSource.getRepository(Desenvolvedor)
    ) {}

    public async execute(id: number) {
      const nivelToDelete = await this.nivelRepository.findOne({
        where: {
          id,
        },
      });
  
      if (!nivelToDelete) {
        throw new Error(Messages.MESSAGE_NOT_FOUND);
      }
  
      const nivelIsAssociated = !!(await this.desenvolvedorRepository.countBy({
         nivel: { 
           id,
         },
       }));
  
       if (nivelIsAssociated) {
         throw new Error(Messages.MESSAGE_NIVEL_ASSOCIATED);
       }
       
      return await this.nivelRepository.delete(id); 
    }

    } 


export default DeleteNivelService 