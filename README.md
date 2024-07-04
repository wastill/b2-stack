# Hello B2-Stake


## Command

## solidity 版本管理工具
安装:
pip3 install solc-select==0.2.
列出所有版本
solc-select install
安装指定版本
solc-select install 0.4.26
使用指定版本
solc-select use 0.4.26
hardhat工具:

初始化:
npx hardhat init

编译:
npx hardhat compile

测试:
npx hardhat test

启动虚拟机:
npx hardhat node

部署:
npx hardhat ignition deploy ./ignition/modules/Lock.ts --network localhost

npm install --global hardhat-shorthand
命令行提示:
hardhat-completion install
