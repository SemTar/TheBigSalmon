
import { Module } from '@nestjs/common';
import { TableDataController } from "./tableData.controller";
import { TableDataService } from "./tableData.service";
import { TypeOrmModule } from "@nestjs/typeorm";
import { TableData } from "./tableData.entity";

@Module({
  imports: [
    TypeOrmModule.forFeature([TableData])
  ],
  controllers: [TableDataController],
  providers: [TableDataService],
})
export class TableDataModule {}