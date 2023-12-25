import { Injectable } from '@nestjs/common';
import { InjectRepository } from "@nestjs/typeorm";
import { TableData } from "./tableData.entity";
import { Repository } from "typeorm";

@Injectable()
export class TableDataService {
  constructor(@InjectRepository(TableData) private tableData: Repository<TableData>) {
  }

  findAllData(): Promise<TableData[]> {
    return this.tableData.find();
  }
}