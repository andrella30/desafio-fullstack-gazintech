import { validate, ValidatorConstraint } from "class-validator";
import { parseJSON } from "date-fns";
import AppDataSource from "../../../database/data_source";
import Niveis from "../../niveis/entities/Nivel";
import { Sexo } from "../../shared/const";
import { Messages } from "../../shared/messages";
import { Desenvolvedor } from "../entities/Desenvolvedor";
import { CreateDesenvolvedorDto } from "./dto/create-desenvolvedor-dto";

class UpdateDesenvolvedorService {

    constructor(
        private desenvolvedorRepository = AppDataSource.getRepository(Desenvolvedor),
        private nivelRepository = AppDataSource.getRepository(Niveis)
    ) {}

    public async execute(id: number, createDesenvolvedorDTO: CreateDesenvolvedorDto) {

      const nivel = await this.nivelRepository.findOne({
        where: {
          id: createDesenvolvedorDTO.nivel,
        },
      });
  
      if (!nivel) {
        throw new Error(Messages.MESSAGE_NIVEL_INVALID);
      }

      const validateData = await validate(createDesenvolvedorDTO);
      if(validateData.length > 0){
          const errorMessage = Object.values(validateData[0].constraints)
          throw new Error(errorMessage[0]);
      }
      this.desenvolvedorRepository.update(id, 
        {
          
         nome: createDesenvolvedorDTO.nome , 
         idade: createDesenvolvedorDTO.idade,
         hobby: createDesenvolvedorDTO.hobby,
         sexo: createDesenvolvedorDTO.sexo,
         dataNascimento: createDesenvolvedorDTO.dataNascimento,
         nivel: nivel 
        });
    } 
}    

export default UpdateDesenvolvedorService 