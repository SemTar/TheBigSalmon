import { Min, IsDefined, IsPositive, Max } from 'class-validator';

export class CreateTypeSubDTO {
  @IsDefined()
  name: string;

  @IsDefined()
  @Min(0)
  num_sub: number;

  @IsDefined()
  @IsPositive()
  max_num_sub: number;

  @IsDefined()
  @IsPositive()
  validity: number;
}