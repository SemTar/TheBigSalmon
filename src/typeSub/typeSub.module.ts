
import { Module } from '@nestjs/common';
import { TypeOrmModule } from "@nestjs/typeorm";
import { TypeSub } from "./typeSub.entity";
import { TypeSubService } from "./typeSub.service";
import { TypeSubController } from "./typeSub.controller";

@Module({
  imports: [
    TypeOrmModule.forFeature([TypeSub])
  ],
  controllers: [TypeSubController],
  providers: [TypeSubService],
})
export class TypeSubModule {}