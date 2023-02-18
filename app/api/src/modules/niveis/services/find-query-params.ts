import { Repository } from "typeorm";
import AppDataSource from "../../../database/data_source";
import { Messages } from "../../shared/messages";
import Niveis from "../entities/Nivel";


class FindQueryParams {

    constructor(
        private nivelRepository = AppDataSource.getRepository(Niveis)
    ) { }

    public async execute(nivel: string) {

        const nomeNivel = await this.nivelRepository.findOne({
            where: { nivel },
        });

        if (!nivel) {
            throw new Error(Messages.MESSAGE_NOT_FOUND);
        }

        return nomeNivel;
    }
}

export default FindQueryParams 