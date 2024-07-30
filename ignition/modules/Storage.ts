import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
const { ethers, upgrades } = require("hardhat");  


const StorageModule = buildModule("StorageModule", (m) => {
  const implementation = m.contract("StandardStake");  

  const proxy = m.proxy(implementation, {  
    kind: "uups",  
    initializer: "initialize",  
    constructorArgs: [],  
    proxyContract: "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol:ERC1967Proxy",  
    execute: {  
      methodName: "initialize",  
      args: [/* 初始化参数 */],  
    },  
  });  

  return { implementation, proxy };  
});

export default StorageModule;

