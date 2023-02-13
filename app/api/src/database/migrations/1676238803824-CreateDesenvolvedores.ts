import { MigrationInterface, QueryRunner, Table ,TableForeignKey} from "typeorm"

export class CreateDesenvolvedores1676238803824 implements MigrationInterface {

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.createTable(
            new Table({
                name: 'desenvolvedor',
                columns: [
                    {
                        name: 'id',
                        type: 'integer',
                        isPrimary: true,
                        isGenerated: true,
                        generationStrategy: 'increment',
                    },
                    {
                        name: 'nivel',
                        type: 'integer',
                        isNullable: false,
                        isUnique: true
                    },
                    {
                        name: 'nome',
                        type: 'varchar',
                        isNullable: false
                    },
                    {
                        name: 'sexo',
                        type: 'char',
                        isNullable: false
                    },
                    {
                        name: 'dataNascimento',
                        type: 'date',
                        isNullable: false
                    },
                    {
                        name: 'idade',
                        type: 'integer',
                        isNullable: false
                    },
                    {
                        name: 'hobby',
                        type: 'varchar',
                        isNullable: false
                    },
                    
                ]
            }),
        );

        const foreignKey = new TableForeignKey({
            columnNames: ['nivel'],
            referencedColumnNames: ['id'],
            referencedTableName: 'niveis',
            onDelete: 'RESTRICT'
        });
        await queryRunner.createForeignKey('desenvolvedor', foreignKey);


    }

    public async down(queryRunner: QueryRunner): Promise<any> {
        await queryRunner.dropTable('desenvolvedor')
    }

}
