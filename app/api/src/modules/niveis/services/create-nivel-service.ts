import AppDataSource from "../../../database/data_source"
import { Messages } from "../../shared/messages"
import Niveis from "../entities/Nivel"

interface Request {
    nivel: string
}

class CreateNivelService {
    constructor(
        private nivelRepository = AppDataSource.getRepository(Niveis)
    ) {}

    public async execute({nivel} : Request): Promise<Niveis> {
        
        const checkNivelExists = await this.nivelRepository.findOne({
            where: {nivel}
        })

        if(checkNivelExists) {
            throw new Error(Messages.MESSAGE_NIVEL_EXIST)
        }

        const novoNivel = this.nivelRepository.create({nivel})

        await this.nivelRepository.save(novoNivel)

        return novoNivel;

    }

}

export default CreateNivelService