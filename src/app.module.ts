import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from "@nestjs/typeorm";
import { TableData } from "./tableData/tableData.entity";
import { TypeSub } from "./typeSub/typeSub.entity";
import { TableDataModule } from "./tableData/tableData.module";
import { TypeSubModule } from "./typeSub/typeSub.module";
import { ConfigModule } from "@nestjs/config";
import * as process from "process";

@Module({
  imports: [
    ConfigModule.forRoot(  {isGlobal: true,} ),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST,
      port: +process.env.DB_HOST,
      username: process.env.USERNAME,
      password: process.env.PASSWORD,
      database: process.env.DATABASE,
      entities: [TableData, TypeSub],
      synchronize: false,
    }),
    TableDataModule,
    TypeSubModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {
}