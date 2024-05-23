export interface EsimManagerPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
