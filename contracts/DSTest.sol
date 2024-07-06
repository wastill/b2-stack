// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";

contract ContractBTest is Test {
    uint256 testNumber;
    function setUp() public {
        testNumber = 42;
    }

    function test_NumberIs42() public view {
        assertEq(testNumber, 42);
    }

    function testFail_NumberSub43() public  {
        testNumber -= 43;
    }

    function test_CannotSubtract43() public {
        vm.expectRevert(stdError.arithmeticError);
        testNumber -= 43;
    }
}