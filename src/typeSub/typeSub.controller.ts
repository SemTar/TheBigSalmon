
import { Body, Controller, Get, Post } from '@nestjs/common';
import { TypeSubService } from "./typeSub.service";
import { TypeSub } from "./typeSub.entity";
import { CreateTypeSubDTO } from "./DTOs/createTypeSub.DTO";
import { UpdateTypeSubDTO } from "./DTOs/updateTypeSub.DTO";
import { IdDTO } from "../DTOs/id.DTO";

@Controller('/typeSub')
export class TypeSubController {
  constructor(private readonly typeSubService: TypeSubService) {}

  @Get()
  findAllTypeSub(): Promise<TypeSub[]> {
    return this.typeSubService.findAllTypeSub();
  }

  @Post('/create')
  createTypeSub(@Body() body: CreateTypeSubDTO): Promise<string> {

    return this.typeSubService.createTypeSub(body);
  }

  @Post('/update')
  updateTypeSub(@Body() updateTypeSubDTO: UpdateTypeSubDTO): Promise<string> {

    return this.typeSubService.updateTypeSub(updateTypeSubDTO);
  }

  @Post('/delete')
  deleteTypeSub(@Body() idDTO: IdDTO): Promise<string> {

    return this.typeSubService.deleteTypeSub(idDTO.id);
  }
}