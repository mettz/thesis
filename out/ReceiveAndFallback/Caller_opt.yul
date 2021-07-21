/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "Caller_155" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("Caller_155_deployed")
            codecopy(128, dataoffset("Caller_155_deployed"), _1)
            return(128, _1)
        }
    }
    object "Caller_155_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    switch shr(224, calldataload(_1))
                    case 0x32eb12f1 {
                        if callvalue() { revert(_1, _1) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_1, _1) }
                        let value := calldataload(4)
                        validator_revert_contract_TestPayable(value)
                        let ret := fun_callTest(value)
                        let memPos := mload(64)
                        return(memPos, sub(abi_encode_bool(memPos, ret), memPos))
                    }
                    case 0x979709e5 {
                        if callvalue() { revert(_1, _1) }
                        let ret_1 := fun_callTestPayable(abi_decode_contract_TestPayable(calldatasize()))
                        let memPos_1 := mload(64)
                        return(memPos_1, sub(abi_encode_bool(memPos_1, ret_1), memPos_1))
                    }
                }
                revert(0, 0)
            }
            function abi_decode_contract_TestPayable(dataEnd) -> value0
            {
                if slt(add(dataEnd, not(3)), 32) { revert(0, 0) }
                let value := calldataload(4)
                validator_revert_contract_TestPayable(value)
                value0 := value
            }
            function abi_encode_bool(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, iszero(iszero(value0)))
            }
            function extract_returndata() -> data
            {
                switch returndatasize()
                case 0 { data := 96 }
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
                    data := memPtr
                    returndatacopy(add(memPtr, 0x20), 0, returndatasize())
                }
            }
            function finalize_allocation(memPtr)
            {
                let newFreePtr := add(memPtr, 64)
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }
            function fun_callTestPayable(var_test_91_address) -> var
            {
                emit __cost4
                let expr := and(var_test_91_address, sub(shl(160, 1), 1))
                let expr_107_mpos := mload(64)
                let _1 := add(expr_107_mpos, 0x20)
                let _2 := shl(224, 0xf85396d7)
                mstore(_1, _2)
                mstore(expr_107_mpos, 4)
                finalize_allocation(expr_107_mpos)
                let _3 := 0
                let expr_108_component := call(gas(), expr, _3, _1, mload(expr_107_mpos), _3, _3)
                pop(extract_returndata())
                if iszero(expr_108_component) { revert(_3, _3) }
                let expr_mpos := mload(64)
                let _4 := add(expr_mpos, 0x20)
                mstore(_4, _2)
                mstore(expr_mpos, 4)
                finalize_allocation(expr_mpos)
                let expr_component := call(gas(), expr, 0x01, _4, mload(expr_mpos), _3, _3)
                pop(extract_returndata())
                if iszero(expr_component) { revert(_3, _3) }
                let expr_144_component := call(gas(), expr, 0x1bc16d674ec80000, mload(64), _3, _3, _3)
                pop(extract_returndata())
                if iszero(expr_144_component) { revert(_3, _3) }
                var := 0x01
            }
            function fun_callTest(var_test_address) -> var_
            {
                emit __cost3
                let expr := and(var_test_address, sub(shl(160, 1), 1))
                let expr_65_mpos := mload(64)
                let _1 := add(expr_65_mpos, 0x20)
                mstore(_1, shl(224, 0xf85396d7))
                mstore(expr_65_mpos, 4)
                finalize_allocation(expr_65_mpos)
                let _2 := 0
                let expr_component := call(gas(), expr, _2, _1, mload(expr_65_mpos), _2, _2)
                pop(extract_returndata())
                if iszero(expr_component) { revert(_2, _2) }
                var_ := call(_2, expr, 0x1bc16d674ec80000, _2, _2, _2, _2)
            }
            function panic_error_0x41()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            function validator_revert_contract_TestPayable(value)
            {
                if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(0, 0) }
            }
        }
    }
}
