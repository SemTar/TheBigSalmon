import { Min, IsDefined, IsPositive, IsOptional } from 'class-validator';

export class UpdateTypeSubDTO {

  @IsDefined()
  @IsPositive()
  id: number;

  @IsOptional()
  name: string;

  @IsOptional()
  @Min(0)
  num_sub: number;

  @IsOptional()
  @IsPositive()
  max_num_sub: number;

  @IsOptional()
  @IsPositive()
  validity: number;
}