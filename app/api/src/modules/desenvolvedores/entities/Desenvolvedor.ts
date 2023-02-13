import { Sexo } from '../../shared/const';
import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

import Niveis from '../../niveis/entities/Nivel';

@Entity()
export class Desenvolvedor {

  @PrimaryGeneratedColumn('increment')
  id: number;

  @ManyToOne(() => Niveis)
  @JoinColumn()
  nivel: number;

  @Column()
  nome: string;

  @Column({
    type: 'enum',
    enum: Sexo,
  })
  sexo: Sexo;

  @Column()
  dataNascimento: Date;

  @Column()
  idade: number;

  @Column()
  hobby: string;
}