const HDWalletProvider = require('@truffle/hdwallet-provider');
const fs = require('fs');
const mnemonic = "hour sauce shrimp receive meadow worry blast adjust tag betray bleak push";
const infuraKey = "6b1ee802aa204e818e26e173d07637b3";

module.exports = {
	compilers: {
		solc: {
			version: "^0.6"
		}
	},

  networks: {
    //development: {
    //  host: "127.0.0.1",     // Localhost (default: none)
    //  port: 7545,            // Standard Ethereum port (default: none)
    //  network_id: "*",       // Any network (default: none)
    //},
	
	rinkeby: {
      provider: () => new HDWalletProvider(mnemonic, 'https://rinkeby.infura.io/v3/6b1ee802aa204e818e26e173d07637b3'),
      network_id: 4,
      gas: 5500000,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    }
  },
};