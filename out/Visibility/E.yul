/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "E_86" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_E_86()

        codecopy(0, dataoffset("E_86_deployed"), datasize("E_86_deployed"))

        return(0, datasize("E_86_deployed"))

        function constructor_C_64() {

        }

        function constructor_E_86() {

            constructor_C_64()

        }

    }
    object "E_86_deployed" {
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
                    let ret_0 :=  fun_x_63()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3bc5de30
                {
                    // getData()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_getData_35()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x5b4b73a9
                {
                    // setData(uint256)

                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_setData_27(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x73d4a13a
                {
                    // data()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_data_5()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd112200e
                {
                    // withGetter()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_withGetter_3()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xe2179b8e
                {
                    // g()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_g_85()
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

            function abi_decode_tuple_t_uint256_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
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

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }

                sum := add(x, y)
            }

            function cleanup_from_storage_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_contract$_C_$64_to_t_address(value) -> converted {
                converted := convert_t_contract$_C_$64_to_t_uint160(value)
            }

            function convert_t_contract$_C_$64_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_3_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_5_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
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

            function fun_compute_49(var_a_37, var_b_39) -> var__42 {
                let zero_t_uint256_13 := zero_value_for_split_t_uint256()
                var__42 := zero_t_uint256_13

                let _14 := var_a_37
                let expr_44 := _14
                let _15 := var_b_39
                let expr_45 := _15
                let expr_46 := checked_add_t_uint256(expr_44, expr_45)

                var__42 := expr_46
                leave

            }

            function fun_g_85() {

                let _9 := allocate_unbounded()
                let _10 := add(_9, datasize("C_64"))
                if or(gt(_10, 0xffffffffffffffff), lt(_10, _9)) { panic_error_0x41() }
                datacopy(_9, dataoffset("C_64"), datasize("C_64"))
                _10 := abi_encode_tuple__to__fromStack(_10)

                let expr_75_address := create(0, _9, sub(_10, _9))

                if iszero(expr_75_address) { revert_forward_1() }

                let var_c_71_address := expr_75_address
                let expr_79_functionIdentifier := 49
                let expr_80 := 0x03
                let expr_81 := 0x05
                let _11 := convert_t_rational_3_by_1_to_t_uint256(expr_80)
                let _12 := convert_t_rational_5_by_1_to_t_uint256(expr_81)
                let expr_82 := fun_compute_49(_11, _12)
                let var_val_78 := expr_82

            }

            function fun_getData_35() -> var__30 {
                let zero_t_uint256_2 := zero_value_for_split_t_uint256()
                var__30 := zero_t_uint256_2

                let _3 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_32 := _3
                var__30 := expr_32
                leave

            }

            function fun_setData_27(var_a_19) {

                let _1 := var_a_19
                let expr_23 := _1
                update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_23)
                let expr_24 := expr_23

            }

            function fun_x_63() -> var__52 {
                let zero_t_uint256_4 := zero_value_for_split_t_uint256()
                var__52 := zero_t_uint256_4

                let expr_55 := 0x03
                let _5 := convert_t_rational_3_by_1_to_t_uint256(expr_55)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _5)
                let expr_56 := _5
                let expr_58_address := address()
                let expr_59_address := convert_t_contract$_C_$64_to_t_address(expr_58_address)
                let expr_59_functionSelector := 0x73d4a13a

                if iszero(extcodesize(expr_59_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _6 := allocate_unbounded()
                mstore(_6, shift_left_224(expr_59_functionSelector))
                let _7 := abi_encode_tuple__to__fromStack(add(_6, 4) )

                let _8 := staticcall(gas(), expr_59_address,  _6, sub(_7, _6), _6, 32)

                if iszero(_8) { revert_forward_1() }

                let expr_60
                if _8 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_6, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_60 :=  abi_decode_tuple_t_uint256_fromMemory(_6, add(_6, returndatasize()))
                }
                var__52 := expr_60
                leave

            }

            function getter_fun_data_5() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_withGetter_3() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

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

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

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

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

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

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }
        /*******************************************************
        *                       WARNING                       *
        *  Solidity to Yul compilation is still EXPERIMENTAL  *
        *       It can result in LOSS OF FUNDS or worse       *
        *                !USE AT YOUR OWN RISK!               *
        *******************************************************/

        object "C_64" {
            code {
                mstore(64, 128)
                if callvalue() { revert(0, 0) }

                constructor_C_64()

                codecopy(0, dataoffset("C_64_deployed"), datasize("C_64_deployed"))

                return(0, datasize("C_64_deployed"))

                function constructor_C_64() {

                }

            }
            object "C_64_deployed" {
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
                            let ret_0 :=  fun_x_63()
                            let memPos := allocate_unbounded()
                            let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                            return(memPos, sub(memEnd, memPos))
                        }

                        case 0x3bc5de30
                        {
                            // getData()

                            if callvalue() { revert(0, 0) }
                            abi_decode_tuple_(4, calldatasize())
                            let ret_0 :=  fun_getData_35()
                            let memPos := allocate_unbounded()
                            let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                            return(memPos, sub(memEnd, memPos))
                        }

                        case 0x5b4b73a9
                        {
                            // setData(uint256)

                            if callvalue() { revert(0, 0) }
                            let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                            fun_setData_27(param_0)
                            let memPos := allocate_unbounded()
                            let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                            return(memPos, sub(memEnd, memPos))
                        }

                        case 0x73d4a13a
                        {
                            // data()

                            if callvalue() { revert(0, 0) }
                            abi_decode_tuple_(4, calldatasize())
                            let ret_0 :=  getter_fun_data_5()
                            let memPos := allocate_unbounded()
                            let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                            return(memPos, sub(memEnd, memPos))
                        }

                        case 0xd112200e
                        {
                            // withGetter()

                            if callvalue() { revert(0, 0) }
                            abi_decode_tuple_(4, calldatasize())
                            let ret_0 :=  getter_fun_withGetter_3()
                            let memPos := allocate_unbounded()
                            let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
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

                    function abi_decode_tuple_t_uint256_fromMemory(headStart, dataEnd) -> value0 {
                        if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                        {

                            let offset := 0

                            value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
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

                    function cleanup_from_storage_t_uint256(value) -> cleaned {
                        cleaned := value
                    }

                    function cleanup_t_uint160(value) -> cleaned {
                        cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
                    }

                    function cleanup_t_uint256(value) -> cleaned {
                        cleaned := value
                    }

                    function convert_t_contract$_C_$64_to_t_address(value) -> converted {
                        converted := convert_t_contract$_C_$64_to_t_uint160(value)
                    }

                    function convert_t_contract$_C_$64_to_t_uint160(value) -> converted {
                        converted := cleanup_t_uint160(value)
                    }

                    function convert_t_rational_3_by_1_to_t_uint256(value) -> converted {
                        converted := cleanup_t_uint256(value)
                    }

                    function convert_t_uint256_to_t_uint256(value) -> converted {
                        converted := cleanup_t_uint256(value)
                    }

                    function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                        value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
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

                    function fun_getData_35() -> var__30 {
                        let zero_t_uint256_2 := zero_value_for_split_t_uint256()
                        var__30 := zero_t_uint256_2

                        let _3 := read_from_storage_split_offset_0_t_uint256(0x01)
                        let expr_32 := _3
                        var__30 := expr_32
                        leave

                    }

                    function fun_setData_27(var_a_19) {

                        let _1 := var_a_19
                        let expr_23 := _1
                        update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_23)
                        let expr_24 := expr_23

                    }

                    function fun_x_63() -> var__52 {
                        let zero_t_uint256_4 := zero_value_for_split_t_uint256()
                        var__52 := zero_t_uint256_4

                        let expr_55 := 0x03
                        let _5 := convert_t_rational_3_by_1_to_t_uint256(expr_55)
                        update_storage_value_offset_0t_uint256_to_t_uint256(0x01, _5)
                        let expr_56 := _5
                        let expr_58_address := address()
                        let expr_59_address := convert_t_contract$_C_$64_to_t_address(expr_58_address)
                        let expr_59_functionSelector := 0x73d4a13a

                        if iszero(extcodesize(expr_59_address)) { revert(0, 0) }

                        // storage for arguments and returned data
                        let _6 := allocate_unbounded()
                        mstore(_6, shift_left_224(expr_59_functionSelector))
                        let _7 := abi_encode_tuple__to__fromStack(add(_6, 4) )

                        let _8 := staticcall(gas(), expr_59_address,  _6, sub(_7, _6), _6, 32)

                        if iszero(_8) { revert_forward_1() }

                        let expr_60
                        if _8 {

                            // update freeMemoryPointer according to dynamic return size
                            finalize_allocation(_6, returndatasize())

                            // decode return parameters from external try-call into retVars
                            expr_60 :=  abi_decode_tuple_t_uint256_fromMemory(_6, add(_6, returndatasize()))
                        }
                        var__52 := expr_60
                        leave

                    }

                    function getter_fun_data_5() -> ret {

                        let slot := 1
                        let offset := 0

                        ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

                    }

                    function getter_fun_withGetter_3() -> ret {

                        let slot := 0
                        let offset := 0

                        ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

                    }

                    function panic_error_0x41() {
                        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                        mstore(4, 0x41)
                        revert(0, 0x24)
                    }

                    function prepare_store_t_uint256(value) -> ret {
                        ret := value
                    }

                    function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                        value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

                    }

                    function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                        value := extract_from_storage_value_offset_0t_uint256(sload(slot))

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

                    function shift_right_unsigned_dynamic(bits, value) -> newValue {
                        newValue :=

                        shr(bits, value)

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

                    function zero_value_for_split_t_uint256() -> ret {
                        ret := 0
                    }

                }

            }

        }

    }

}

