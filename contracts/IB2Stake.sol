// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IB2Stake {

    /**
     * 质押
     * - **输入参数**: 池 ID(_pid)，质押数量(_amount)。
     * - **前置条件**: 用户已授权足够的代币给合约。
     * - **后置条件**: 用户的质押代币数量增加，池中的总质押代币数量更新。
     * - **异常处理**: 质押数量低于最小质押要求时拒绝交易。
     */ 
    function Stake(uint256 _pid, uint256 _amount) external;

    /**
     * 解除质押
     * **输入参数**: 池 ID(_pid)，解除质押数量(_amount)。
     * **前置条件**: 用户质押的代币数量足够。
     * **后置条件**: 用户的质押代币数量减少，解除质押请求记录，等待锁定期结束后可提取。
     * **异常处理**: 如果解除质押数量大于用户质押的数量，交易失败。
     */
    function UnStake(uint256 _pid, uint256 _amount) external;

    /**
     * ##### 2.3 领取奖励
     * - **输入参数**: 池 ID(_pid)。
     * - **前置条件**: 有可领取的奖励。
     * - **后置条件**: 用户领取其奖励，清除已领取的奖励记录。
     * - **异常处理**: 如果没有可领取的奖励，不执行任何操作。
     */
    function WithDraw(uint256 _pid) external;

    /** 
     * ##### 2.4 添加和更新质押池
     * - **输入参数**: 质押代币地址(_stTokenAddress)，池权重(_poolWeight)，最小质押金额(_minDepositAmount)，解除质押锁定区(_unstakeLockedBlocks)。
     * - **前置条件**: 只有管理员可操作。
     * - **后置条件**: 创建新的质押池或更新现有池的配置。
     * - **异常处理**: 权限验证失败或输入数据验证失败。
     */
    function AddPool(address _stTokenAddress, uint256 _poolWeight, uint256 _minDepositAmount, uint256 _unstakeLockedBlocks) external;

    /**
     * ##### 2.5 设置质押池权重
     * - **输入参数**: 池 ID(_pid)，新的权重(_poolWeight)。
     * - **前置条件**: 只有管理员可操作。
     * - **后置条件**: 更新池的权重。
     * - **异常处理**: 权限验证失败或输入数据验证失败。
     */
    function SetPoolWeight(uint256 _pid, uint256 _poolWeight) external;

    /**
     * ##### 2.6 设置质押池最小质押金额
     * - **输入参数**: 池 ID(_pid)，新的最小质押金额(_minDepositAmount)。
     * - **前置条件**: 只有管理员可操作。
     * - **后置条件**: 更新池的最小质押金额。
     * - **异常处理**: 权限验证失败或输入数据验证失败。
     */
    function SetPoolMinDepositAmount(uint256 _pid, uint256 _minDepositAmount) external;

    
    
    
}