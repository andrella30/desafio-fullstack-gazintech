import { Type } from 'class-transformer';
import {
  IsDate,
  IsEnum,
  IsNotEmpty,
  IsNumber,
  IsString,
} from 'class-validator';
import { Sexo } from '../../../shared/const';

export class CreateDesenvolvedorDto {

  constructor(nivel: number, nome: string, sexo: Sexo, idade: number, dataNascimento: Date, hobby: string) {
    this.nivel = nivel;
    this.nome = nome;
    this.sexo = sexo;
    this.idade = idade;
    this.dataNascimento = dataNascimento;
    this.hobby = hobby;
  }

  @IsNotEmpty({
    message: 'nivel é obrigatório',
  })
  @IsNumber(
    {},
    {
      message: 'nivel inválido',
    },
  )
  nivel: number;

  @IsNotEmpty({
    message: 'nome é obrigatório',
  })
  @IsString({
    message: 'nome inválido',
  })
  nome: string;

  @IsNotEmpty({
    message: 'sexo é obrigatório',
  })
  @IsEnum(Sexo, {
    message: 'sexo inválido',
  })
  sexo: Sexo;

  @IsNotEmpty({
    message: 'dataNascimento é obrigatório',
  })
  @IsDate({
    message: 'dataNascimento inválido',
  })
  @Type(() => Date)
  dataNascimento: Date;

  @IsNotEmpty({
    message: 'idade é obrigatório',
  })
  @IsNumber(
    {},
    {
      message: 'idade inválido',
    },
  )
  idade: number;

  @IsNotEmpty({
    message: 'hobby é obrigatório',
  })
  @IsString({
    message: 'hobby inválido',
  })
  hobby: string;
}