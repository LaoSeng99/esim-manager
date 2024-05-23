import { registerPlugin } from '@capacitor/core';

export interface EsimManagerPlugin{
  checkESimSupport():Promise<{supported:boolean}>
}

const EsimManager = registerPlugin<EsimManagerPlugin>('EsimManager', {
  web: () => import('./web').then(m => new m.EsimManagerWeb()),
});

export * from './definitions';
export { EsimManager };
