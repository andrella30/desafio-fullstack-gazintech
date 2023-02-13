import AppDataSource from "../../../database/data_source"
import Niveis from "../entities/Nivel"
import { Exclude, Transform } from 'class-transformer';
import { IsNotEmpty, IsString } from 'class-validator';
import { Messages } from "../../shared/messages";

 interface RequestDTO {
     id: number,
     nivel: string
 }


class UpdateNivelService {

    constructor(
        private nivelRepository = AppDataSource.getRepository(Niveis)
    ) {}

    public async execute({id, nivel}: RequestDTO) {

        const current_nivel = await this.nivelRepository.findOne(
            {where: {id}}
          )
        
        if(!current_nivel) {
            throw new Error(Messages.MESSAGE_NOT_FOUND)
        }

        const checkNivelExists = await this.nivelRepository.findOne({
            where: {nivel}
        })

        if(checkNivelExists) {
            throw new Error(Messages.MESSAGE_NIVEL_EXIST)
        }
        
        await this.nivelRepository.update(id, {id, nivel});
        current_nivel.nivel = nivel;

        return current_nivel;
    }
}



export default UpdateNivelService