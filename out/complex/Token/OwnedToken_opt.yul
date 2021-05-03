/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "OwnedToken_71" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let programSize := datasize("OwnedToken_71")
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
            constructor_OwnedToken(mload(128))
            let _1 := datasize("OwnedToken_71_deployed")
            codecopy(0, dataoffset("OwnedToken_71_deployed"), _1)
            return(0, _1)
        }
        function constructor_OwnedToken(var_name)
        {
            let _1 := not(sub(shl(160, 1), 1))
            sstore(0x01, or(and(sload(0x01), _1), caller()))
            sstore(0, or(and(sload(0), _1), caller()))
            sstore(0x02, var_name)
        }
    }
    object "OwnedToken_71_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    switch shr(224, calldataload(_1))
                    case 0x1a695230 {
                        if callvalue() { revert(_1, _1) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_1, _1) }
                        let value := calldataload(4)
                        if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(_1, _1) }
                        fun_transfer(value)
                        return(mload(64), _1)
                    }
                    case 0x898855ed {
                        if callvalue() { revert(_1, _1) }
                        fun_changeName(abi_decode_bytes32(calldatasize()))
                        return(mload(64), _1)
                    }
                }
                revert(0, 0)
            }
            function abi_decode_bool_fromMemory(headStart, dataEnd) -> value0
            {
                if slt(sub(dataEnd, headStart), 32) { revert(value0, value0) }
                let value := mload(headStart)
                if iszero(eq(value, iszero(iszero(value)))) { revert(value0, value0) }
                value0 := value
            }
            function abi_decode_bytes32(dataEnd) -> value0
            {
                if slt(add(dataEnd, not(3)), 32) { revert(value0, value0) }
                value0 := calldataload(4)
            }
            function abi_encode_address_address(headStart, value0, value1) -> tail
            {
                tail := add(headStart, 64)
                let _1 := sub(shl(160, 1), 1)
                mstore(headStart, and(value0, _1))
                mstore(add(headStart, 32), and(value1, _1))
            }
            function cleanup_from_storage_address(value) -> cleaned
            {
                cleaned := and(value, sub(shl(160, 1), 1))
            }
            function finalize_allocation(memPtr, size)
            {
                let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x41)
                    revert(0, 0x24)
                }
                mstore(64, newFreePtr)
            }
            function fun_changeName(var_newName)
            {
                if eq(caller(), and(sload(0x00), sub(shl(160, 1), 1))) { sstore(0x02, var_newName) }
            }
            function fun_transfer(var_newOwner)
            {
                let _1 := cleanup_from_storage_address(sload(0x01))
                if iszero(eq(caller(), and(_1, sub(shl(160, 1), 1)))) { leave }
                let expr_address := cleanup_from_storage_address(cleanup_from_storage_address(sload(0x00)))
                if iszero(extcodesize(expr_address)) { revert(0x00, 0x00) }
                let _2 := mload(64)
                mstore(_2, shl(224, 0xc3cee9c1))
                let _3 := staticcall(gas(), expr_address, _2, sub(abi_encode_address_address(add(_2, 4), _1, var_newOwner), _2), _2, 32)
                if iszero(_3) { revert_forward() }
                let expr := 0x00
                if _3
                {
                    finalize_allocation(_2, returndatasize())
                    expr := abi_decode_bool_fromMemory(_2, add(_2, returndatasize()))
                }
                if expr
                {
                    update_storage_value_offsett_address_to_address(var_newOwner)
                }
            }
            function revert_forward()
            {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }
            function update_storage_value_offsett_address_to_address(value)
            {
                sstore(0x01, or(and(sload(0x01), shl(160, 0xffffffffffffffffffffffff)), and(value, sub(shl(160, 1), 1))))
            }
        }
    }
}
