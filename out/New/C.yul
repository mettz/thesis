/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "C_67" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_C_67()

        codecopy(0, dataoffset("C_67_deployed"), datasize("C_67_deployed"))

        return(0, datasize("C_67_deployed"))

        function abi_encode_t_rational_4_by_1_to_t_uint256_fromStack(value, pos) {
            mstore(pos, convert_t_rational_4_by_1_to_t_uint256(value))
        }

        function abi_encode_tuple_t_rational_4_by_1__to_t_uint256__fromStack(headStart , value0) -> tail {
            tail := add(headStart, 32)

            abi_encode_t_rational_4_by_1_to_t_uint256_fromStack(value0,  add(headStart, 0))

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

        function constructor_C_67() {

            let expr_20 := 0x04

            let _1 := allocate_unbounded()
            let _2 := add(_1, datasize("D_14"))
            if or(gt(_2, 0xffffffffffffffff), lt(_2, _1)) { panic_error_0x41() }
            datacopy(_1, dataoffset("D_14"), datasize("D_14"))
            _2 := abi_encode_tuple_t_rational_4_by_1__to_t_uint256__fromStack(_2, expr_20)

            let expr_21_address := create(0, _1, sub(_2, _1))

            if iszero(expr_21_address) { revert_forward_1() }

            update_storage_value_offset_0t_contract$_D_$14_to_t_contract$_D_$14(0x00, expr_21_address)

        }

        function convert_t_contract$_D_$14_to_t_contract$_D_$14(value) -> converted {
            converted := cleanup_t_uint160(value)
        }

        function convert_t_rational_4_by_1_to_t_uint256(value) -> converted {
            converted := cleanup_t_uint256(value)
        }

        function panic_error_0x41() {
            mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
            mstore(4, 0x41)
            revert(0, 0x24)
        }

        function prepare_store_t_contract$_D_$14(value) -> ret {
            ret := value
        }

        function revert_forward_1() {
            returndatacopy(0, 0, returndatasize())
            revert(0, returndatasize())
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

        function update_storage_value_offset_0t_contract$_D_$14_to_t_contract$_D_$14(slot, value_0) {
            let convertedValue_0 := convert_t_contract$_D_$14_to_t_contract$_D_$14(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_contract$_D_$14(convertedValue_0)))
        }

    }
    object "C_67_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x8dcd64cc
                {
                    // createAndEndowD(uint256,uint256)

                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    fun_createAndEndowD_66(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x95fe0e65
                {
                    // createD(uint256)

                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_createD_42(param_0)
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

            function abi_decode_t_uint256_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256t_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

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

            function convert_t_contract$_D_$14_to_t_address(value) -> converted {
                converted := convert_t_contract$_D_$14_to_t_uint160(value)
            }

            function convert_t_contract$_D_$14_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function finalize_allocation(memPtr, size) {
                let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }

            function fun_createAndEndowD_66(var_arg_44, var_amount_46) {

                let _8 := var_amount_46
                let expr_55 := _8
                let expr_56_value := expr_55
                let _9 := var_arg_44
                let expr_57 := _9

                let _10 := allocate_unbounded()
                let _11 := add(_10, datasize("D_14"))
                if or(gt(_11, 0xffffffffffffffff), lt(_11, _10)) { panic_error_0x41() }
                datacopy(_10, dataoffset("D_14"), datasize("D_14"))
                _11 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_11, expr_57)

                let expr_58_address := create(expr_56_value, _10, sub(_11, _10))

                if iszero(expr_58_address) { revert_forward_1() }

                let var_newD_51_address := expr_58_address
                let _12_address := var_newD_51_address
                let expr_60_address := _12_address
                let expr_62_address := convert_t_contract$_D_$14_to_t_address(expr_60_address)
                let expr_62_functionSelector := 0x0c55699c

                if iszero(extcodesize(expr_62_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _13 := allocate_unbounded()
                mstore(_13, shift_left_224(expr_62_functionSelector))
                let _14 := abi_encode_tuple__to__fromStack(add(_13, 4) )

                let _15 := staticcall(gas(), expr_62_address,  _13, sub(_14, _13), _13, 32)

                if iszero(_15) { revert_forward_1() }

                let expr_63
                if _15 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_13, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_63 :=  abi_decode_tuple_t_uint256_fromMemory(_13, add(_13, returndatasize()))
                }

            }

            function fun_createD_42(var_arg_24) {

                let _1 := var_arg_24
                let expr_33 := _1

                let _2 := allocate_unbounded()
                let _3 := add(_2, datasize("D_14"))
                if or(gt(_3, 0xffffffffffffffff), lt(_3, _2)) { panic_error_0x41() }
                datacopy(_2, dataoffset("D_14"), datasize("D_14"))
                _3 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(_3, expr_33)

                let expr_34_address := create(0, _2, sub(_3, _2))

                if iszero(expr_34_address) { revert_forward_1() }

                let var_newD_29_address := expr_34_address
                let _4_address := var_newD_29_address
                let expr_36_address := _4_address
                let expr_38_address := convert_t_contract$_D_$14_to_t_address(expr_36_address)
                let expr_38_functionSelector := 0x0c55699c

                if iszero(extcodesize(expr_38_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _5 := allocate_unbounded()
                mstore(_5, shift_left_224(expr_38_functionSelector))
                let _6 := abi_encode_tuple__to__fromStack(add(_5, 4) )

                let _7 := staticcall(gas(), expr_38_address,  _5, sub(_6, _5), _5, 32)

                if iszero(_7) { revert_forward_1() }

                let expr_39
                if _7 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_5, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_39 :=  abi_decode_tuple_t_uint256_fromMemory(_5, add(_5, returndatasize()))
                }

            }

            function panic_error_0x41() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_left_224(value) -> newValue {
                newValue :=

                shl(224, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

        }
        /*******************************************************
        *                       WARNING                       *
        *  Solidity to Yul compilation is still EXPERIMENTAL  *
        *       It can result in LOSS OF FUNDS or worse       *
        *                !USE AT YOUR OWN RISK!               *
        *******************************************************/

        object "D_14" {
            code {
                mstore(64, 128)

                let _1 := copy_arguments_for_constructor_13_object_D_14()
                constructor_D_14(_1)

                codecopy(0, dataoffset("D_14_deployed"), datasize("D_14_deployed"))

                return(0, datasize("D_14_deployed"))

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

                function cleanup_t_uint256(value) -> cleaned {
                    cleaned := value
                }

                function constructor_D_14(var_a_5) {

                    let _2 := var_a_5
                    let expr_9 := _2
                    update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_9)
                    let expr_10 := expr_9

                }

                function convert_t_uint256_to_t_uint256(value) -> converted {
                    converted := cleanup_t_uint256(value)
                }

                function copy_arguments_for_constructor_13_object_D_14() -> ret_param_0 {
                    let programSize := datasize("D_14")
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

            }
            object "D_14_deployed" {
                code {
                    mstore(64, 128)

                    if iszero(lt(calldatasize(), 4))
                    {
                        let selector := shift_right_224_unsigned(calldataload(0))
                        switch selector

                        case 0x0c55699c
                        {
                            // x()

                            if callvalue() { revert(0, 0) }
                            abi_decode_tuple_(4, calldatasize())
                            let ret_0 :=  getter_fun_x_3()
                            let memPos := allocate_unbounded()
                            let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                            return(memPos, sub(memEnd, memPos))
                        }

                        default {}
                    }
                    if iszero(calldatasize()) {  }
                    revert(0, 0)

                    function abi_decode_tuple_(headStart, dataEnd)   {
                        if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

                    }

                    function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                        mstore(pos, cleanup_t_uint256(value))
                    }

                    function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                        tail := add(headStart, 32)

                        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                    }

                    function allocate_unbounded() -> memPtr {
                        memPtr := mload(64)
                    }

                    function cleanup_from_storage_t_uint256(value) -> cleaned {
                        cleaned := value
                    }

                    function cleanup_t_uint256(value) -> cleaned {
                        cleaned := value
                    }

                    function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                        value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
                    }

                    function getter_fun_x_3() -> ret {

                        let slot := 0
                        let offset := 0

                        ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

                    }

                    function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                        value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

                    }

                    function shift_right_224_unsigned(value) -> newValue {
                        newValue :=

                        shr(224, value)

                    }

                    function shift_right_unsigned_dynamic(bits, value) -> newValue {
                        newValue :=

                        shr(bits, value)

                    }

                }

            }

        }

    }
    /*******************************************************
    *                       WARNING                       *
    *  Solidity to Yul compilation is still EXPERIMENTAL  *
    *       It can result in LOSS OF FUNDS or worse       *
    *                !USE AT YOUR OWN RISK!               *
    *******************************************************/

    object "D_14" {
        code {
            mstore(64, 128)

            let _1 := copy_arguments_for_constructor_13_object_D_14()
            constructor_D_14(_1)

            codecopy(0, dataoffset("D_14_deployed"), datasize("D_14_deployed"))

            return(0, datasize("D_14_deployed"))

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

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function constructor_D_14(var_a_5) {

                let _2 := var_a_5
                let expr_9 := _2
                update_storage_value_offset_0t_uint256_to_t_uint256(0x00, expr_9)
                let expr_10 := expr_9

            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function copy_arguments_for_constructor_13_object_D_14() -> ret_param_0 {
                let programSize := datasize("D_14")
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

        }
        object "D_14_deployed" {
            code {
                mstore(64, 128)

                if iszero(lt(calldatasize(), 4))
                {
                    let selector := shift_right_224_unsigned(calldataload(0))
                    switch selector

                    case 0x0c55699c
                    {
                        // x()

                        if callvalue() { revert(0, 0) }
                        abi_decode_tuple_(4, calldatasize())
                        let ret_0 :=  getter_fun_x_3()
                        let memPos := allocate_unbounded()
                        let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                        return(memPos, sub(memEnd, memPos))
                    }

                    default {}
                }
                if iszero(calldatasize()) {  }
                revert(0, 0)

                function abi_decode_tuple_(headStart, dataEnd)   {
                    if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

                }

                function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                    mstore(pos, cleanup_t_uint256(value))
                }

                function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                    tail := add(headStart, 32)

                    abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

                }

                function allocate_unbounded() -> memPtr {
                    memPtr := mload(64)
                }

                function cleanup_from_storage_t_uint256(value) -> cleaned {
                    cleaned := value
                }

                function cleanup_t_uint256(value) -> cleaned {
                    cleaned := value
                }

                function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                    value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
                }

                function getter_fun_x_3() -> ret {

                    let slot := 0
                    let offset := 0

                    ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

                }

                function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                    value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

                }

                function shift_right_224_unsigned(value) -> newValue {
                    newValue :=

                    shr(224, value)

                }

                function shift_right_unsigned_dynamic(bits, value) -> newValue {
                    newValue :=

                    shr(bits, value)

                }

            }

        }

    }

}

