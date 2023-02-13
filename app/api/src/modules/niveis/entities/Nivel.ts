import { Entity, Column, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Niveis {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column()
  nivel: string;
}
 
export default Niveis;