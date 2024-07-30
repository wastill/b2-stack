import type { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomicfoundation/hardhat-foundry";
import "@nomicfoundation/hardhat-ignition-ethers";


const config: HardhatUserConfig = {
  solidity: "0.8.26",
};

export default config;
