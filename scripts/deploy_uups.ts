import { ethers, upgrades } from "hardhat";  

async function main() {  
  const [deployer] = await ethers.getSigners();  

  console.log("Deploying contracts with the account:", deployer.address);  

  // 部署合约  
  const MyToken = await ethers.getContractFactory("MyToken");  
  
  // 这里我们假设 defaultAdmin, pauser, minter, 和 upgrader 都是部署者地址  
  // 你可以根据需要修改这些地址  
  const defaultAdmin = deployer.address;  
  const pauser = deployer.address;  
  const minter = deployer.address;  
  const upgrader = deployer.address;  

  console.log("Deploying MyToken...");  
  const myToken = await upgrades.deployProxy(MyToken,   
    [defaultAdmin, pauser, minter, upgrader],  
    { kind: "uups" }  
  );  

  await myToken.waitForDeployment();  

  console.log("MyToken deployed to:", await myToken.getAddress());  

  // 可选：验证初始化参数  
  console.log("Verifying roles...");  
  const PAUSER_ROLE = await myToken.PAUSER_ROLE();  
  const MINTER_ROLE = await myToken.MINTER_ROLE();  
  const UPGRADER_ROLE = await myToken.UPGRADER_ROLE();  

  console.log("PAUSER_ROLE granted:", await myToken.hasRole(PAUSER_ROLE, pauser));  
  console.log("MINTER_ROLE granted:", await myToken.hasRole(MINTER_ROLE, minter));  
  console.log("UPGRADER_ROLE granted:", await myToken.hasRole(UPGRADER_ROLE, upgrader));  

  // 打印初始代币供应量  
  const totalSupply = await myToken.totalSupply();  
  console.log("Initial total supply:", ethers.formatEther(totalSupply));  
}  

main().catch((error) => {  
  console.error(error);  
  process.exitCode = 1;  
});