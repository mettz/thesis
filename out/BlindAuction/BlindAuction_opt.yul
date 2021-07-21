/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "BlindAuction_390" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let programSize := datasize("BlindAuction_390")
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
            if slt(argSize, 96) { revert(0, 0) }
            let value0 := mload(128)
            let value1 := mload(160)
            let value := mload(192)
            if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(0, 0) }
            constructor_BlindAuction(value0, value1, value)
            let _1 := mload(64)
            let _2 := datasize("BlindAuction_390_deployed")
            codecopy(_1, dataoffset("BlindAuction_390_deployed"), _2)
            return(_1, _2)
        }
        function checked_add_uint256(x, y) -> sum
        {
            if gt(x, not(y))
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x11)
                revert(0, 0x24)
            }
            sum := add(x, y)
        }
        function constructor_BlindAuction(var_biddingTime, var_revealTime, var_beneficiary)
        {
            emit __cost2
            sstore(0x00, or(and(sload(0x00), not(sub(shl(160, 1), 1))), and(var_beneficiary, sub(shl(160, 1), 1))))
            let _1 := checked_add_uint256(timestamp(), var_biddingTime)
            sstore(0x01, _1)
            sstore(0x02, checked_add_uint256(_1, var_revealTime))
        }
    }
    object "BlindAuction_390_deployed" {
        code {
            {
                let _1 := 64
                mstore(_1, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _2 := 0
                    switch shr(224, calldataload(_2))
                    case 0x01495c1c {
                        if callvalue() { revert(_2, _2) }
                        let param, param_1 := abi_decode_addresst_uint256(calldatasize())
                        let ret, ret_1 := getter_fun_bids(param, param_1)
                        let memPos := mload(_1)
                        return(memPos, sub(abi_encode_bytes32_uint256(memPos, ret, ret_1), memPos))
                    }
                    case 0x12fa6feb {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret_2 := and(sload(3), 0xff)
                        let memPos_1 := mload(_1)
                        return(memPos_1, sub(abi_encode_bool(memPos_1, ret_2), memPos_1))
                    }
                    case 0x2a24f46c {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        modifier_onlyAfter()
                        return(mload(_1), _2)
                    }
                    case 0x38af3eed {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret_3 := and(sload(_2), sub(shl(160, 1), 1))
                        let memPos_2 := mload(_1)
                        return(memPos_2, sub(abi_encode_address(memPos_2, ret_3), memPos_2))
                    }
                    case 0x3ccfd60b {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        fun_withdraw()
                        return(mload(_1), _2)
                    }
                    case 0x423b217f {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret_4 := sload(1)
                        let memPos_3 := mload(_1)
                        return(memPos_3, sub(abi_encode_uint256(memPos_3, ret_4), memPos_3))
                    }
                    case 0x900f080a {
                        if callvalue() { revert(_2, _2) }
                        let param_2, param_3, param_4 := abi_decode_array_uint256_dynt_array_bool_dynt_array_bytes32_dyn(calldatasize())
                        modifier_onlyAfter_144(param_2, param_3, param_4)
                        return(mload(_1), _2)
                    }
                    case 0x91f90157 {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret_5 := and(sload(5), sub(shl(160, 1), 1))
                        let memPos_4 := mload(_1)
                        return(memPos_4, sub(abi_encode_address(memPos_4, ret_5), memPos_4))
                    }
                    case 0x957bb1e0 {
                        modifier_onlyBefore(abi_decode_bytes32(calldatasize()))
                        return(mload(_1), _2)
                    }
                    case 0xa6e66477 {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret_6 := sload(2)
                        let memPos_5 := mload(_1)
                        return(memPos_5, sub(abi_encode_uint256(memPos_5, ret_6), memPos_5))
                    }
                    case 0xd57bde79 {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret_7 := sload(6)
                        let memPos_6 := mload(_1)
                        return(memPos_6, sub(abi_encode_uint256(memPos_6, ret_7), memPos_6))
                    }
                }
                revert(0, 0)
            }
            function abi_decode_array_bool_dyn(offset, end) -> array
            {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let _1 := calldataload(offset)
                let _2 := 0x20
                let _3 := array_allocation_size_array_bool_dyn(_1)
                let memPtr := mload(64)
                finalize_allocation(memPtr, _3)
                let dst := memPtr
                mstore(memPtr, _1)
                dst := add(memPtr, _2)
                let src := add(offset, _2)
                if gt(add(add(offset, shl(5, _1)), _2), end) { revert(0, 0) }
                let i := 0
                let i_1 := i
                for { } lt(i_1, _1) { i_1 := add(i_1, 1) }
                {
                    let value := calldataload(src)
                    if iszero(eq(value, iszero(iszero(value)))) { revert(i, i) }
                    mstore(dst, value)
                    dst := add(dst, _2)
                    src := add(src, _2)
                }
                array := memPtr
            }
            function abi_decode_array_bytes32_dyn(offset, end) -> array
            {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let _1 := calldataload(offset)
                let _2 := 0x20
                let _3 := array_allocation_size_array_bool_dyn(_1)
                let memPtr := mload(64)
                finalize_allocation(memPtr, _3)
                let dst := memPtr
                mstore(memPtr, _1)
                dst := add(memPtr, _2)
                let src := add(offset, _2)
                if gt(add(add(offset, shl(5, _1)), _2), end) { revert(0, 0) }
                let i := 0
                for { } lt(i, _1) { i := add(i, 1) }
                {
                    mstore(dst, calldataload(src))
                    dst := add(dst, _2)
                    src := add(src, _2)
                }
                array := memPtr
            }
            function abi_decode(dataEnd)
            {
                if slt(add(dataEnd, not(3)), 0) { revert(0, 0) }
            }
            function abi_decode_addresst_uint256(dataEnd) -> value0, value1
            {
                if slt(add(dataEnd, not(3)), 64) { revert(0, 0) }
                let value := calldataload(4)
                if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(0, 0) }
                value0 := value
                value1 := calldataload(36)
            }
            function abi_decode_array_uint256_dynt_array_bool_dynt_array_bytes32_dyn(dataEnd) -> value0, value1, value2
            {
                if slt(add(dataEnd, not(3)), 96) { revert(0, 0) }
                let offset := calldataload(4)
                let _1 := 0xffffffffffffffff
                if gt(offset, _1) { revert(0, 0) }
                if iszero(slt(add(offset, 35), dataEnd)) { revert(0, 0) }
                let _2 := calldataload(add(4, offset))
                let _3 := array_allocation_size_array_bool_dyn(_2)
                let memPtr := mload(64)
                finalize_allocation(memPtr, _3)
                let dst := memPtr
                mstore(memPtr, _2)
                let _4 := 0x20
                dst := add(memPtr, _4)
                let src := add(offset, 36)
                if gt(add(add(offset, shl(5, _2)), 36), dataEnd) { revert(0, 0) }
                let i := 0
                for { } lt(i, _2) { i := add(i, 1) }
                {
                    mstore(dst, calldataload(src))
                    dst := add(dst, _4)
                    src := add(src, _4)
                }
                value0 := memPtr
                let offset_1 := calldataload(36)
                if gt(offset_1, _1) { revert(0, 0) }
                value1 := abi_decode_array_bool_dyn(add(4, offset_1), dataEnd)
                let offset_2 := calldataload(68)
                if gt(offset_2, _1) { revert(0, 0) }
                value2 := abi_decode_array_bytes32_dyn(add(4, offset_2), dataEnd)
            }
            function abi_decode_bytes32(dataEnd) -> value0
            {
                if slt(add(dataEnd, not(3)), 32) { revert(0, 0) }
                value0 := calldataload(4)
            }
            function abi_encode_packed_uint256_bool_bytes32(pos, value0, value1, value2) -> end
            {
                mstore(pos, value0)
                mstore(add(pos, 32), shl(248, iszero(iszero(value1))))
                mstore(add(pos, 33), value2)
                end := add(pos, 65)
            }
            function abi_encode_address(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, and(value0, sub(shl(160, 1), 1)))
            }
            function abi_encode_bool(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, iszero(iszero(value0)))
            }
            function abi_encode_bytes32_uint256(headStart, value0, value1) -> tail
            {
                tail := add(headStart, 64)
                mstore(headStart, value0)
                mstore(add(headStart, 32), value1)
            }
            function abi_encode_uint256(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, value0)
            }
            function array_allocation_size_array_bool_dyn(length) -> size
            {
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }
                size := add(shl(5, length), 0x20)
            }
            function checked_add_uint256(x, y) -> sum
            {
                if gt(x, not(y)) { panic_error_0x11() }
                sum := add(x, y)
            }
            function checked_sub_uint256(x, y) -> diff
            {
                if lt(x, y) { panic_error_0x11() }
                diff := sub(x, y)
            }
            function cleanup_from_storage_address(value) -> cleaned
            {
                cleaned := and(value, sub(shl(160, 1), 1))
            }
            function finalize_allocation_4277(memPtr)
            {
                let newFreePtr := add(memPtr, 0x40)
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(0x40, newFreePtr)
            }
            function finalize_allocation(memPtr, size)
            {
                let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }
            function fun_placeBid(var_bidder, var_value) -> var_success
            {
                emit __cost11
                let _1 := sload(0x06)
                if iszero(gt(var_value, _1))
                {
                    emit __cost12
                    var_success := 0
                    leave
                }
                let _2 := sub(shl(160, 1), 1)
                let cleaned := and(sload(0x05), _2)
                if iszero(iszero(cleaned))
                {
                    emit __cost13
                    mstore(0, cleaned)
                    mstore(0x20, 0x07)
                    let dataSlot := keccak256(0, 0x40)
                    sstore(dataSlot, checked_add_uint256(sload(dataSlot), _1))
                }
                sstore(0x06, var_value)
                sstore(0x05, or(and(sload(0x05), shl(160, 0xffffffffffffffffffffffff)), and(var_bidder, _2)))
                var_success := 0x01
            }
            function fun_withdraw()
            {
                emit __cost8
                let _1 := 0
                mstore(_1, caller())
                mstore(0x20, 0x07)
                let _2 := sload(keccak256(_1, 0x40))
                let _3 := iszero(_2)
                if iszero(_3)
                {
                    emit __cost9
                    mstore(_1, caller())
                    mstore(0x20, 0x07)
                    sstore(keccak256(_1, 0x40), _1)
                    let _4 := _1
                    if _3 { _4 := 2300 }
                    if iszero(call(_4, caller(), _2, _1, _1, _1, _1)) { revert_forward() }
                }
            }
            function getter_fun_bids(key, key_1) -> ret, ret_1
            {
                mstore(0, and(key, sub(shl(160, 1), 1)))
                mstore(0x20, 4)
                let dataSlot := keccak256(0, 0x40)
                if iszero(lt(key_1, sload(dataSlot))) { revert(0, 0) }
                let slot, offset := storage_array_index_access_struct_Bid__dyn(dataSlot, key_1)
                ret := sload(slot)
                ret_1 := sload(add(slot, 1))
            }
            function increment_uint256(value) -> ret
            {
                if eq(value, not(0)) { panic_error_0x11() }
                ret := add(value, 1)
            }
            function mapping_index_access_mapping_address_array_struct_Bid_storage_dyn_of_address(key) -> dataSlot
            {
                mstore(0, and(key, sub(shl(160, 1), 1)))
                mstore(0x20, 0x04)
                dataSlot := keccak256(0, 0x40)
            }
            function memory_array_index_access_bool_dyn(baseRef, index) -> addr
            {
                if iszero(lt(index, mload(baseRef))) { panic_error_0x32() }
                addr := add(add(baseRef, shl(5, index)), 32)
            }
            function modifier_onlyAfter_144(var_values_mpos, var_fake_mpos, var_secret_mpos)
            {
                let _1 := 0x01
                let _2 := sload(_1)
                emit __cost1
                if iszero(gt(timestamp(), _2))
                {
                    let _3 := mload(64)
                    mstore(_3, shl(226, 0x0a8d68c9))
                    mstore(add(_3, 4), _2)
                    revert(_3, 36)
                }
                let _4 := sload(0x02)
                emit __cost0
                if iszero(lt(timestamp(), _4))
                {
                    let _5 := mload(64)
                    mstore(_5, shl(225, 0x348f2b41))
                    mstore(add(_5, 4), _4)
                    revert(_5, 36)
                }
                emit __cost4
                let length := sload(mapping_index_access_mapping_address_array_struct_Bid_storage_dyn_of_address(caller()))
                require_helper(eq(mload(var_values_mpos), length))
                require_helper(eq(mload(var_fake_mpos), length))
                require_helper(eq(mload(var_secret_mpos), length))
                let var_refund := 0
                let var_i := var_refund
                for { }
                lt(var_i, length)
                {
                    var_i := increment_uint256(var_i)
                }
                {
                    emit __cost5
                    let _6, _7 := storage_array_index_access_struct_Bid__dyn(mapping_index_access_mapping_address_array_struct_Bid_storage_dyn_of_address(caller()), var_i)
                    let _8 := mload(memory_array_index_access_bool_dyn(var_values_mpos, var_i))
                    let _9 := read_from_memoryt_bool(memory_array_index_access_bool_dyn(var_fake_mpos, var_i))
                    let _10 := mload(memory_array_index_access_bool_dyn(var_secret_mpos, var_i))
                    let _11 := sload(_6)
                    let expr_mpos := mload(64)
                    let _12 := add(expr_mpos, 0x20)
                    let _13 := sub(abi_encode_packed_uint256_bool_bytes32(_12, _8, _9, _10), expr_mpos)
                    mstore(expr_mpos, add(_13, not(31)))
                    finalize_allocation(expr_mpos, _13)
                    if iszero(eq(_11, keccak256(_12, mload(expr_mpos))))
                    {
                        emit __cost6
                        continue
                    }
                    let _14 := sload(add(_6, _1))
                    var_refund := checked_add_uint256(var_refund, _14)
                    let expr := iszero(_9)
                    if expr { expr := iszero(lt(_14, _8)) }
                    if expr
                    {
                        emit __cost7
                        if fun_placeBid(caller(), _8)
                        {
                            var_refund := checked_sub_uint256(var_refund, _8)
                        }
                    }
                    sstore(_6, 0)
                }
                let _15 := 0
                if iszero(var_refund) { _15 := 2300 }
                if iszero(call(_15, caller(), var_refund, 0, 0, 0, 0)) { revert_forward() }
            }
            function modifier_onlyAfter()
            {
                let _1 := sload(0x02)
                emit __cost1
                if iszero(gt(timestamp(), _1))
                {
                    let _2 := mload(64)
                    mstore(_2, shl(226, 0x0a8d68c9))
                    mstore(add(_2, 4), _1)
                    revert(_2, 36)
                }
                emit __cost10
                if and(sload(0x03), 0xff)
                {
                    let _3 := mload(64)
                    mstore(_3, shl(227, 0x0c39fb9f))
                    revert(_3, 4)
                }
                let cleaned := and(sload(0x05), sub(shl(160, 1), 1))
                let _4 := sload(0x06)
                let _5 := mload(64)
                mstore(_5, cleaned)
                mstore(add(_5, 32), _4)
                log1(_5, 64, 0xdaec4582d5d9595688c8c98545fdd1c696d41c6aeaeb636737e84ed2f5c00eda)
                update_storage_value_offsett_bool_to_bool()
                let _6 := 0
                let converted := cleanup_from_storage_address(cleanup_from_storage_address(sload(_6)))
                let _7 := sload(0x06)
                let _8 := _6
                if iszero(_7) { _8 := 2300 }
                if iszero(call(_8, converted, _7, _6, _6, _6, _6)) { revert_forward() }
            }
            function modifier_onlyBefore(var_blindedBid)
            {
                let _1 := sload(0x01)
                emit __cost0
                if iszero(lt(timestamp(), _1))
                {
                    let _2 := mload(64)
                    mstore(_2, shl(225, 0x348f2b41))
                    mstore(add(_2, 4), _1)
                    revert(_2, 36)
                }
                emit __cost3
                mstore(0, caller())
                mstore(0x20, 0x04)
                let dataSlot := keccak256(0, 0x40)
                let memPtr := mload(0x40)
                finalize_allocation_4277(memPtr)
                mstore(memPtr, var_blindedBid)
                let _3 := add(memPtr, 0x20)
                mstore(_3, callvalue())
                let oldLen := sload(dataSlot)
                if iszero(lt(oldLen, 18446744073709551616)) { panic_error_0x41() }
                sstore(dataSlot, add(oldLen, 0x01))
                let slot, offset := storage_array_index_access_struct_Bid__dyn(dataSlot, oldLen)
                if offset
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(0x04, 0)
                    revert(0, 0x24)
                }
                sstore(slot, mload(memPtr))
                sstore(add(slot, 0x01), mload(_3))
            }
            function panic_error_0x11()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x11)
                revert(0, 0x24)
            }
            function panic_error_0x32()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x32)
                revert(0, 0x24)
            }
            function panic_error_0x41()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            function read_from_memoryt_bool(ptr) -> returnValue
            {
                returnValue := iszero(iszero(mload(ptr)))
            }
            function require_helper(condition)
            {
                if iszero(condition) { revert(0, 0) }
            }
            function revert_forward()
            {
                let pos := mload(64)
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
            }
            function storage_array_index_access_struct_Bid__dyn(array, index) -> slot, offset
            {
                if iszero(lt(index, sload(array))) { panic_error_0x32() }
                mstore(0, array)
                let data := keccak256(0, 0x20)
                slot := add(data, shl(1, index))
                offset := 0
            }
            function update_storage_value_offsett_bool_to_bool()
            {
                sstore(0x03, or(and(sload(0x03), not(255)), 0x01))
            }
        }
    }
}
