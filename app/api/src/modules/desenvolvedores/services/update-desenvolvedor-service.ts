import AppDataSource from "../../../database/data_source";
import Niveis from "../../niveis/entities/Nivel";
import { Sexo } from "../../shared/const";
import { Messages } from "../../shared/messages";
import { Desenvolvedor } from "../entities/Desenvolvedor";

interface RequestDTO {
    nome: string,
    idade: number,
    hobby: string,
    sexo: Sexo,
    dataNascimento: Date,
    nivelId: number
}

class UpdateDesenvolvedorService {

    constructor(
        private desenvolvedorRepository = AppDataSource.getRepository(Desenvolvedor),
        private nivelRepository = AppDataSource.getRepository(Niveis)
    ) {}

    public async execute(id: number, {nivelId, ...rest}: RequestDTO) {
      const nivel = await this.nivelRepository.findOne({
        where: {
          id: nivelId,
        },
      });
  
      if (!nivel) {
        throw new Error(Messages.MESSAGE_NIVEL_INVALID);
      }
  
      return this.desenvolvedorRepository.update(id, { ...rest, nivel});
    } 
}    

export default UpdateDesenvolvedorService