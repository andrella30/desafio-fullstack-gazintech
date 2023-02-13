import AppDataSource from "../../../database/data_source";
import Niveis from "../entities/Nivel";


class FindAllNiveisService {

    constructor(
        private nivelRepository = AppDataSource.getRepository(Niveis)
    ) {}

    public async execute(): Promise<Niveis[]> {
        const niveis = this.nivelRepository.find({
            order: {
                id: {
                    direction: "ASC"
                }
            }
        })    
        return niveis;
    }
}

export default FindAllNiveisService