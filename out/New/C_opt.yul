/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "C_67" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("D_14")
            let _2 := add(128, _1)
            if or(gt(_2, sub(shl(64, 1), 1)), lt(_2, 128))
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            datacopy(128, dataoffset("D_14"), _1)
            mstore(_2, 0x04)
            let _3 := 0
            let expr_address := create(_3, 128, add(_1, 32))
            if iszero(expr_address)
            {
                returndatacopy(_3, _3, returndatasize())
                revert(_3, returndatasize())
            }
            sstore(_3, or(and(sload(_3), not(sub(shl(160, 1), 1))), and(expr_address, sub(shl(160, 1), 1))))
            let _4 := datasize("C_67_deployed")
            codecopy(_3, dataoffset("C_67_deployed"), _4)
            return(_3, _4)
        }
    }
    object "C_67_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    switch shr(224, calldataload(_1))
                    case 0x8dcd64cc {
                        if slt(add(calldatasize(), not(3)), 64) { revert(_1, _1) }
                        let _2 := datasize("D_14")
                        let _3 := add(128, _2)
                        if or(gt(_3, 0xffffffffffffffff), lt(_3, 128)) { panic_error_0x41() }
                        datacopy(128, dataoffset("D_14"), _2)
                        let expr_address := create(calldataload(36), 128, add(abi_encode_uint256(_3, calldataload(4)), not(127)))
                        if iszero(expr_address) { revert_forward() }
                        let expr_address_1 := and(expr_address, sub(shl(160, 1), 1))
                        if iszero(extcodesize(expr_address_1)) { revert(_1, _1) }
                        let _4 := mload(64)
                        mstore(_4, shl(226, 0x03155a67))
                        let _5 := staticcall(gas(), expr_address_1, _4, 4, _4, 32)
                        if iszero(_5) { revert_forward() }
                        if _5
                        {
                            finalize_allocation(_4, returndatasize())
                            pop(abi_decode_uint256_fromMemory(_4, add(_4, returndatasize())))
                        }
                        return(mload(64), _1)
                    }
                    case 0x95fe0e65 {
                        if callvalue() { revert(_1, _1) }
                        fun_createD(abi_decode_uint256(calldatasize()))
                        return(mload(64), _1)
                    }
                }
                revert(0, 0)
            }
            function abi_decode_uint256(dataEnd) -> value0
            {
                if slt(add(dataEnd, not(3)), 32) { revert(value0, value0) }
                value0 := calldataload(4)
            }
            function abi_decode_uint256_fromMemory(headStart, dataEnd) -> value0
            {
                if slt(sub(dataEnd, headStart), 32) { revert(value0, value0) }
                value0 := mload(headStart)
            }
            function abi_encode_uint256(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, value0)
            }
            function finalize_allocation(memPtr, size)
            {
                let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }
            function fun_createD(var_arg)
            {
                let _1 := mload(64)
                let _2 := datasize("D_14")
                let _3 := add(_1, _2)
                if or(gt(_3, 0xffffffffffffffff), lt(_3, _1)) { panic_error_0x41() }
                datacopy(_1, dataoffset("D_14"), _2)
                let expr_34_address := create(0, _1, sub(abi_encode_uint256(_3, var_arg), _1))
                if iszero(expr_34_address) { revert_forward() }
                let expr_address := and(expr_34_address, sub(shl(160, 1), 1))
                if iszero(extcodesize(expr_address)) { revert(0, 0) }
                let _4 := mload(64)
                mstore(_4, shl(226, 0x03155a67))
                let _5 := staticcall(gas(), expr_address, _4, 4, _4, 32)
                if iszero(_5) { revert_forward() }
                if _5
                {
                    finalize_allocation(_4, returndatasize())
                    pop(abi_decode_uint256_fromMemory(_4, add(_4, returndatasize())))
                }
            }
            function panic_error_0x41()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            function revert_forward()
            {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }
        }
        object "D_14" {
            code {
                {
                    mstore(64, 128)
                    let programSize := datasize("D_14")
                    let argSize := sub(codesize(), programSize)
                    let newFreePtr := add(128, and(add(argSize, 31), not(31)))
                    if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, 128))
                    {
                        mstore(0, shl(224, 0x4e487b71))
                        mstore(4, 0x41)
                        revert(0, 0x24)
                    }
                    mstore(64, newFreePtr)
                    codecopy(128, programSize, argSize)
                    if slt(argSize, 32) { revert(0, 0) }
                    sstore(0x00, mload(128))
                    let _1 := datasize("D_14_deployed")
                    codecopy(0x00, dataoffset("D_14_deployed"), _1)
                    return(0x00, _1)
                }
            }
            object "D_14_deployed" {
                code {
                    {
                        mstore(64, 128)
                        if iszero(lt(calldatasize(), 4))
                        {
                            let _1 := 0
                            if eq(0x0c55699c, shr(224, calldataload(_1)))
                            {
                                if callvalue() { revert(_1, _1) }
                                if slt(add(calldatasize(), not(3)), _1) { revert(_1, _1) }
                                mstore(128, sload(_1))
                                return(128, 32)
                            }
                        }
                        revert(0, 0)
                    }
                }
            }
        }
    }
    object "D_14" {
        code {
            {
                mstore(64, 128)
                let programSize := datasize("D_14")
                let argSize := sub(codesize(), programSize)
                let newFreePtr := add(128, and(add(argSize, 31), not(31)))
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, 128))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x41)
                    revert(0, 0x24)
                }
                mstore(64, newFreePtr)
                codecopy(128, programSize, argSize)
                if slt(argSize, 32) { revert(0, 0) }
                sstore(0x00, mload(128))
                let _1 := datasize("D_14_deployed")
                codecopy(0x00, dataoffset("D_14_deployed"), _1)
                return(0x00, _1)
            }
        }
        object "D_14_deployed" {
            code {
                {
                    mstore(64, 128)
                    if iszero(lt(calldatasize(), 4))
                    {
                        let _1 := 0
                        if eq(0x0c55699c, shr(224, calldataload(_1)))
                        {
                            if callvalue() { revert(_1, _1) }
                            if slt(add(calldatasize(), not(3)), _1) { revert(_1, _1) }
                            mstore(128, sload(_1))
                            return(128, 32)
                        }
                    }
                    revert(0, 0)
                }
            }
        }
    }
}
