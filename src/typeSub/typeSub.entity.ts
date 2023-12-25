import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class TypeSub {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  guid: string;

  @Column()
  name: string;

  @Column()
  num_sub: number;

  @Column()
  max_num_sub: number;

  @Column()
  validity: number;

  @Column()
  date_creation: string;

  @Column()
  date_changes: string;

  @Column({nullable: true,})
  date_deleted: string;

  @Column({nullable: true,})
  usr_acc_creation_id: number;

  @Column({nullable: true,})
  usr_acc_changes_id: number;
}