import { FindOptionsWhere, Like, Repository } from "typeorm";
import AppDataSource from "../../../database/data_source";
import { Messages } from "../../shared/messages";
import { Desenvolvedor } from "../entities/Desenvolvedor";
import { CreateDesenvolvedorDto } from "./dto/create-desenvolvedor-dto";
import { FindAllDesenvolvedorDTO } from "./dto/find-all-desenvolvedores-dto";


class FindDesenvolvedorByParam {

    constructor(
        private desenvolvedorRepository = AppDataSource.getRepository(Desenvolvedor)
    ) { }

    public async execute({ nome, hobby, sexo, idade }: FindAllDesenvolvedorDTO) {


        const where: FindOptionsWhere<Desenvolvedor> = {
            ...(nome && { nome: Like(`%${nome}%`) }),
            ...(hobby && { hobby: Like(`%${hobby}%`) }),
            ...(sexo && { sexo }),
            ...(idade && { idade })
        };

        const returnParam = await this.desenvolvedorRepository.find({
            where
        });

        if (!where) {
            throw new Error(Messages.MESSAGE_NOT_FOUND);
        }

        return returnParam;
    }
}

export default FindDesenvolvedorByParam 