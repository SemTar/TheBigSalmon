import { Body, Controller, Get, Post } from '@nestjs/common';
import { AppService } from './app.service';
import { TableData } from "./tableData/tableData.entity";
import { TypeSub } from "./typeSub/typeSub.entity";
import { CreateTypeSubDTO } from "./typeSub/DTOs/createTypeSub.DTO";
import { UpdateTypeSubDTO } from "./typeSub/DTOs/updateTypeSub.DTO";
import { IdDTO } from "./DTOs/id.DTO";
import process from "process";

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

}
