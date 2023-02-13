import { validate, validateOrReject } from "class-validator";
import { response } from "express";
import AppDataSource from "../../../database/data_source";
import Niveis from "../../niveis/entities/Nivel";
import { Sexo } from "../../shared/const";
import { Messages } from "../../shared/messages";
import { Desenvolvedor } from "../entities/Desenvolvedor";
import { CreateDesenvolvedorDto } from "./create-desenvolvedor-dto";

interface RequestDTO {
    nome: string,
    idade: number,
    hobby: string,
    sexo: Sexo,
    dataNascimento: Date,
    nivel: number
}
interface ValidatorOptions {
    skipMissingProperties?: boolean;
    whitelist?: boolean;
    forbidNonWhitelisted?: boolean;
    groups?: string[];
    dismissDefaultMessages?: boolean;
    validationError?: {
      target?: boolean;
      value?: boolean;
    };
  
    forbidUnknownValues?: boolean;
    stopAtFirstError?: boolean;
  }

class CreateDesenvolvedorService {
    constructor(
        private desenvolvedorRepository = AppDataSource.getRepository(Desenvolvedor),
        private nivelRepository = AppDataSource.getRepository(Niveis)
    ) {}

    public async execute(createDesenvolvedorDTO: CreateDesenvolvedorDto): Promise<Desenvolvedor> {

        const nivelExists = await this.nivelRepository.findOne({
            where: {
              id: createDesenvolvedorDTO.nivelId,
            },
          });   
      
        if (!nivelExists) {
            throw new Error(Messages.MESSAGE_NIVEL_INVALID);
        }
                
        const validateDate = await validate(createDesenvolvedorDTO);
        if(validateDate.length > 0)
            throw new Error(Messages.MESSAGE_INCORRECT_INPUT);

  
        const desenvolvedor = this.desenvolvedorRepository.create(createDesenvolvedorDTO)

        await this.desenvolvedorRepository.save(desenvolvedor)

        return desenvolvedor;

    } 

}

export default CreateDesenvolvedorService