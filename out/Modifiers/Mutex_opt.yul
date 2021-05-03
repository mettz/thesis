/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "Mutex_145" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("Mutex_145_deployed")
            codecopy(0, dataoffset("Mutex_145_deployed"), _1)
            return(0, _1)
        }
    }
    object "Mutex_145_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    if eq(0x26121ff0, shr(224, calldataload(_1)))
                    {
                        if callvalue() { revert(_1, _1) }
                        if slt(add(calldatasize(), not(3)), _1) { revert(_1, _1) }
                        let _2 := sload(_1)
                        if iszero(iszero(and(_2, 0xff)))
                        {
                            mstore(128, shl(229, 4594637))
                            mstore(132, 32)
                            mstore(164, 15)
                            mstore(196, "Reentrant call.")
                            revert(128, 100)
                        }
                        sstore(_1, or(and(_2, not(255)), 0x01))
                        let _3 := fun_f_inner()
                        update_storage_value_offsett_bool_to_bool()
                        let memPos := mload(64)
                        return(memPos, sub(abi_encode_uint256(memPos, _3), memPos))
                    }
                }
                revert(0, 0)
            }
            function abi_encode_uint256(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, value0)
            }
            function fun_f_inner() -> var
            {
                let expr_component := call(gas(), caller(), var, mload(64), var, var, var)
                switch returndatasize()
                case 0 { }
                default {
                    let _1 := returndatasize()
                    let _2 := 0xffffffffffffffff
                    if gt(_1, _2) { panic_error_0x41() }
                    let _3 := not(31)
                    let memPtr := mload(64)
                    let newFreePtr := add(memPtr, and(add(and(add(_1, 31), _3), 63), _3))
                    if or(gt(newFreePtr, _2), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                    mstore(64, newFreePtr)
                    mstore(memPtr, _1)
                    returndatacopy(add(memPtr, 0x20), var, returndatasize())
                }
                if iszero(expr_component) { revert(var, var) }
                var := 0x07
            }
            function panic_error_0x41()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            function update_storage_value_offsett_bool_to_bool()
            {
                sstore(0, and(sload(0), not(255)))
            }
        }
    }
}
