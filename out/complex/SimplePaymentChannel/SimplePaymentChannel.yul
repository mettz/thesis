/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "SimplePaymentChannel_207" {
    code {
        mstore(64, 128)

        let _1, _2 := copy_arguments_for_constructor_34_object_SimplePaymentChannel_207()
        constructor_SimplePaymentChannel_207(_1, _2)

        codecopy(0, dataoffset("SimplePaymentChannel_207_deployed"), datasize("SimplePaymentChannel_207_deployed"))

        return(0, datasize("SimplePaymentChannel_207_deployed"))

        function abi_decode_t_address_payable_fromMemory(offset, end) -> value {
            value := mload(offset)
            validator_revert_t_address_payable(value)
        }

        function abi_decode_t_uint256_fromMemory(offset, end) -> value {
            value := mload(offset)
            validator_revert_t_uint256(value)
        }

        function abi_decode_tuple_t_address_payablet_uint256_fromMemory(headStart, dataEnd) -> value0, value1 {
            if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

            {

                let offset := 0

                value0 := abi_decode_t_address_payable_fromMemory(add(headStart, offset), dataEnd)
            }

            {

                let offset := 32

                value1 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
            }

        }

        function allocate_memory(size) -> memPtr {
            memPtr := allocate_unbounded()
            finalize_allocation(memPtr, size)
        }

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function checked_add_t_uint256(x, y) -> sum {
            x := cleanup_t_uint256(x)
            y := cleanup_t_uint256(y)

            // overflow, if x > (maxValue - y)
            if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }

            sum := add(x, y)
        }

        function cleanup_t_address_payable(value) -> cleaned {
            cleaned := cleanup_t_uint160(value)
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_SimplePaymentChannel_207(var__recipient_9, var_duration_11) {

            let expr_18 := caller()
            let expr_19 := convert_t_address_to_t_address_payable(expr_18)
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_19)
            let expr_20 := expr_19
            let _3 := var__recipient_9
            let expr_23 := _3
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x01, expr_23)
            let expr_24 := expr_23
            let expr_28 := timestamp()
            let _4 := var_duration_11
            let expr_29 := _4
            let expr_30 := checked_add_t_uint256(expr_28, expr_29)

            update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_30)
            let expr_31 := expr_30

        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_address_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_address_payable(value)
        }

        function convert_t_uint160_to_t_address_payable(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function convert_t_uint256_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function copy_arguments_for_constructor_34_object_SimplePaymentChannel_207() -> ret_param_0, ret_param_1 {
            let programSize := datasize("SimplePaymentChannel_207")
            let argSize := sub(codesize(), programSize)

            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)

            ret_param_0, ret_param_1 := abi_decode_tuple_t_address_payablet_uint256_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
        }

        function finalize_allocation(memPtr, size) {
            let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
            // protect against overflow
            if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
            mstore(64, newFreePtr)
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

        function prepare_store_t_address_payable(value) -> ret {
            ret := value
        }

        function prepare_store_t_uint256(value) -> ret {
            ret := value
        }

        function round_up_to_mul_of_32(value) -> result {
            result := and(add(value, 31), not(31))
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function update_byte_slice_20_shift_0(value, toInsert) -> result {
            let mask := 0xffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_byte_slice_32_shift_0(value, toInsert) -> result {
            let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }

        function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
        }

        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }

        function validator_revert_t_address_payable(value) {
            if iszero(eq(value, cleanup_t_address_payable(value))) { revert(0, 0) }
        }

        function validator_revert_t_uint256(value) {
            if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
        }

    }
    object "SimplePaymentChannel_207_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x0e1da6c3
                {
                    // claimTimeout()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_claimTimeout_107()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x415ffba7
                {
                    // close(uint256,bytes)

                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_bytes_memory_ptr(4, calldatasize())
                    fun_close_67(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4665096d
                {
                    // expiration()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_expiration_7()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x66d003ac
                {
                    // recipient()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_recipient_5()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x67e404ce
                {
                    // sender()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_sender_3()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x9714378c
                {
                    // extend(uint256)

                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_extend_91(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_available_length_t_bytes_memory_ptr(src, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_bytes_memory_ptr(length))
                mstore(array, length)
                let dst := add(array, 0x20)
                if gt(add(src, length), end) { revert(0, 0) }
                copy_calldata_to_memory(src, dst, length)
            }

            // bytes
            function abi_decode_t_bytes_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := abi_decode_available_length_t_bytes_memory_ptr(add(offset, 0x20), length, end)
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256t_bytes_memory_ptr(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }

                    value1 := abi_decode_t_bytes_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_t_bytes32_to_t_bytes32_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_bytes32(cleanup_t_bytes32(value)))
            }

            function abi_encode_t_contract$_SimplePaymentChannel_$207_to_t_address_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_address(convert_t_contract$_SimplePaymentChannel_$207_to_t_address(value)))
            }

            function abi_encode_t_stringliteral_178a2411ab6fbc1ba11064408972259c558d0e82fd48b0aba3ad81d14f065e73_to_t_string_memory_ptr_nonPadded_inplace_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, 28)
                store_literal_in_memory_178a2411ab6fbc1ba11064408972259c558d0e82fd48b0aba3ad81d14f065e73(pos)
                end := add(pos, 28)
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_uint256(cleanup_t_uint256(value)))
            }

            function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint8(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_packed_t_contract$_SimplePaymentChannel_$207_t_uint256__to_t_address_t_uint256__nonPadded_inplace_fromStack(pos , value0, value1) -> end {

                abi_encode_t_contract$_SimplePaymentChannel_$207_to_t_address_nonPadded_inplace_fromStack(value0,  pos)
                pos := add(pos, 20)

                abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value1,  pos)
                pos := add(pos, 32)

                end := pos
            }

            function abi_encode_tuple_packed_t_stringliteral_178a2411ab6fbc1ba11064408972259c558d0e82fd48b0aba3ad81d14f065e73_t_bytes32__to_t_string_memory_ptr_t_bytes32__nonPadded_inplace_fromStack(pos , value0) -> end {

                pos := abi_encode_t_stringliteral_178a2411ab6fbc1ba11064408972259c558d0e82fd48b0aba3ad81d14f065e73_to_t_string_memory_ptr_nonPadded_inplace_fromStack( pos)

                abi_encode_t_bytes32_to_t_bytes32_nonPadded_inplace_fromStack(value0,  pos)
                pos := add(pos, 32)

                end := pos
            }

            function abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_bytes32_t_uint8_t_bytes32_t_bytes32__to_t_bytes32_t_uint8_t_bytes32_t_bytes32__fromStack(headStart , value0, value1, value2, value3) -> tail {
                tail := add(headStart, 128)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint8_to_t_uint8_fromStack(value1,  add(headStart, 32))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value2,  add(headStart, 64))

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value3,  add(headStart, 96))

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function allocate_memory(size) -> memPtr {
                memPtr := allocate_unbounded()
                finalize_allocation(memPtr, size)
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

            function array_dataslot_t_bytes_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

            }

            function array_length_t_bytes_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
                updated_pos := pos
            }

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_address_payable(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint8(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_contract$_SimplePaymentChannel_$207_to_t_address(value) -> converted {
                converted := convert_t_contract$_SimplePaymentChannel_$207_to_t_uint160(value)
            }

            function convert_t_contract$_SimplePaymentChannel_$207_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_65_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function copy_calldata_to_memory(src, dst, length) {
                calldatacopy(dst, src, length)
                // clear end
                mstore(add(dst, length), 0)
            }

            function extract_from_storage_value_dynamict_address_payable(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function finalize_allocation(memPtr, size) {
                let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }

            function fun_claimTimeout_107() {

                let expr_97 := timestamp()
                let _13 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_98 := _13
                let expr_99 := iszero(lt(cleanup_t_uint256(expr_97), cleanup_t_uint256(expr_98)))
                require_helper(expr_99)
                let _14 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_103 := _14
                selfdestruct(expr_103)

            }

            function fun_close_67(var_amount_37, var_signature_39_mpos) {

                let expr_44 := caller()
                let _1 := read_from_storage_split_offset_0_t_address_payable(0x01)
                let expr_45 := _1
                let expr_46 := eq(cleanup_t_address(expr_44), convert_t_address_payable_to_t_address(expr_45))
                require_helper(expr_46)
                let expr_50_functionIdentifier := 136
                let _2 := var_amount_37
                let expr_51 := _2
                let _3_mpos := var_signature_39_mpos
                let expr_52_mpos := _3_mpos
                let expr_53 := fun_isValidSignature_136(expr_51, expr_52_mpos)
                require_helper(expr_53)
                let _4 := read_from_storage_split_offset_0_t_address_payable(0x01)
                let expr_56 := _4
                let expr_58_address := convert_t_address_payable_to_t_address(expr_56)
                let _5 := var_amount_37
                let expr_59 := _5

                let _6 := 0
                if iszero(expr_59) { _6 := 2300 }
                let _7 := call(_6, expr_58_address, expr_59, 0, 0, 0, 0)

                if iszero(_7) { revert_forward_1() }

                let _8 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_63 := _8
                selfdestruct(expr_63)

            }

            function fun_extend_91(var_newExpiration_70) {

                let expr_75 := caller()
                let _9 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_76 := _9
                let expr_77 := eq(cleanup_t_address(expr_75), convert_t_address_payable_to_t_address(expr_76))
                require_helper(expr_77)
                let _10 := var_newExpiration_70
                let expr_81 := _10
                let _11 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_82 := _11
                let expr_83 := gt(cleanup_t_uint256(expr_81), cleanup_t_uint256(expr_82))
                require_helper(expr_83)
                let _12 := var_newExpiration_70
                let expr_87 := _12
                update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_87)
                let expr_88 := expr_87

            }

            function fun_isValidSignature_136(var_amount_109, var_signature_111_mpos) -> var__114 {
                let zero_t_bool_15 := zero_value_for_split_t_bool()
                var__114 := zero_t_bool_15

                let expr_118_functionIdentifier := 206
                let expr_122_address := address()
                let _16 := var_amount_109
                let expr_123 := _16

                let expr_124_mpos := allocate_unbounded()
                let _17 := add(expr_124_mpos, 0x20)

                let _18 := abi_encode_tuple_packed_t_contract$_SimplePaymentChannel_$207_t_uint256__to_t_address_t_uint256__nonPadded_inplace_fromStack(_17, expr_122_address, expr_123)
                mstore(expr_124_mpos, sub(_18, add(expr_124_mpos, 0x20)))
                finalize_allocation(expr_124_mpos, sub(_18, expr_124_mpos))
                let expr_125 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_124_mpos), array_length_t_bytes_memory_ptr(expr_124_mpos))
                let expr_126 := fun_prefixed_206(expr_125)
                let var_message_117 := expr_126
                let expr_128_functionIdentifier := 189
                let _19 := var_message_117
                let expr_129 := _19
                let _20_mpos := var_signature_111_mpos
                let expr_130_mpos := _20_mpos
                let expr_131 := fun_recoverSigner_189(expr_129, expr_130_mpos)
                let _21 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_132 := _21
                let expr_133 := eq(cleanup_t_address(expr_131), convert_t_address_payable_to_t_address(expr_132))
                var__114 := expr_133
                leave

            }

            function fun_prefixed_206(var_hash_192) -> var__195 {
                let zero_t_bytes32_38 := zero_value_for_split_t_bytes32()
                var__195 := zero_t_bytes32_38

                let _39 := var_hash_192
                let expr_201 := _39

                let expr_202_mpos := allocate_unbounded()
                let _40 := add(expr_202_mpos, 0x20)

                let _41 := abi_encode_tuple_packed_t_stringliteral_178a2411ab6fbc1ba11064408972259c558d0e82fd48b0aba3ad81d14f065e73_t_bytes32__to_t_string_memory_ptr_t_bytes32__nonPadded_inplace_fromStack(_40, expr_201)
                mstore(expr_202_mpos, sub(_41, add(expr_202_mpos, 0x20)))
                finalize_allocation(expr_202_mpos, sub(_41, expr_202_mpos))
                let expr_203 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_202_mpos), array_length_t_bytes_memory_ptr(expr_202_mpos))
                var__195 := expr_203
                leave

            }

            function fun_recoverSigner_189(var_message_164, var_sig_166_mpos) -> var__169 {
                let zero_t_address_22 := zero_value_for_split_t_address()
                var__169 := zero_t_address_22

                let expr_177_functionIdentifier := 162
                let _23_mpos := var_sig_166_mpos
                let expr_178_mpos := _23_mpos
                let expr_179_component_1, expr_179_component_2, expr_179_component_3 := fun_splitSignature_162(expr_178_mpos)
                let var_v_172 := expr_179_component_1
                let var_r_174 := expr_179_component_2
                let var_s_176 := expr_179_component_3
                let _24 := var_message_164
                let expr_182 := _24
                let _25 := var_v_172
                let expr_183 := _25
                let _26 := var_r_174
                let expr_184 := _26
                let _27 := var_s_176
                let expr_185 := _27

                let _28 := allocate_unbounded()
                let _29 := abi_encode_tuple_t_bytes32_t_uint8_t_bytes32_t_bytes32__to_t_bytes32_t_uint8_t_bytes32_t_bytes32__fromStack(_28 , expr_182, expr_183, expr_184, expr_185)

                mstore(0, 0)

                let _30 := staticcall(gas(), 1 , _28, sub(_29, _28), 0, 32)
                if iszero(_30) { revert_forward_1() }
                let expr_186 := shift_left_0(mload(0))
                var__169 := expr_186
                leave

            }

            function fun_splitSignature_162(var_sig_139_mpos) -> var_v_142, var_r_144, var_s_146 {
                let zero_t_uint8_31 := zero_value_for_split_t_uint8()
                var_v_142 := zero_t_uint8_31
                let zero_t_bytes32_32 := zero_value_for_split_t_bytes32()
                var_r_144 := zero_t_bytes32_32
                let zero_t_bytes32_33 := zero_value_for_split_t_bytes32()
                var_s_146 := zero_t_bytes32_33

                let _34_mpos := var_sig_139_mpos
                let expr_149_mpos := _34_mpos
                let expr_150 := array_length_t_bytes_memory_ptr(expr_149_mpos)
                let expr_151 := 0x41
                let expr_152 := eq(cleanup_t_uint256(expr_150), convert_t_rational_65_by_1_to_t_uint256(expr_151))
                require_helper(expr_152)
                {
                    var_r_144 := mload(add(var_sig_139_mpos, 32))
                    var_s_146 := mload(add(var_sig_139_mpos, 64))
                    var_v_142 := byte(0, mload(add(var_sig_139_mpos, 96)))
                }
                let _35 := var_v_142
                let expr_156 := _35
                let expr_159_component_1 := expr_156
                let _36 := var_r_144
                let expr_157 := _36
                let expr_159_component_2 := expr_157
                let _37 := var_s_146
                let expr_158 := _37
                let expr_159_component_3 := expr_158
                var_v_142 := expr_159_component_1
                var_r_144 := expr_159_component_2
                var_s_146 := expr_159_component_3
                leave

            }

            function getter_fun_expiration_7() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_recipient_5() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function getter_fun_sender_3() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function leftAlign_t_address(value) -> aligned {
                aligned := leftAlign_t_uint160(value)
            }

            function leftAlign_t_bytes32(value) -> aligned {
                aligned := value
            }

            function leftAlign_t_uint160(value) -> aligned {
                aligned := shift_left_96(value)
            }

            function leftAlign_t_uint256(value) -> aligned {
                aligned := value
            }

            function panic_error_0x41() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address_payable(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address_payable(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
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

            function shift_left_96(value) -> newValue {
                newValue :=

                shl(96, value)

            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function store_literal_in_memory_178a2411ab6fbc1ba11064408972259c558d0e82fd48b0aba3ad81d14f065e73(memPtr) {

                mstore(add(memPtr, 0), 0x19457468657265756d205369676e6564204d6573736167653a0a333200000000)

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

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_address() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_bytes32() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint8() -> ret {
                ret := 0
            }

        }

    }

}

