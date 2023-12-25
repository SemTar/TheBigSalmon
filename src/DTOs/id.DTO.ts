import { IsDefined, IsPositive } from 'class-validator';

export class IdDTO {
  @IsDefined()
  @IsPositive()
  id: number
}