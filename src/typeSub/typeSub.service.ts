import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from "@nestjs/typeorm";
import { DataSource, Repository } from "typeorm";
import { TypeSub } from "./typeSub.entity";
import { UpdateTypeSubDTO } from "./DTOs/updateTypeSub.DTO";

@Injectable()
export class TypeSubService {
  constructor(
    @InjectRepository(TypeSub)
    private typeSub: Repository<TypeSub>,
    private dataSource: DataSource
  ) {
  }

  async findAllTypeSub(): Promise<TypeSub[]> {
    return await this.typeSub.find();
  }

  async createTypeSub(body: {
    name: string,
    num_sub: number,
    max_num_sub: number,
    validity: number,
  }): Promise<string> {
    const queryRunner = await this.dataSource
      .createQueryBuilder()
      .insert()
      .into(TypeSub)
      .values([
        {
          name: body.name,
          num_sub: body.num_sub,
          max_num_sub: body.max_num_sub,
          validity: body.validity,
        }
      ])
      .execute()

    return 'success';
  }

  async updateTypeSub(body: UpdateTypeSubDTO): Promise<string> {
    let date = new Date;
    const queryRunner = await this.dataSource
      .createQueryBuilder()
      .update(TypeSub)
      .set(body)
      .where("id = :id", {id: body.id})
      .execute()
      .then(result => {
        if (!result.affected) {
          throw new NotFoundException()
        }
      })

    return 'success';

  }

  async deleteTypeSub(id: number): Promise<string> {

    const date = new Date;
    const queryRunner = await this.dataSource
      .createQueryBuilder()
      .update(TypeSub)
      .set({
        date_deleted: date.toISOString(),
      })
      .where("id = :id", {id: id})
      .execute()
      .then(result => {
        if (!result.affected) {
          throw new NotFoundException()
        }
      })

    return 'success';
  }
}