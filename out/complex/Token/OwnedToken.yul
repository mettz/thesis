/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "OwnedToken_71" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        let _1 := copy_arguments_for_constructor_30_object_OwnedToken_71()
        constructor_OwnedToken_71(_1)

        codecopy(0, dataoffset("OwnedToken_71_deployed"), datasize("OwnedToken_71_deployed"))

        return(0, datasize("OwnedToken_71_deployed"))

        function abi_decode_t_bytes32_fromMemory(offset, end) -> value {
            value := mload(offset)
            validator_revert_t_bytes32(value)
        }

        function abi_decode_tuple_t_bytes32_fromMemory(headStart, dataEnd) -> value0 {
            if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

            {

                let offset := 0

                value0 := abi_decode_t_bytes32_fromMemory(add(headStart, offset), dataEnd)
            }

        }

        function allocate_memory(size) -> memPtr {
            memPtr := allocate_unbounded()
            finalize_allocation(memPtr, size)
        }

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function cleanup_t_bytes32(value) -> cleaned {
            cleaned := value
        }

        function cleanup_t_uint160(value) -> cleaned {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }

        function constructor_OwnedToken_71(var__name_10) {

            let expr_15 := caller()
            update_storage_value_offset_0t_address_to_t_address(0x01, expr_15)
            let expr_16 := expr_15
            let expr_21 := caller()
            let expr_22_address := convert_t_address_to_t_contract$_TokenCreator_$124(expr_21)
            update_storage_value_offset_0t_contract$_TokenCreator_$124_to_t_contract$_TokenCreator_$124(0x00, expr_22_address)
            let expr_23_address := expr_22_address
            let _2 := var__name_10
            let expr_26 := _2
            update_storage_value_offset_0t_bytes32_to_t_bytes32(0x02, expr_26)
            let expr_27 := expr_26

        }

        function convert_t_address_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_address(value)
        }

        function convert_t_address_to_t_contract$_TokenCreator_$124(value) -> converted {
            converted := convert_t_uint160_to_t_contract$_TokenCreator_$124(value)
        }

        function convert_t_bytes32_to_t_bytes32(value) -> converted {
            converted := cleanup_t_bytes32(value)
        }

        function convert_t_contract$_TokenCreator_$124_to_t_contract$_TokenCreator_$124(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function convert_t_uint160_to_t_address(value) -> converted {
            converted := convert_t_uint160_to_t_uint160(value)
        }

        function convert_t_uint160_to_t_contract$_TokenCreator_$124(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function convert_t_uint160_to_t_uint160(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function copy_arguments_for_constructor_30_object_OwnedToken_71() -> ret_param_0 {
            let programSize := datasize("OwnedToken_71")
            let argSize := sub(codesize(), programSize)

            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)

            ret_param_0 := abi_decode_tuple_t_bytes32_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
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

        function prepare_store_t_address(value) -> ret {
            ret := value
        }

        function prepare_store_t_bytes32(value) -> ret {
            ret := shift_right_0_unsigned(value)
        }

        function prepare_store_t_contract$_TokenCreator_$124(value) -> ret {
            ret := value
        }

        function round_up_to_mul_of_32(value) -> result {
            result := and(add(value, 31), not(31))
        }

        function shift_left_0(value) -> newValue {
            newValue :=

            shl(0, value)

        }

        function shift_right_0_unsigned(value) -> newValue {
            newValue :=

            shr(0, value)

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

        function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
            let convertedValue_0 := convert_t_address_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
        }

        function update_storage_value_offset_0t_bytes32_to_t_bytes32(slot, value_0) {
            let convertedValue_0 := convert_t_bytes32_to_t_bytes32(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_bytes32(convertedValue_0)))
        }

        function update_storage_value_offset_0t_contract$_TokenCreator_$124_to_t_contract$_TokenCreator_$124(slot, value_0) {
            let convertedValue_0 := convert_t_contract$_TokenCreator_$124_to_t_contract$_TokenCreator_$124(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_TokenCreator_$124(convertedValue_0)))
        }

        function validator_revert_t_bytes32(value) {
            if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
        }

    }
    object "OwnedToken_71_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1a695230
                {
                    // transfer(address)

                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_transfer_70(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x898855ed
                {
                    // changeName(bytes32)

                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                    fun_changeName_48(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
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

            function abi_decode_t_bool_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_bool(value)
            }

            function abi_decode_t_bytes32(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bytes32(value)
            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_bool_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_bool_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_bytes32(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_address_to_t_address_fromStack(value1,  add(headStart, 32))

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_contract$_TokenCreator_$124(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function convert_t_bytes32_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            function convert_t_contract$_TokenCreator_$124_to_t_address(value) -> converted {
                converted := convert_t_contract$_TokenCreator_$124_to_t_uint160(value)
            }

            function convert_t_contract$_TokenCreator_$124_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_contract$_TokenCreator_$124(slot_value) -> value {
                value := cleanup_from_storage_t_contract$_TokenCreator_$124(shift_right_0_unsigned(slot_value))
            }

            function finalize_allocation(memPtr, size) {
                let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }

            function fun_changeName_48(var_newName_32) {

                let expr_36 := caller()
                let _1_address := read_from_storage_split_offset_0_t_contract$_TokenCreator_$124(0x00)
                let expr_39_address := _1_address
                let expr_40 := convert_t_contract$_TokenCreator_$124_to_t_address(expr_39_address)
                let expr_41 := eq(cleanup_t_address(expr_36), cleanup_t_address(expr_40))
                if expr_41 {
                    let _2 := var_newName_32
                    let expr_43 := _2
                    update_storage_value_offset_0t_bytes32_to_t_bytes32(0x02, expr_43)
                    let expr_44 := expr_43
                }

            }

            function fun_transfer_70(var_newOwner_50) {

                let expr_54 := caller()
                let _3 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_55 := _3
                let expr_56 := iszero(eq(cleanup_t_address(expr_54), cleanup_t_address(expr_55)))
                if expr_56 {
                    leave
                }
                let _4_address := read_from_storage_split_offset_0_t_contract$_TokenCreator_$124(0x00)
                let expr_59_address := _4_address
                let expr_60_address := convert_t_contract$_TokenCreator_$124_to_t_address(expr_59_address)
                let expr_60_functionSelector := 0xc3cee9c1
                let _5 := read_from_storage_split_offset_0_t_address(0x01)
                let expr_61 := _5
                let _6 := var_newOwner_50
                let expr_62 := _6

                if iszero(extcodesize(expr_60_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _7 := allocate_unbounded()
                mstore(_7, shift_left_224(expr_60_functionSelector))
                let _8 := abi_encode_tuple_t_address_t_address__to_t_address_t_address__fromStack(add(_7, 4) , expr_61, expr_62)

                let _9 := staticcall(gas(), expr_60_address,  _7, sub(_8, _7), _7, 32)

                if iszero(_9) { revert_forward_1() }

                let expr_63
                if _9 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_7, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_63 :=  abi_decode_tuple_t_bool_fromMemory(_7, add(_7, returndatasize()))
                }
                if expr_63 {
                    let _10 := var_newOwner_50
                    let expr_65 := _10
                    update_storage_value_offset_0t_address_to_t_address(0x01, expr_65)
                    let expr_66 := expr_65
                }

            }

            function panic_error_0x41() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function prepare_store_t_bytes32(value) -> ret {
                ret := shift_right_0_unsigned(value)
            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function read_from_storage_split_offset_0_t_contract$_TokenCreator_$124(slot) -> value {
                value := extract_from_storage_value_offset_0t_contract$_TokenCreator_$124(sload(slot))

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

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            function update_storage_value_offset_0t_bytes32_to_t_bytes32(slot, value_0) {
                let convertedValue_0 := convert_t_bytes32_to_t_bytes32(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_bytes32(convertedValue_0)))
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function validator_revert_t_bool(value) {
                if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
            }

            function validator_revert_t_bytes32(value) {
                if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
            }

        }

    }

}

