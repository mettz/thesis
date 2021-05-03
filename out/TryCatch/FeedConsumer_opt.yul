/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "FeedConsumer_81" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("FeedConsumer_81_deployed")
            codecopy(0, dataoffset("FeedConsumer_81_deployed"), _1)
            return(0, _1)
        }
    }
    object "FeedConsumer_81_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    if eq(0x0ba9d8ca, shr(224, calldataload(_1)))
                    {
                        if callvalue() { revert(_1, _1) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_1, _1) }
                        let value := calldataload(4)
                        if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(_1, _1) }
                        let ret, ret_1 := fun_rate(value)
                        let memPos := mload(64)
                        mstore(memPos, ret)
                        mstore(add(memPos, 32), iszero(iszero(ret_1)))
                        return(memPos, 64)
                    }
                }
                revert(0, 0)
            }
            function abi_decode_uint256_fromMemory(headStart, dataEnd) -> value0
            {
                if slt(sub(dataEnd, headStart), 32) { revert(value0, value0) }
                value0 := mload(headStart)
            }
            function abi_encode_address(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, and(value0, sub(shl(160, 1), 1)))
            }
            function cleanup_from_storage_contract_DataFeed(value) -> cleaned
            {
                cleaned := and(value, sub(shl(160, 1), 1))
            }
            function extract_returndata() -> data
            {
                switch returndatasize()
                case 0 { data := 96 }
                default {
                    let _1 := returndatasize()
                    if gt(_1, 0xffffffffffffffff) { panic_error_0x41() }
                    let memPtr := mload(64)
                    finalize_allocation(memPtr, add(and(add(_1, 31), not(31)), 0x20))
                    mstore(memPtr, _1)
                    data := memPtr
                    returndatacopy(add(memPtr, 0x20), 0, returndatasize())
                }
            }
            function finalize_allocation(memPtr, size)
            {
                let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }
            function fun_rate(var_token) -> var_value, var_success
            {
                var_value := var_success
                var_success := var_success
                let _1 := 0x01
                require_helper(lt(sload(_1), 0x0a))
                let _2 := 0
                let expr_address := cleanup_from_storage_contract_DataFeed(cleanup_from_storage_contract_DataFeed(sload(_2)))
                if iszero(extcodesize(expr_address)) { revert(_2, _2) }
                let _3 := mload(64)
                mstore(_3, shl(225, 0x1c133591))
                let trySuccessCondition := call(gas(), expr_address, _2, _3, sub(abi_encode_address(add(_3, 4), var_token), _3), _3, 32)
                let expr := _2
                if trySuccessCondition
                {
                    finalize_allocation(_3, returndatasize())
                    expr := abi_decode_uint256_fromMemory(_3, add(_3, returndatasize()))
                }
                switch iszero(trySuccessCondition)
                case 0 {
                    var_value := expr
                    var_success := _1
                    leave
                }
                default {
                    let _4 := _1
                    switch return_data_selector()
                    case 147028384 {
                        if try_decode_error_message()
                        {
                            _4 := _2
                            update_storage_value_offsett_uint256_to_uint256(increment_uint256(sload(_1)))
                            var_value := _2
                            var_success := _2
                            leave
                        }
                    }
                    case 1313373041 {
                        let _5, _6 := try_decode_panic_data()
                        if _5
                        {
                            _4 := _2
                            update_storage_value_offsett_uint256_to_uint256(increment_uint256(sload(_1)))
                            var_value := _2
                            var_success := _2
                            leave
                        }
                    }
                    if _4
                    {
                        pop(extract_returndata())
                        update_storage_value_offsett_uint256_to_uint256(increment_uint256(sload(_1)))
                        var_value := _2
                        var_success := _2
                        leave
                    }
                }
            }
            function increment_uint256(value) -> ret
            {
                if eq(value, not(0))
                {
                    mstore(ret, shl(224, 0x4e487b71))
                    mstore(4, 0x11)
                    revert(ret, 0x24)
                }
                ret := add(value, 1)
            }
            function panic_error_0x41()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            function require_helper(condition)
            {
                if iszero(condition) { revert(0, 0) }
            }
            function return_data_selector() -> sig
            {
                if gt(returndatasize(), 3)
                {
                    returndatacopy(sig, sig, 4)
                    sig := shr(224, mload(sig))
                }
            }
            function try_decode_error_message() -> ret
            {
                if lt(returndatasize(), 0x44) { leave }
                let data := mload(64)
                let _1 := not(3)
                returndatacopy(data, 4, add(returndatasize(), _1))
                let offset := mload(data)
                let _2 := returndatasize()
                let _3 := 0xffffffffffffffff
                if or(gt(offset, _3), gt(add(offset, 0x24), _2)) { leave }
                let msg := add(data, offset)
                let length := mload(msg)
                if gt(length, _3) { leave }
                if gt(add(add(msg, length), 0x20), add(add(data, returndatasize()), _1)) { leave }
                finalize_allocation(data, add(add(offset, length), 0x20))
                ret := msg
            }
            function try_decode_panic_data() -> success, data
            {
                if gt(returndatasize(), 0x23)
                {
                    returndatacopy(data, 4, 0x20)
                    success := 1
                    data := mload(data)
                }
            }
            function update_storage_value_offsett_uint256_to_uint256(value)
            { sstore(0x01, value) }
        }
    }
}
