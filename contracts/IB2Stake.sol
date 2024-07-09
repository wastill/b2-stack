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

    
    
}