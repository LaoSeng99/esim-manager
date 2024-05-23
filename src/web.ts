import { WebPlugin } from '@capacitor/core';

import type { EsimManagerPlugin } from './definitions';

export class EsimManagerWeb extends WebPlugin implements EsimManagerPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
