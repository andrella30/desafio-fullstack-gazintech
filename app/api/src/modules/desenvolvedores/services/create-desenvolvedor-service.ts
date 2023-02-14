import { validate } from "class-validator";
import AppDataSource from "../../../database/data_source";
import Niveis from "../../niveis/entities/Nivel";
import { Sexo } from "../../shared/const";
import { Messages } from "../../shared/messages";
import { Desenvolvedor } from "../entities/Desenvolvedor";
import { CreateDesenvolvedorDto } from "./dto/create-desenvolvedor-dto";

class CreateDesenvolvedorService { 
    constructor(
        private desenvolvedorRepository = AppDataSource.getRepository(Desenvolvedor),
        private nivelRepository = AppDataSource.getRepository(Niveis)
    ) {}

    public async execute(createDesenvolvedorDTO: CreateDesenvolvedorDto): Promise<Desenvolvedor> {

        const nivelExists = await this.nivelRepository.findOne({
            where: {
              id: createDesenvolvedorDTO.nivel,
            },
          });   
      
        if (!nivelExists) {
            throw new Error(Messages.MESSAGE_NIVEL_INVALID);
        }
                
        const validateData = await validate(createDesenvolvedorDTO);
        if(validateData.length > 0) {
            const errorMessage = Object.values(validateData[0].constraints)
            throw new Error(errorMessage[0]);
        }
        
        const desenvolvedor = this.desenvolvedorRepository.create(createDesenvolvedorDTO)
        await this.desenvolvedorRepository.save(desenvolvedor)

        return desenvolvedor;

    } 

}

export default CreateDesenvolvedorService