import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class TableData {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  guid: string;

  @Column()
  name: string;

  @Column()
  short: string;

  @Column()
  caption: string;

  @Column()
  info_txt: string;

  @Column()
  is_file_table: boolean;

  @Column()
  is_ready: boolean;
}