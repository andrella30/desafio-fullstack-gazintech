import {
    IsEnum,
    IsOptional,
    IsString,
} from 'class-validator';
import { Sexo } from '../../../shared/const';

export class FindAllDesenvolvedorDTO {

    constructor(nome: string, sexo: Sexo, idade: number, hobby: string) {
        this.nome = nome;
        this.sexo = sexo;
        this.idade = idade;
        this.hobby = hobby;
    }

    @IsOptional()
    @IsString({
        message: 'nome inválido',
    })
    nome?: string;

    @IsOptional()
    @IsEnum(Sexo, {
        message: 'sexo inválido',
    })
    sexo?: Sexo;

    @IsOptional()
    @IsString({
        message: 'idade inválido',
    })
    idade?: number;

    @IsOptional()
    @IsString({
        message: 'hobby inválido',
    })
    hobby?: string;
}