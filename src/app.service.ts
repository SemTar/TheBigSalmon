import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TableData } from "./tableData/tableData.entity";
import { DataSource, Repository } from 'typeorm';
import { TypeSub } from "./typeSub/typeSub.entity";
import { UpdateTypeSubDTO } from "./typeSub/DTOs/updateTypeSub.DTO";


@Injectable()
export class AppService {
  constructor() {
  }

}
