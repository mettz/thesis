/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "FeedConsumer_81" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_FeedConsumer_81()

        codecopy(0, dataoffset("FeedConsumer_81_deployed"), datasize("FeedConsumer_81_deployed"))

        return(0, datasize("FeedConsumer_81_deployed"))

        function constructor_FeedConsumer_81() {

        }

    }
    object "FeedConsumer_81_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0ba9d8ca
                {
                    // rate(address)

                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0, ret_1 :=  fun_rate_80(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256_t_bool__to_t_uint256_t_bool__fromStack(memPos , ret_0, ret_1)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            function abi_decode_t_uint256_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_uint256_t_bool__to_t_uint256_t_bool__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                abi_encode_t_bool_to_t_bool_fromStack(value1,  add(headStart, 32))

            }

            function allocate_memory(size) -> memPtr {
                memPtr := allocate_unbounded()
                finalize_allocation(memPtr, size)
            }

            function allocate_memory_array_t_bytes_memory_ptr(length) -> memPtr {
                let allocSize := array_allocation_size_t_bytes_memory_ptr(length)
                memPtr := allocate_memory(allocSize)

                mstore(memPtr, length)

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function array_allocation_size_t_bytes_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := round_up_to_mul_of_32(length)

                // add length slot
                size := add(size, 0x20)

            }

            function cleanup_from_storage_t_contract$_DataFeed_$9(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_contract$_DataFeed_$9_to_t_address(value) -> converted {
                converted := convert_t_contract$_DataFeed_$9_to_t_uint160(value)
            }

            function convert_t_contract$_DataFeed_$9_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_10_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function extract_from_storage_value_offset_0t_contract$_DataFeed_$9(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_DataFeed_$9(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function extract_returndata() -> data {

                switch returndatasize()
                case 0 {
                    data := zero_value_for_split_t_bytes_memory_ptr()
                }
                default {
                    data := allocate_memory_array_t_bytes_memory_ptr(returndatasize())
                    returndatacopy(add(data, 0x20), 0, returndatasize())
                }

            }

            function finalize_allocation(memPtr, size) {
                let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }

            function fun_rate_80(var_token_16) -> var_value_19, var_success_21 {
                let zero_t_uint256_1 := zero_value_for_split_t_uint256()
                var_value_19 := zero_t_uint256_1
                let zero_t_bool_2 := zero_value_for_split_t_bool()
                var_success_21 := zero_t_bool_2

                let _3 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_24 := _3
                let expr_25 := 0x0a
                let expr_26 := lt(cleanup_t_uint256(expr_24), convert_t_rational_10_by_1_to_t_uint256(expr_25))
                require_helper(expr_26)
                let _4_address := read_from_storage_split_offset_0_t_contract$_DataFeed_$9(0x00)
                let expr_29_address := _4_address
                let expr_30_address := convert_t_contract$_DataFeed_$9_to_t_address(expr_29_address)
                let expr_30_functionSelector := 0x38266b22
                let _5 := var_token_16
                let expr_31 := _5

                if iszero(extcodesize(expr_30_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _6 := allocate_unbounded()
                mstore(_6, shift_left_224(expr_30_functionSelector))
                let _7 := abi_encode_tuple_t_address__to_t_address__fromStack(add(_6, 4) , expr_31)

                let trySuccessCondition_32 := call(gas(), expr_30_address,  0,  _6, sub(_7, _6), _6, 32)

                let expr_32
                if trySuccessCondition_32 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_6, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_32 :=  abi_decode_tuple_t_uint256_fromMemory(_6, add(_6, returndatasize()))
                }
                switch iszero(trySuccessCondition_32)
                case 0 { // success case
                    let var_v_34 := expr_32
                    let _8 := var_v_34
                    let expr_36 := _8
                    let expr_38_component_1 := expr_36
                    let expr_37 := 0x01
                    let expr_38_component_2 := expr_37
                    var_value_19 := expr_38_component_1
                    var_success_21 := expr_38_component_2
                    leave
                }
                default { // failure case
                    let _9 := 1
                    switch return_data_selector()
                    case 147028384 {
                        let _10 := try_decode_error_message()
                        if _10 {
                            _9 := 0
                            let var__43_mpos := _10
                            let _12 := read_from_storage_split_offset_0_t_uint256(0x01)
                            let _11 := increment_t_uint256(_12)
                            update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _11)
                            let expr_46 := _12
                            let expr_48 := 0x00
                            let expr_50_component_1 := expr_48
                            let expr_49 := 0x00
                            let expr_50_component_2 := expr_49
                            var_value_19 := convert_t_rational_0_by_1_to_t_uint256(expr_50_component_1)
                            var_success_21 := expr_50_component_2
                            leave
                        }
                    }
                    case 1313373041 {
                        let _13, _14 := try_decode_panic_data()
                        if _13 {
                            _9 := 0
                            let var__55 := _14
                            let _16 := read_from_storage_split_offset_0_t_uint256(0x01)
                            let _15 := increment_t_uint256(_16)
                            update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _15)
                            let expr_58 := _16
                            let expr_60 := 0x00
                            let expr_62_component_1 := expr_60
                            let expr_61 := 0x00
                            let expr_62_component_2 := expr_61
                            var_value_19 := convert_t_rational_0_by_1_to_t_uint256(expr_62_component_1)
                            var_success_21 := expr_62_component_2
                            leave
                        }
                    }
                    if _9 {
                        let var__67_mpos := extract_returndata()
                        let _18 := read_from_storage_split_offset_0_t_uint256(0x01)
                        let _17 := increment_t_uint256(_18)
                        update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _17)
                        let expr_70 := _18
                        let expr_72 := 0x00
                        let expr_74_component_1 := expr_72
                        let expr_73 := 0x00
                        let expr_74_component_2 := expr_73
                        var_value_19 := convert_t_rational_0_by_1_to_t_uint256(expr_74_component_1)
                        var_success_21 := expr_74_component_2
                        leave
                    }
                }

            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if eq(value, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) { panic_error_0x11() }
                ret := add(value, 1)
            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function panic_error_0x41() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_offset_0_t_contract$_DataFeed_$9(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_DataFeed_$9(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function return_data_selector() -> sig {
                if gt(returndatasize(), 3) {
                    returndatacopy(0, 0, 4)
                    sig := shift_right_224_unsigned(mload(0))
                }
            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function shift_left_224(value) -> newValue {
                newValue :=

                shl(224, value)

            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function try_decode_error_message() -> ret {
                if lt(returndatasize(), 0x44) { leave }

                let data := allocate_unbounded()
                returndatacopy(data, 4, sub(returndatasize(), 4))

                let offset := mload(data)
                if or(
                    gt(offset, 0xffffffffffffffff),
                    gt(add(offset, 0x24), returndatasize())
                    ) {
                    leave
                }

                let msg := add(data, offset)
                let length := mload(msg)
                if gt(length, 0xffffffffffffffff) { leave }

                let end := add(add(msg, 0x20), length)
                if gt(end, add(data, sub(returndatasize(), 4))) { leave }

                finalize_allocation(data, add(offset, add(0x20, length)))
                ret := msg
            }

            function try_decode_panic_data() -> success, data {
                if gt(returndatasize(), 0x23) {
                    returndatacopy(0, 4, 0x20)
                    success := 1
                    data := mload(0)
                }
            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

