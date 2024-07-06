import { type HardhatUserConfig, extendEnvironment, task } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomicfoundation/hardhat-foundry";


const config: HardhatUserConfig = {
  solidity: "0.8.26",
};

export default config;

extendEnvironment((hre) => {
  hre.hi = "Hello Hardhat!";
})

task("envtest", async (args, hre) => {
  console.log(hre.hi);
})

