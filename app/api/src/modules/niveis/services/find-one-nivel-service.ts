import { Repository } from "typeorm";
import AppDataSource from "../../../database/data_source";
import { Messages } from "../../shared/messages";
import Niveis from "../entities/Nivel";


class FindOneNivelService {

    constructor(
        private nivelRepository = AppDataSource.getRepository(Niveis)
    ) {}

    public async execute(id: number ) {

            const nivel = await this.nivelRepository.findOne({
                where: {id},
            });
            
            if (!nivel) {
                throw new Error(Messages.MESSAGE_NOT_FOUND);
            }
            
            return nivel;
        }
    }

export default FindOneNivelService 