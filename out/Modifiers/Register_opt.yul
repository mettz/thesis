/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "Register_101" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let programSize := datasize("Register_101")
            let argSize := sub(codesize(), programSize)
            let newFreePtr := add(128, and(add(argSize, 31), not(31)))
            if or(gt(newFreePtr, sub(shl(64, 1), 1)), lt(newFreePtr, 128))
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            mstore(64, newFreePtr)
            codecopy(128, programSize, argSize)
            if slt(argSize, 32) { revert(0, 0) }
            constructor_Register(mload(128))
            let _1 := datasize("Register_101_deployed")
            codecopy(0, dataoffset("Register_101_deployed"), _1)
            return(0, _1)
        }
        function constructor_Register(var_initialPrice)
        {
            sstore(0, or(and(sload(0), not(sub(shl(160, 1), 1))), caller()))
            sstore(0x02, var_initialPrice)
        }
    }
    object "Register_101_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    switch shr(224, calldataload(_1))
                    case 0x1aa3a008 {
                        abi_decode(calldatasize())
                        if iszero(lt(callvalue(), sload(0x02)))
                        {
                            mstore(_1, caller())
                            mstore(0x20, 0x01)
                            let dataSlot := keccak256(_1, 64)
                            sstore(dataSlot, or(and(sload(dataSlot), not(255)), 0x01))
                        }
                        return(128, _1)
                    }
                    case 0x83197ef0 {
                        if callvalue() { revert(_1, _1) }
                        abi_decode(calldatasize())
                        modifier_onlyOwner()
                        return(mload(64), _1)
                    }
                    case 0xa2b40d19 {
                        if callvalue() { revert(_1, _1) }
                        modifier_onlyOwner_93(abi_decode_uint256(calldatasize()))
                        return(mload(64), _1)
                    }
                }
                revert(0, 0)
            }
            function abi_decode(dataEnd)
            {
                if slt(add(dataEnd, not(3)), 0) { revert(0, 0) }
            }
            function abi_decode_uint256(dataEnd) -> value0
            {
                if slt(add(dataEnd, not(3)), 32) { revert(value0, value0) }
                value0 := calldataload(4)
            }
            function modifier_onlyOwner()
            {
                let cleaned := and(sload(0x00), sub(shl(160, 1), 1))
                require_helper_stringliteral_0fce(eq(caller(), cleaned))
                selfdestruct(cleaned)
            }
            function modifier_onlyOwner_93(var_price)
            {
                require_helper_stringliteral_0fce(eq(caller(), and(sload(0x00), sub(shl(160, 1), 1))))
                sstore(0x02, var_price)
            }
            function require_helper_stringliteral_0fce(condition)
            {
                if iszero(condition)
                {
                    let memPtr := mload(64)
                    mstore(memPtr, shl(229, 4594637))
                    mstore(add(memPtr, 4), 32)
                    mstore(add(memPtr, 36), 34)
                    mstore(add(memPtr, 68), "Only owner can call this functio")
                    mstore(add(memPtr, 100), "n.")
                    revert(memPtr, 132)
                }
            }
        }
    }
}
