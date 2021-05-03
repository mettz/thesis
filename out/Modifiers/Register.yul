/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Register_101" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        let _1 := copy_arguments_for_constructor_74_object_Register_101()
        constructor_Register_101(_1)

        codecopy(0, dataoffset("Register_101_deployed"), datasize("Register_101_deployed"))

        return(0, datasize("Register_101_deployed"))

        function abi_decode_t_uint256_fromMemory(offset, end) -> value {
            value := mload(offset)
            validator_revert_t_uint256(value)
        }

        function abi_decode_tuple_t_uint256_fromMemory(headStart, dataEnd) -> value0 {
            if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

            {

                let offset := 0

                value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
            }

        }

        function allocate_memory(size) -> memPtr {
            memPtr := allocate_unbounded()
            finalize_allocation(memPtr, size)
        }

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function cleanup_t_uint256(value) -> cleaned {
            cleaned := value
        }

        function constructor_Register_101(var_initialPrice_66) {

            constructor_destructible_41()

            let _2 := var_initialPrice_66
            let expr_70 := _2
            update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_70)
            let expr_71 := expr_70

        }

        function constructor_destructible_41() {

            constructor_owned_28()

        }

        function constructor_owned_28() {

            constructor_priced_54()

            let expr_8 := caller()
            let expr_9 := convert_t_address_to_t_address_payable(expr_8)
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_9)
            let expr_10 := expr_9

        }

        function constructor_priced_54() {

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

        function copy_arguments_for_constructor_74_object_Register_101() -> ret_param_0 {
            let programSize := datasize("Register_101")
            let argSize := sub(codesize(), programSize)

            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)

            ret_param_0 := abi_decode_tuple_t_uint256_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
        }

        function finalize_allocation(memPtr, size) {
            let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
            // protect against overflow
            if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
            mstore(64, newFreePtr)
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

        function validator_revert_t_uint256(value) {
            if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
        }

    }
    object "Register_101_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1aa3a008
                {
                    // register()

                    abi_decode_tuple_(4, calldatasize())
                    fun_register_88()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x83197ef0
                {
                    // destroy()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_destroy_40()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa2b40d19
                {
                    // changePrice(uint256)

                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_changePrice_100(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

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

            function abi_encode_t_stringliteral_0fcea41e877c4f84237ea6b9061acc9b3fc97555de5ba31615eb7b8cf7110239_to_t_string_memory_ptr_fromStack(pos) -> end {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 34)
                store_literal_in_memory_0fcea41e877c4f84237ea6b9061acc9b3fc97555de5ba31615eb7b8cf7110239(pos)
                end := add(pos, 64)
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_stringliteral_0fcea41e877c4f84237ea6b9061acc9b3fc97555de5ba31615eb7b8cf7110239__to_t_string_memory_ptr__fromStack(headStart ) -> tail {
                tail := add(headStart, 32)

                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_0fcea41e877c4f84237ea6b9061acc9b3fc97555de5ba31615eb7b8cf7110239_to_t_string_memory_ptr_fromStack( tail)

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
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

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
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

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
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

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_changePrice_100(var__price_90) {

                modifier_onlyOwner_93(var__price_90)
            }

            function fun_changePrice_100_inner(var__price_90) {

                let _9 := var__price_90
                let expr_96 := _9
                update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_96)
                let expr_97 := expr_96

            }

            function fun_destroy_40() {

                modifier_onlyOwner_33()
            }

            function fun_destroy_40_inner() {

                let _2 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_36 := _2
                selfdestruct(expr_36)

            }

            function fun_register_88() {

                modifier_costs_78()
            }

            function fun_register_88_inner() {

                let expr_84 := 0x01
                let _6 := 0x01
                let expr_80 := _6
                let expr_82 := caller()
                let _7 := mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(expr_80,expr_82)
                update_storage_value_offset_0t_bool_to_t_bool(_7, expr_84)
                let expr_85 := expr_84

            }

            function mapping_index_access_t_mapping$_t_address_$_t_bool_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function modifier_costs_78() {

                let _3 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_77 := _3
                let _4 := expr_77
                let var_price_43 := _4

                let expr_46 := callvalue()
                let _5 := var_price_43
                let expr_47 := _5
                let expr_48 := iszero(lt(cleanup_t_uint256(expr_46), cleanup_t_uint256(expr_47)))
                if expr_48 {
                    fun_register_88_inner()
                }

            }

            function modifier_onlyOwner_33() {

                let expr_19 := caller()
                let _1 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_20 := _1
                let expr_21 := eq(cleanup_t_address(expr_19), convert_t_address_payable_to_t_address(expr_20))
                require_helper_t_stringliteral_0fcea41e877c4f84237ea6b9061acc9b3fc97555de5ba31615eb7b8cf7110239(expr_21)
                fun_destroy_40_inner()

            }

            function modifier_onlyOwner_93(var__price_90) {

                let expr_19 := caller()
                let _8 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_20 := _8
                let expr_21 := eq(cleanup_t_address(expr_19), convert_t_address_payable_to_t_address(expr_20))
                require_helper_t_stringliteral_0fcea41e877c4f84237ea6b9061acc9b3fc97555de5ba31615eb7b8cf7110239(expr_21)
                fun_changePrice_100_inner(var__price_90)

            }

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function require_helper_t_stringliteral_0fcea41e877c4f84237ea6b9061acc9b3fc97555de5ba31615eb7b8cf7110239(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_0fcea41e877c4f84237ea6b9061acc9b3fc97555de5ba31615eb7b8cf7110239__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function store_literal_in_memory_0fcea41e877c4f84237ea6b9061acc9b3fc97555de5ba31615eb7b8cf7110239(memPtr) {

                mstore(add(memPtr, 0), "Only owner can call this functio")

                mstore(add(memPtr, 32), "n.")

            }

            function update_byte_slice_1_shift_0(value, toInsert) -> result {
                let mask := 255
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

            function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

        }

    }

}

