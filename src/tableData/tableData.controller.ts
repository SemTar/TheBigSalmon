
import { Controller, Get } from '@nestjs/common';
import { TableData } from "./tableData.entity";
import { TableDataService } from "./tableData.service";

@Controller('/tableData')
export class TableDataController {
  constructor(private readonly tableDataService: TableDataService) {}

  @Get()
  findAllData(): Promise<TableData[]> {
    return this.tableDataService.findAllData();
  }
}