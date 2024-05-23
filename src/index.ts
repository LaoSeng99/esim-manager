import { registerPlugin } from '@capacitor/core';

import type { EsimManagerPlugin } from './definitions';

const EsimManager = registerPlugin<EsimManagerPlugin>('EsimManager', {
  web: () => import('./web').then(m => new m.EsimManagerWeb()),
});

export * from './definitions';
export { EsimManager };
