import {expect, use} from 'chai';
import {deployContract, MockProvider, solidity} from 'ethereum-waffle';
import { providers } from 'ethers';
import {EtherSplitter, EtherSplitter__factory} from '../build/types';

use(solidity);

describe('Ether Splitter', () => {
  const [alice, bob, charlie, david] = new MockProvider().getWallets();
  let splitter: EtherSplitter;

  beforeEach(async () => {
    splitter = await deployContract(alice, EtherSplitter__factory, []);
  });

  it('Deploys correctly and has an address', async () => {
    expect(splitter.address).to.be.properAddress
  });


  
  it('Transfers ether to the contract', async() => {
    expect(await providers.getBalance(contract.address).to.eq(0))
  });
});
