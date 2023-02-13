import AppDataSource from "../../../database/data_source";
import { Desenvolvedor } from "../entities/Desenvolvedor";


class FindAllDesenvolvedorService {

    constructor(
        private desenvolvedorRepository = AppDataSource.getRepository(Desenvolvedor)
    ) {}

    public async execute(): Promise<Desenvolvedor[]> {
        const desenvolvedores = await this.desenvolvedorRepository.find({
            order: {
                id: {
                    direction: "ASC"
                }
            },
            relations: ['nivel'],
        })        
        return desenvolvedores;
    }
}

export default FindAllDesenvolvedorService
