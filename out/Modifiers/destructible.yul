/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "destructible_41" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_destructible_41()

        codecopy(0, dataoffset("destructible_41_deployed"), datasize("destructible_41_deployed"))

        return(0, datasize("destructible_41_deployed"))

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_destructible_41() {

            constructor_owned_28()

        }

        function constructor_owned_28() {

            let expr_8 := caller()
            let expr_9 := convert_t_address_to_t_address_payable(expr_8)
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_9)
            let expr_10 := expr_9

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

        function prepare_store_t_address_payable(value) -> ret {
            ret := value
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

        function update_storage_value_offset_0t_address_payable_to_t_address_payable(slot, value_0) {
            let convertedValue_0 := convert_t_address_payable_to_t_address_payable(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address_payable(convertedValue_0)))
        }

    }
    object "destructible_41_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

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

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

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

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function convert_t_address_payable_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function fun_destroy_40() {

                modifier_onlyOwner_33()
            }

            function fun_destroy_40_inner() {

                let _2 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_36 := _2
                selfdestruct(expr_36)

            }

            function modifier_onlyOwner_33() {

                let expr_19 := caller()
                let _1 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_20 := _1
                let expr_21 := eq(cleanup_t_address(expr_19), convert_t_address_payable_to_t_address(expr_20))
                require_helper_t_stringliteral_0fcea41e877c4f84237ea6b9061acc9b3fc97555de5ba31615eb7b8cf7110239(expr_21)
                fun_destroy_40_inner()

            }

            function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

            }

            function require_helper_t_stringliteral_0fcea41e877c4f84237ea6b9061acc9b3fc97555de5ba31615eb7b8cf7110239(condition ) {
                if iszero(condition) {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_0fcea41e877c4f84237ea6b9061acc9b3fc97555de5ba31615eb7b8cf7110239__to_t_string_memory_ptr__fromStack(add(memPtr, 4) )
                    revert(memPtr, sub(end, memPtr))
                }
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

        }

    }

}

