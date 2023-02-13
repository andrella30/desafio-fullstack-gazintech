import { MigrationInterface, QueryRunner, Table } from "typeorm"

export class CreateNiveis1676238753982 implements MigrationInterface {

    public async up(queryRunner: QueryRunner): Promise<any> {
        await queryRunner.createTable(
            new Table({
                name: 'niveis',
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
                        type: 'varchar',
                        isNullable: false,
                        isUnique: true
                    }
                ]
            })
        )
    }

    public async down(queryRunner: QueryRunner): Promise<any> {
        await queryRunner.dropTable('niveis')
    }

}
