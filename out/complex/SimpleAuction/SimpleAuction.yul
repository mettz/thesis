/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "SimpleAuction_171" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        let _1, _2 := copy_arguments_for_constructor_61_object_SimpleAuction_171()
        constructor_SimpleAuction_171(_1, _2)

        codecopy(0, dataoffset("SimpleAuction_171_deployed"), datasize("SimpleAuction_171_deployed"))

        return(0, datasize("SimpleAuction_171_deployed"))

        function abi_decode_t_address_payable_fromMemory(offset, end) -> value {
            value := mload(offset)
            validator_revert_t_address_payable(value)
        }

        function abi_decode_t_uint256_fromMemory(offset, end) -> value {
            value := mload(offset)
            validator_revert_t_uint256(value)
        }

        function abi_decode_tuple_t_uint256t_address_payable_fromMemory(headStart, dataEnd) -> value0, value1 {
            if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

            {

                let offset := 0

                value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
            }

            {

                let offset := 32

                value1 := abi_decode_t_address_payable_fromMemory(add(headStart, offset), dataEnd)
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

        function constructor_SimpleAuction_171(var__biddingTime_44, var__beneficiary_46) {

            let _3 := var__beneficiary_46
            let expr_50 := _3
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_50)
            let expr_51 := expr_50
            let expr_55 := timestamp()
            let _4 := var__biddingTime_44
            let expr_56 := _4
            let expr_57 := checked_add_t_uint256(expr_55, expr_56)

            update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_57)
            let expr_58 := expr_57

        }

        function convert_t_address_payable_to_t_address_payable(value) -> converted {
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

        function copy_arguments_for_constructor_61_object_SimpleAuction_171() -> ret_param_0, ret_param_1 {
            let programSize := datasize("SimpleAuction_171")
            let argSize := sub(codesize(), programSize)

            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)

            ret_param_0, ret_param_1 := abi_decode_tuple_t_uint256t_address_payable_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
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
    object "SimpleAuction_171_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x1998aeef
                {
                    // bid()

                    abi_decode_tuple_(4, calldatasize())
                    fun_bid_111()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2a24f46c
                {
                    // auctionEnd()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_auctionEnd_170()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x38af3eed
                {
                    // beneficiary()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_beneficiary_3()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3ccfd60b
                {
                    // withdraw()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_withdraw_159()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x4b449cba
                {
                    // auctionEndTime()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_auctionEndTime_5()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x91f90157
                {
                    // highestBidder()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_highestBidder_7()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd57bde79
                {
                    // highestBid()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_highestBid_9()
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

            function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
                mstore(pos, cleanup_t_address_payable(value))
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

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_payable_to_t_address_payable_fromStack(value0,  add(headStart, 0))

            }

            function abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function abi_encode_tuple_t_bool__to_t_bool__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

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

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
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

            function convert_t_address_to_t_address_payable(value) -> converted {
                converted := convert_t_uint160_to_t_address_payable(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
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

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_address_payable(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_uint256(slot_value, offset) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_address_payable(slot_value) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }

            function fun_auctionEnd_170() {

                let _30 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_163 := _30
                let expr_165_address := convert_t_address_payable_to_t_address(expr_163)
                let _31 := read_from_storage_split_offset_0_t_uint256(0x03)
                let expr_166 := _31

                let _32 := 0
                if iszero(expr_166) { _32 := 2300 }
                let _33 := call(_32, expr_165_address, expr_166, 0, 0, 0, 0)

                if iszero(_33) { revert_forward_1() }

            }

            function fun_bid_111() {

                let expr_66 := timestamp()
                let _1 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_67 := _1
                let expr_68 := gt(cleanup_t_uint256(expr_66), cleanup_t_uint256(expr_67))
                if expr_68 {
                    {
                        let _2 := allocate_unbounded()
                        mstore(_2, 94163170854030375908502225929900872049050330352117045565757026277049499648000)
                        let _3 := abi_encode_tuple__to__fromStack(add(_2, 4) )
                        revert(_2, sub(_3, _2))
                }}
                let expr_74 := callvalue()
                let _4 := read_from_storage_split_offset_0_t_uint256(0x03)
                let expr_75 := _4
                let expr_76 := iszero(gt(cleanup_t_uint256(expr_74), cleanup_t_uint256(expr_75)))
                if expr_76 {
                    let _5 := read_from_storage_split_offset_0_t_uint256(0x03)
                    let expr_78 := _5
                    {
                        let _6 := allocate_unbounded()
                        mstore(_6, 35313542515215746547032400360461210195911352197133756396710621872584608710656)
                        let _7 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(add(_6, 4) , expr_78)
                        revert(_6, sub(_7, _6))
                }}
                let _8 := read_from_storage_split_offset_0_t_uint256(0x03)
                let expr_82 := _8
                let expr_83 := 0x00
                let expr_84 := iszero(eq(cleanup_t_uint256(expr_82), convert_t_rational_0_by_1_to_t_uint256(expr_83)))
                if expr_84 {
                    let _9 := read_from_storage_split_offset_0_t_uint256(0x03)
                    let expr_88 := _9
                    let _10 := 0x04
                    let expr_85 := _10
                    let _11 := read_from_storage_split_offset_0_t_address(0x02)
                    let expr_86 := _11
                    let _12 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_85,expr_86)
                    let _13 := read_from_storage_split_offset_0_t_uint256(_12)
                    expr_88 := checked_add_t_uint256(_13, expr_88)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_12, expr_88)
                    let expr_89 := expr_88
                }
                let expr_95 := caller()
                update_storage_value_offset_0t_address_to_t_address(0x02, expr_95)
                let expr_96 := expr_95
                let expr_100 := callvalue()
                update_storage_value_offset_0t_uint256_to_t_uint256(0x03, expr_100)
                let expr_101 := expr_100
                let expr_105 := caller()
                let expr_107 := callvalue()
                let _14 := 0xf4757a49b326036464bec6fe419a4ae38c8a02ce3e68bf0809674f6aab8ad300
                {
                    let _15 := allocate_unbounded()
                    let _16 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(_15 , expr_105, expr_107)
                    log1(_15, sub(_16, _15) , _14)
                }
            }

            function fun_withdraw_159() -> var__115 {
                let zero_t_bool_17 := zero_value_for_split_t_bool()
                var__115 := zero_t_bool_17

                let _18 := 0x04
                let expr_119 := _18
                let expr_121 := caller()
                let _19 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_119,expr_121)
                let _20 := read_from_storage_split_offset_0_t_uint256(_19)
                let expr_122 := _20
                let var_amount_118 := expr_122
                let _21 := var_amount_118
                let expr_124 := _21
                let expr_125 := 0x00
                let expr_126 := gt(cleanup_t_uint256(expr_124), convert_t_rational_0_by_1_to_t_uint256(expr_125))
                if expr_126 {
                    let expr_131 := 0x00
                    let _22 := convert_t_rational_0_by_1_to_t_uint256(expr_131)
                    let _23 := 0x04
                    let expr_127 := _23
                    let expr_129 := caller()
                    let _24 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_127,expr_129)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_24, _22)
                    let expr_132 := _22
                    let expr_137 := caller()
                    let expr_138 := convert_t_address_to_t_address_payable(expr_137)
                    let expr_139_address := convert_t_address_payable_to_t_address(expr_138)
                    let _25 := var_amount_118
                    let expr_140 := _25

                    let _26 := 0
                    if iszero(expr_140) { _26 := 2300 }
                    let expr_141 := call(_26, expr_139_address, expr_140, 0, 0, 0, 0)

                    let expr_142 := cleanup_t_bool(iszero(expr_141))
                    if expr_142 {
                        let _27 := var_amount_118
                        let expr_147 := _27
                        let _28 := 0x04
                        let expr_143 := _28
                        let expr_145 := caller()
                        let _29 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_143,expr_145)
                        update_storage_value_offset_0t_uint256_to_t_uint256(_29, expr_147)
                        let expr_148 := expr_147
                        let expr_150 := 0x00
                        var__115 := expr_150
                        leave
                    }
                }
                let expr_156 := 0x01
                var__115 := expr_156
                leave

            }

            function getter_fun_auctionEndTime_5() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_beneficiary_3() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function getter_fun_highestBid_9() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_highestBidder_7() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_address_payable(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address_payable(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_uint256(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_uint256(sload(slot), offset)

            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            function read_from_storage_split_offset_0_t_address_payable(slot) -> value {
                value := extract_from_storage_value_offset_0t_address_payable(sload(slot))

            }

            function read_from_storage_split_offset_0_t_uint256(slot) -> value {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))

            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
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

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

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

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

        }

    }

}

