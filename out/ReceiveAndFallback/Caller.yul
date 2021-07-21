/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Caller_155" {
    code {
        mstore(64, 128)
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_Caller_155()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("Caller_155_deployed"), datasize("Caller_155_deployed"))

        return(_1, datasize("Caller_155_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function constructor_Caller_155() {

        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

    }
    object "Caller_155_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x32eb12f1
                {
                    // callTest(address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_contract$_Test_$13(4, calldatasize())
                    let ret_0 :=  fun_callTest_88(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x979709e5
                {
                    // callTestPayable(address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_contract$_TestPayable_$46(4, calldatasize())
                    let ret_0 :=  fun_callTestPayable_154(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()

            function abi_decode_t_contract$_TestPayable_$46(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_contract$_TestPayable_$46(value)
            }

            function abi_decode_t_contract$_Test_$13(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_contract$_Test_$13(value)
            }

            function abi_decode_tuple_t_contract$_TestPayable_$46(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_contract$_TestPayable_$46(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_contract$_Test_$13(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_contract$_Test_$13(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, 0)
                store_literal_in_memory_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470(pos)
                end := add(pos, 0)
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_packed_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(pos ) -> end {

                pos := abi_encode_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack( pos)

                end := pos
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

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

            function array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
                updated_pos := pos
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_address_payable(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function cleanup_t_contract$_TestPayable_$46(value) -> cleaned {
                cleaned := cleanup_t_address_payable(value)
            }

            function cleanup_t_contract$_Test_$13(value) -> cleaned {
                cleaned := cleanup_t_address(value)
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_address_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_address_payable(value)
            }

            function convert_t_contract$_TestPayable_$46_to_t_address(value) -> converted {
                converted := convert_t_contract$_TestPayable_$46_to_t_uint160(value)
            }

            function convert_t_contract$_TestPayable_$46_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_contract$_Test_$13_to_t_address(value) -> converted {
                converted := convert_t_contract$_Test_$13_to_t_uint160(value)
            }

            function convert_t_contract$_Test_$13_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_2000000000000000000_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
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

            function fun_callTestPayable_154(var_test_91_address) -> var__94 {
                let zero_t_bool_11 := zero_value_for_split_t_bool()
                var__94 := zero_t_bool_11

                emit __cost4
                let _12_address := var_test_91_address
                let expr_101_address := _12_address
                let expr_102 := convert_t_contract$_TestPayable_$46_to_t_address(expr_101_address)
                let expr_103_address := expr_102

                let expr_107_mpos := allocate_unbounded()
                let _13 := add(expr_107_mpos, 0x20)

                mstore(_13, 0xf85396d700000000000000000000000000000000000000000000000000000000)
                _13 := add(_13, 4)

                let _14 := abi_encode_tuple__to__fromStack(_13)
                mstore(expr_107_mpos, sub(_14, add(expr_107_mpos, 0x20)))
                finalize_allocation(expr_107_mpos, sub(_14, expr_107_mpos))

                let _15 := add(expr_107_mpos, 0x20)
                let _16 := mload(expr_107_mpos)

                let expr_108_component_1 := call(gas(), expr_103_address,  0,  _15, _16, 0, 0)
                let expr_108_component_2_mpos := extract_returndata()
                let var_success_98 := expr_108_component_1
                let _17 := var_success_98
                let expr_111 := _17
                require_helper(expr_111)
                let _18_address := var_test_91_address
                let expr_118_address := _18_address
                let expr_119 := convert_t_contract$_TestPayable_$46_to_t_address(expr_118_address)
                let expr_120_address := expr_119
                let expr_121 := 0x01
                let expr_122_address := expr_120_address
                let expr_122_value := convert_t_rational_1_by_1_to_t_uint256(expr_121)

                let expr_126_mpos := allocate_unbounded()
                let _19 := add(expr_126_mpos, 0x20)

                mstore(_19, 0xf85396d700000000000000000000000000000000000000000000000000000000)
                _19 := add(_19, 4)

                let _20 := abi_encode_tuple__to__fromStack(_19)
                mstore(expr_126_mpos, sub(_20, add(expr_126_mpos, 0x20)))
                finalize_allocation(expr_126_mpos, sub(_20, expr_126_mpos))

                let _21 := add(expr_126_mpos, 0x20)
                let _22 := mload(expr_126_mpos)

                let expr_127_component_1 := call(gas(), expr_122_address,  expr_122_value,  _21, _22, 0, 0)
                let expr_127_component_2_mpos := extract_returndata()
                var_success_98 := expr_127_component_1
                let _23 := var_success_98
                let expr_131 := _23
                require_helper(expr_131)
                let _24_address := var_test_91_address
                let expr_138_address := _24_address
                let expr_139 := convert_t_contract$_TestPayable_$46_to_t_address(expr_138_address)
                let expr_140_address := expr_139
                let expr_141 := 0x1bc16d674ec80000
                let expr_142_address := expr_140_address
                let expr_142_value := convert_t_rational_2000000000000000000_by_1_to_t_uint256(expr_141)

                let _25 := allocate_unbounded()
                let _26 := sub(abi_encode_tuple_packed_t_stringliteral_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack(_25  ), _25)

                let expr_144_component_1 := call(gas(), expr_142_address,  expr_142_value,  _25, _26, 0, 0)
                let expr_144_component_2_mpos := extract_returndata()
                var_success_98 := expr_144_component_1
                let _27 := var_success_98
                let expr_148 := _27
                require_helper(expr_148)
                let expr_151 := 0x01
                var__94 := expr_151
                leave

            }

            function fun_callTest_88(var_test_49_address) -> var__52 {
                let zero_t_bool_1 := zero_value_for_split_t_bool()
                var__52 := zero_t_bool_1

                emit __cost3
                let _2_address := var_test_49_address
                let expr_59_address := _2_address
                let expr_60 := convert_t_contract$_Test_$13_to_t_address(expr_59_address)
                let expr_61_address := expr_60

                let expr_65_mpos := allocate_unbounded()
                let _3 := add(expr_65_mpos, 0x20)

                mstore(_3, 0xf85396d700000000000000000000000000000000000000000000000000000000)
                _3 := add(_3, 4)

                let _4 := abi_encode_tuple__to__fromStack(_3)
                mstore(expr_65_mpos, sub(_4, add(expr_65_mpos, 0x20)))
                finalize_allocation(expr_65_mpos, sub(_4, expr_65_mpos))

                let _5 := add(expr_65_mpos, 0x20)
                let _6 := mload(expr_65_mpos)

                let expr_66_component_1 := call(gas(), expr_61_address,  0,  _5, _6, 0, 0)
                let expr_66_component_2_mpos := extract_returndata()
                let var_success_56 := expr_66_component_1
                let _7 := var_success_56
                let expr_69 := _7
                require_helper(expr_69)
                let _8_address := var_test_49_address
                let expr_78_address := _8_address
                let expr_79 := convert_t_contract$_Test_$13_to_t_address(expr_78_address)
                let expr_80 := convert_t_address_to_t_address_payable(expr_79)
                let var_testPayable_73 := expr_80
                let _9 := var_testPayable_73
                let expr_82 := _9
                let expr_83_address := convert_t_address_payable_to_t_address(expr_82)
                let expr_84 := 0x1bc16d674ec80000

                let _10 := 0
                if iszero(convert_t_rational_2000000000000000000_by_1_to_t_uint256(expr_84)) { _10 := 2300 }
                let expr_85 := call(_10, expr_83_address, convert_t_rational_2000000000000000000_by_1_to_t_uint256(expr_84), 0, 0, 0, 0)

                var__52 := expr_85
                leave

            }

            function panic_error_0x41() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
                revert(0, 0)
            }

            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
                revert(0, 0)
            }

            function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
                revert(0, 0)
            }

            function revert_forward_1() {
                let pos := allocate_unbounded()
                returndatacopy(pos, 0, returndatasize())
                revert(pos, returndatasize())
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function store_literal_in_memory_c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470(memPtr) {

            }

            function validator_revert_t_contract$_TestPayable_$46(value) {
                if iszero(eq(value, cleanup_t_contract$_TestPayable_$46(value))) { revert(0, 0) }
            }

            function validator_revert_t_contract$_Test_$13(value) {
                if iszero(eq(value, cleanup_t_contract$_Test_$13(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_bytes_memory_ptr() -> ret {
                ret := 96
            }

        }

    }

}

