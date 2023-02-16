import { Repository } from "typeorm";
import AppDataSource from "../../../database/data_source";
import { Messages } from "../../shared/messages";
import Niveis from "../entities/Nivel";


class FindIdByName {

    constructor(
        private nivelRepository = AppDataSource.getRepository(Niveis)
    ) {}

    public async execute(nivel: string ) {
            
            const idNivel = await this.nivelRepository.findOne({
                where: {nivel},
            });
            
            if (!nivel) {
                throw new Error(Messages.MESSAGE_NOT_FOUND);
            }
            
            return idNivel;
        }
    }

export default FindIdByName 