/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Set_80" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        codecopy(0, dataoffset("Set_80_deployed"), datasize("Set_80_deployed"))

        setimmutable(0, "library_deploy_address", address())

        return(0, datasize("Set_80_deployed"))

        function constructor_Set_80() {

        }

    }
    object "Set_80_deployed" {
        code {
            mstore(64, 128)

            let called_via_delegatecall := iszero(eq(loadimmutable("library_deploy_address"), address()))

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x3ab90ad8
                {
                    // insert(Data storage,uint256)
                    if iszero(called_via_delegatecall) { revert(0, 0) }

                    let param_0, param_1 :=  abi_decode_tuple_t_struct$_Data_$6_storage_ptrt_uint256(4, calldatasize())
                    let ret_0 :=  fun_insert_34(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack_library(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x438854c1
                {
                    // contains(Data storage,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_struct$_Data_$6_storage_ptrt_uint256(4, calldatasize())
                    let ret_0 :=  fun_contains_79(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack_library(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x9ffe9b2f
                {
                    // remove(Data storage,uint256)
                    if iszero(called_via_delegatecall) { revert(0, 0) }

                    let param_0, param_1 :=  abi_decode_tuple_t_struct$_Data_$6_storage_ptrt_uint256(4, calldatasize())
                    let ret_0 :=  fun_remove_63(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack_library(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_t_struct$_Data_$6_storage_ptr(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_struct$_Data_$6_storage_ptr(value)
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_struct$_Data_$6_storage_ptrt_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_struct$_Data_$6_storage_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_bool_to_t_bool_fromStack_library(value, pos) {
                mstore(pos, cleanup_t_bool(value))
            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack_library(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack_library(value0,  add(headStart, 0))

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function cleanup_t_struct$_Data_$6_storage_ptr(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function fun_contains_79(var_self_66_slot, var_value_68) -> var__71 {
                let zero_t_bool_25 := zero_value_for_split_t_bool()
                var__71 := zero_t_bool_25

                let _26_slot := var_self_66_slot
                let expr_73_slot := _26_slot
                let _27 := add(expr_73_slot, 0)
                let _28 := _27
                let expr_74 := _28
                let _29 := var_value_68
                let expr_75 := _29
                let _30 := mapping_index_access_t_mapping$_t_uint256_$_t_bool_$_of_t_uint256(expr_74,expr_75)
                let _31 := read_from_storage_split_offset_0_t_bool(_30)
                let expr_76 := _31
                var__71 := expr_76
                leave

            }

            function fun_insert_34(var_self_9_slot, var_value_11) -> var__14 {
                let zero_t_bool_1 := zero_value_for_split_t_bool()
                var__14 := zero_t_bool_1

                let _2_slot := var_self_9_slot
                let expr_16_slot := _2_slot
                let _3 := add(expr_16_slot, 0)
                let _4 := _3
                let expr_17 := _4
                let _5 := var_value_11
                let expr_18 := _5
                let _6 := mapping_index_access_t_mapping$_t_uint256_$_t_bool_$_of_t_uint256(expr_17,expr_18)
                let _7 := read_from_storage_split_offset_0_t_bool(_6)
                let expr_19 := _7
                if expr_19 {
                    let expr_20 := 0x00
                    var__14 := expr_20
                    leave
                }
                let expr_28 := 0x01
                let _8_slot := var_self_9_slot
                let expr_23_slot := _8_slot
                let _9 := add(expr_23_slot, 0)
                let _10 := _9
                let expr_26 := _10
                let _11 := var_value_11
                let expr_25 := _11
                let _12 := mapping_index_access_t_mapping$_t_uint256_$_t_bool_$_of_t_uint256(expr_26,expr_25)
                update_storage_value_offset_0t_bool_to_t_bool(_12, expr_28)
                let expr_29 := expr_28
                let expr_31 := 0x01
                var__14 := expr_31
                leave

            }

            function fun_remove_63(var_self_37_slot, var_value_39) -> var__42 {
                let zero_t_bool_13 := zero_value_for_split_t_bool()
                var__42 := zero_t_bool_13

                let _14_slot := var_self_37_slot
                let expr_44_slot := _14_slot
                let _15 := add(expr_44_slot, 0)
                let _16 := _15
                let expr_45 := _16
                let _17 := var_value_39
                let expr_46 := _17
                let _18 := mapping_index_access_t_mapping$_t_uint256_$_t_bool_$_of_t_uint256(expr_45,expr_46)
                let _19 := read_from_storage_split_offset_0_t_bool(_18)
                let expr_47 := _19
                let expr_48 := cleanup_t_bool(iszero(expr_47))
                if expr_48 {
                    let expr_49 := 0x00
                    var__42 := expr_49
                    leave
                }
                let expr_57 := 0x00
                let _20_slot := var_self_37_slot
                let expr_52_slot := _20_slot
                let _21 := add(expr_52_slot, 0)
                let _22 := _21
                let expr_55 := _22
                let _23 := var_value_39
                let expr_54 := _23
                let _24 := mapping_index_access_t_mapping$_t_uint256_$_t_bool_$_of_t_uint256(expr_55,expr_54)
                update_storage_value_offset_0t_bool_to_t_bool(_24, expr_57)
                let expr_58 := expr_57
                let expr_60 := 0x01
                var__42 := expr_60
                leave

            }

            function mapping_index_access_t_mapping$_t_uint256_$_t_bool_$_of_t_uint256(slot , key) -> dataSlot {
                mstore(0, convert_t_uint256_to_t_uint256(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))

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

            function update_byte_slice_1_shift_0(value, toInsert) -> result {
                let mask := 255
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function validator_revert_t_struct$_Data_$6_storage_ptr(value) {
                if iszero(eq(value, cleanup_t_struct$_Data_$6_storage_ptr(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

        }

    }

}

