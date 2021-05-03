/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "BlindAuction_376" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        let _1, _2, _3 := copy_arguments_for_constructor_104_object_BlindAuction_376()
        constructor_BlindAuction_376(_1, _2, _3)

        codecopy(0, dataoffset("BlindAuction_376_deployed"), datasize("BlindAuction_376_deployed"))

        return(0, datasize("BlindAuction_376_deployed"))

        function abi_decode_t_address_payable_fromMemory(offset, end) -> value {
            value := mload(offset)
            validator_revert_t_address_payable(value)
        }

        function abi_decode_t_uint256_fromMemory(offset, end) -> value {
            value := mload(offset)
            validator_revert_t_uint256(value)
        }

        function abi_decode_tuple_t_uint256t_uint256t_address_payable_fromMemory(headStart, dataEnd) -> value0, value1, value2 {
            if slt(sub(dataEnd, headStart), 96) { revert(0, 0) }

            {

                let offset := 0

                value0 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
            }

            {

                let offset := 32

                value1 := abi_decode_t_uint256_fromMemory(add(headStart, offset), dataEnd)
            }

            {

                let offset := 64

                value2 := abi_decode_t_address_payable_fromMemory(add(headStart, offset), dataEnd)
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

        function cleanup_from_storage_t_uint256(value) -> cleaned {
            cleaned := value
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

        function constructor_BlindAuction_376(var__biddingTime_79, var__revealTime_81, var__beneficiary_83) {

            let _4 := var__beneficiary_83
            let expr_87 := _4
            update_storage_value_offset_0t_address_payable_to_t_address_payable(0x00, expr_87)
            let expr_88 := expr_87
            let expr_92 := timestamp()
            let _5 := var__biddingTime_79
            let expr_93 := _5
            let expr_94 := checked_add_t_uint256(expr_92, expr_93)

            update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_94)
            let expr_95 := expr_94
            let _6 := read_from_storage_split_offset_0_t_uint256(0x01)
            let expr_98 := _6
            let _7 := var__revealTime_81
            let expr_99 := _7
            let expr_100 := checked_add_t_uint256(expr_98, expr_99)

            update_storage_value_offset_0t_uint256_to_t_uint256(0x02, expr_100)
            let expr_101 := expr_100

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

        function copy_arguments_for_constructor_104_object_BlindAuction_376() -> ret_param_0, ret_param_1, ret_param_2 {
            let programSize := datasize("BlindAuction_376")
            let argSize := sub(codesize(), programSize)

            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)

            ret_param_0, ret_param_1, ret_param_2 := abi_decode_tuple_t_uint256t_uint256t_address_payable_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
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

        function read_from_storage_split_offset_0_t_uint256(slot) -> value {
            value := extract_from_storage_value_offset_0t_uint256(sload(slot))

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
    object "BlindAuction_376_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x01495c1c
                {
                    // bids(address,uint256)

                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_addresst_uint256(4, calldatasize())
                    let ret_0, ret_1 :=  getter_fun_bids_20(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bytes32_t_uint256__to_t_bytes32_t_uint256__fromStack(memPos , ret_0, ret_1)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x12fa6feb
                {
                    // ended()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_ended_14()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_bool__to_t_bool__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x2a24f46c
                {
                    // auctionEnd()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_auctionEnd_334()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x38af3eed
                {
                    // beneficiary()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_beneficiary_8()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x3ccfd60b
                {
                    // withdraw()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    fun_withdraw_306()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x423b217f
                {
                    // biddingEnd()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_biddingEnd_10()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x900f080a
                {
                    // reveal(uint256[],bool[],bytes32[])

                    if callvalue() { revert(0, 0) }
                    let param_0, param_1, param_2 :=  abi_decode_tuple_t_array$_t_uint256_$dyn_memory_ptrt_array$_t_bool_$dyn_memory_ptrt_array$_t_bytes32_$dyn_memory_ptr(4, calldatasize())
                    fun_reveal_273(param_0, param_1, param_2)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x91f90157
                {
                    // highestBidder()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_highestBidder_22()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x957bb1e0
                {
                    // bid(bytes32)

                    let param_0 :=  abi_decode_tuple_t_bytes32(4, calldatasize())
                    fun_bid_126(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xa6e66477
                {
                    // revealEnd()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_revealEnd_12()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd57bde79
                {
                    // highestBid()

                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_highestBid_24()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            // bool[]
            function abi_decode_available_length_t_array$_t_bool_$dyn_memory_ptr(offset, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_array$_t_bool_$dyn_memory_ptr(length))
                let dst := array

                mstore(array, length)
                dst := add(array, 0x20)

                let src := offset
                if gt(add(src, mul(length, 0x20)), end) {
                    revert(0, 0)
                }
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {

                    let elementPos := src

                    mstore(dst, abi_decode_t_bool(elementPos, end))
                    dst := add(dst, 0x20)
                    src := add(src, 0x20)
                }
            }

            // bytes32[]
            function abi_decode_available_length_t_array$_t_bytes32_$dyn_memory_ptr(offset, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_array$_t_bytes32_$dyn_memory_ptr(length))
                let dst := array

                mstore(array, length)
                dst := add(array, 0x20)

                let src := offset
                if gt(add(src, mul(length, 0x20)), end) {
                    revert(0, 0)
                }
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {

                    let elementPos := src

                    mstore(dst, abi_decode_t_bytes32(elementPos, end))
                    dst := add(dst, 0x20)
                    src := add(src, 0x20)
                }
            }

            // uint256[]
            function abi_decode_available_length_t_array$_t_uint256_$dyn_memory_ptr(offset, length, end) -> array {
                array := allocate_memory(array_allocation_size_t_array$_t_uint256_$dyn_memory_ptr(length))
                let dst := array

                mstore(array, length)
                dst := add(array, 0x20)

                let src := offset
                if gt(add(src, mul(length, 0x20)), end) {
                    revert(0, 0)
                }
                for { let i := 0 } lt(i, length) { i := add(i, 1) }
                {

                    let elementPos := src

                    mstore(dst, abi_decode_t_uint256(elementPos, end))
                    dst := add(dst, 0x20)
                    src := add(src, 0x20)
                }
            }

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            // bool[]
            function abi_decode_t_array$_t_bool_$dyn_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := abi_decode_available_length_t_array$_t_bool_$dyn_memory_ptr(add(offset, 0x20), length, end)
            }

            // bytes32[]
            function abi_decode_t_array$_t_bytes32_$dyn_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := abi_decode_available_length_t_array$_t_bytes32_$dyn_memory_ptr(add(offset, 0x20), length, end)
            }

            // uint256[]
            function abi_decode_t_array$_t_uint256_$dyn_memory_ptr(offset, end) -> array {
                if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
                let length := calldataload(offset)
                array := abi_decode_available_length_t_array$_t_uint256_$dyn_memory_ptr(add(offset, 0x20), length, end)
            }

            function abi_decode_t_bool(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bool(value)
            }

            function abi_decode_t_bytes32(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_bytes32(value)
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }

            }

            function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_array$_t_uint256_$dyn_memory_ptrt_array$_t_bool_$dyn_memory_ptrt_array$_t_bytes32_$dyn_memory_ptr(headStart, dataEnd) -> value0, value1, value2 {
                if slt(sub(dataEnd, headStart), 96) { revert(0, 0) }

                {

                    let offset := calldataload(add(headStart, 0))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }

                    value0 := abi_decode_t_array$_t_uint256_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 32))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }

                    value1 := abi_decode_t_array$_t_bool_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

                {

                    let offset := calldataload(add(headStart, 64))
                    if gt(offset, 0xffffffffffffffff) { revert(0, 0) }

                    value2 := abi_decode_t_array$_t_bytes32_$dyn_memory_ptr(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_bytes32(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
                }

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

            function abi_encode_t_bool_to_t_bool_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_bool(cleanup_t_bool(value)))
            }

            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
                mstore(pos, cleanup_t_bytes32(value))
            }

            function abi_encode_t_bytes32_to_t_bytes32_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_bytes32(cleanup_t_bytes32(value)))
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value, pos) {
                mstore(pos, leftAlign_t_uint256(cleanup_t_uint256(value)))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_packed_t_uint256_t_bool_t_bytes32__to_t_uint256_t_bool_t_bytes32__nonPadded_inplace_fromStack(pos , value0, value1, value2) -> end {

                abi_encode_t_uint256_to_t_uint256_nonPadded_inplace_fromStack(value0,  pos)
                pos := add(pos, 32)

                abi_encode_t_bool_to_t_bool_nonPadded_inplace_fromStack(value1,  pos)
                pos := add(pos, 1)

                abi_encode_t_bytes32_to_t_bytes32_nonPadded_inplace_fromStack(value2,  pos)
                pos := add(pos, 32)

                end := pos
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

            function abi_encode_tuple_t_bytes32_t_uint256__to_t_bytes32_t_uint256__fromStack(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function allocate_memory(size) -> memPtr {
                memPtr := allocate_unbounded()
                finalize_allocation(memPtr, size)
            }

            function allocate_memory_struct_t_struct$_Bid_$6_storage_ptr() -> memPtr {
                memPtr := allocate_memory(64)
            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function array_allocation_size_t_array$_t_bool_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            function array_allocation_size_t_array$_t_bytes32_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            function array_allocation_size_t_array$_t_uint256_$dyn_memory_ptr(length) -> size {
                // Make sure we can allocate memory without overflow
                if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

                size := mul(length, 0x20)

                // add length slot
                size := add(size, 0x20)

            }

            function array_dataslot_t_array$_t_struct$_Bid_$6_storage_$dyn_storage(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_dataslot_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_ptr(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_dataslot_t_bytes_memory_ptr(ptr) -> data {
                data := ptr

                data := add(ptr, 0x20)

            }

            function array_dataslot_t_bytes_storage_ptr(ptr) -> data {
                data := ptr

                mstore(0, ptr)
                data := keccak256(0, 0x20)

            }

            function array_length_t_array$_t_bool_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_length_t_array$_t_bytes32_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_length_t_array$_t_struct$_Bid_$6_storage_$dyn_storage(value) -> length {

                length := sload(value)

            }

            function array_length_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_ptr(value) -> length {

                length := sload(value)

            }

            function array_length_t_array$_t_uint256_$dyn_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_length_t_bytes_memory_ptr(value) -> length {

                length := mload(value)

            }

            function array_push_from_t_struct$_Bid_$6_memory_ptr_to_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_ptr(array , value0) {

                let oldLen := sload(array)
                if iszero(lt(oldLen, 18446744073709551616)) { panic_error_0x41() }
                sstore(array, add(oldLen, 1))
                let slot, offset := storage_array_index_access_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_ptr(array, oldLen)
                update_storage_value_t_struct$_Bid_$6_memory_ptr_to_t_struct$_Bid_$6_storage(slot, offset , value0)

            }
            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }

                sum := add(x, y)
            }

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error_0x11() }

                diff := sub(x, y)
            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_address_payable(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_from_storage_t_bool(value) -> cleaned {
                cleaned := and(value, 0xff)
            }

            function cleanup_from_storage_t_bytes32(value) -> cleaned {
                cleaned := value
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

            function cleanup_t_bytes32(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_rational_0_by_1(value) -> cleaned {
                cleaned := value
            }

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_array_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_to_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_ptr(value) -> converted  {
                converted := value

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

            function convert_t_bool_to_t_bool(value) -> converted {
                converted := cleanup_t_bool(value)
            }

            function convert_t_bytes32_to_t_bytes32(value) -> converted {
                converted := cleanup_t_bytes32(value)
            }

            function convert_t_rational_0_by_1_to_t_address(value) -> converted {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_bytes32(value) -> converted {
                converted := shift_left_0(cleanup_t_rational_0_by_1(value))
            }

            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(value)
            }

            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_struct$_Bid_$6_storage_to_t_struct$_Bid_$6_storage_ptr(value) -> converted {
                converted := value
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

            function copy_struct_to_storage_from_t_struct$_Bid_$6_memory_ptr_to_t_struct$_Bid_$6_storage(slot, value) {

                {

                    let memberSlot := add(slot, 0)
                    let memberSrcPtr := add(value, 0)

                    let memberValue_0 := read_from_memoryt_bytes32(memberSrcPtr)

                    update_storage_value_offset_0t_bytes32_to_t_bytes32(memberSlot, memberValue_0)

                }

                {

                    let memberSlot := add(slot, 1)
                    let memberSrcPtr := add(value, 32)

                    let memberValue_0 := read_from_memoryt_uint256(memberSrcPtr)

                    update_storage_value_offset_0t_uint256_to_t_uint256(memberSlot, memberValue_0)

                }

            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_address_payable(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address_payable(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function extract_from_storage_value_dynamict_bool(slot_value, offset) -> value {
                value := cleanup_from_storage_t_bool(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
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

            function extract_from_storage_value_offset_0t_bool(slot_value) -> value {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }

            function extract_from_storage_value_offset_0t_bytes32(slot_value) -> value {
                value := cleanup_from_storage_t_bytes32(shift_right_0_unsigned(slot_value))
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

            function fun_auctionEnd_334() {

                modifier_onlyAfter_311()
            }

            function fun_auctionEnd_334_inner() {

                let _94 := read_from_storage_split_offset_0_t_bool(0x03)
                let expr_313 := _94
                if expr_313 {
                    {
                        let _95 := allocate_unbounded()
                        mstore(_95, 44241608725249032605828090844811379244272315599854317367511008743190484221952)
                        let _96 := abi_encode_tuple__to__fromStack(add(_95, 4) )
                        revert(_95, sub(_96, _95))
                }}
                let _97 := read_from_storage_split_offset_0_t_address(0x05)
                let expr_319 := _97
                let _98 := read_from_storage_split_offset_0_t_uint256(0x06)
                let expr_320 := _98
                let _99 := 0xdaec4582d5d9595688c8c98545fdd1c696d41c6aeaeb636737e84ed2f5c00eda
                {
                    let _100 := allocate_unbounded()
                    let _101 := abi_encode_tuple_t_address_t_uint256__to_t_address_t_uint256__fromStack(_100 , expr_319, expr_320)
                    log1(_100, sub(_101, _100) , _99)
                }let expr_324 := 0x01
                update_storage_value_offset_0t_bool_to_t_bool(0x03, expr_324)
                let expr_325 := expr_324
                let _102 := read_from_storage_split_offset_0_t_address_payable(0x00)
                let expr_327 := _102
                let expr_329_address := convert_t_address_payable_to_t_address(expr_327)
                let _103 := read_from_storage_split_offset_0_t_uint256(0x06)
                let expr_330 := _103

                let _104 := 0
                if iszero(expr_330) { _104 := 2300 }
                let _105 := call(_104, expr_329_address, expr_330, 0, 0, 0, 0)

                if iszero(_105) { revert_forward_1() }

            }

            function fun_bid_126(var__blindedBid_107) {

                modifier_onlyBefore_111(var__blindedBid_107)
            }

            function fun_bid_126_inner(var__blindedBid_107) {

                let _7 := 0x04
                let expr_113 := _7
                let expr_115 := caller()
                let _8 := mapping_index_access_t_mapping$_t_address_$_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_$_of_t_address(expr_113,expr_115)
                let _9_slot := _8
                let expr_116_slot := _9_slot
                let expr_117_self_slot := convert_array_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_to_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_ptr(expr_116_slot)
                let _10 := var__blindedBid_107
                let expr_119 := _10
                let expr_121 := callvalue()
                let expr_122_mpos := allocate_memory_struct_t_struct$_Bid_$6_storage_ptr()
                write_to_memory_t_bytes32(add(expr_122_mpos, 0), expr_119)
                write_to_memory_t_uint256(add(expr_122_mpos, 32), expr_121)
                array_push_from_t_struct$_Bid_$6_memory_ptr_to_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_ptr(expr_117_self_slot, expr_122_mpos)

            }

            function fun_placeBid_375(var_bidder_336, var_value_338) -> var_success_341 {
                let zero_t_bool_106 := zero_value_for_split_t_bool()
                var_success_341 := zero_t_bool_106

                let _107 := var_value_338
                let expr_343 := _107
                let _108 := read_from_storage_split_offset_0_t_uint256(0x06)
                let expr_344 := _108
                let expr_345 := iszero(gt(cleanup_t_uint256(expr_343), cleanup_t_uint256(expr_344)))
                if expr_345 {
                    let expr_346 := 0x00
                    var_success_341 := expr_346
                    leave
                }
                let _109 := read_from_storage_split_offset_0_t_address(0x05)
                let expr_350 := _109
                let expr_353 := 0x00
                let expr_354 := convert_t_rational_0_by_1_to_t_address(expr_353)
                let expr_355 := iszero(eq(cleanup_t_address(expr_350), cleanup_t_address(expr_354)))
                if expr_355 {
                    let _110 := read_from_storage_split_offset_0_t_uint256(0x06)
                    let expr_359 := _110
                    let _111 := 0x07
                    let expr_356 := _111
                    let _112 := read_from_storage_split_offset_0_t_address(0x05)
                    let expr_357 := _112
                    let _113 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_356,expr_357)
                    let _114 := read_from_storage_split_offset_0_t_uint256(_113)
                    expr_359 := checked_add_t_uint256(_114, expr_359)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_113, expr_359)
                    let expr_360 := expr_359
                }
                let _115 := var_value_338
                let expr_365 := _115
                update_storage_value_offset_0t_uint256_to_t_uint256(0x06, expr_365)
                let expr_366 := expr_365
                let _116 := var_bidder_336
                let expr_369 := _116
                update_storage_value_offset_0t_address_to_t_address(0x05, expr_369)
                let expr_370 := expr_369
                let expr_372 := 0x01
                var_success_341 := expr_372
                leave

            }

            function fun_reveal_273(var__values_130_mpos, var__fake_133_mpos, var__secret_136_mpos) {

                modifier_onlyAfter_140(var__values_130_mpos, var__fake_133_mpos, var__secret_136_mpos)
            }

            function fun_reveal_273_inner(var__values_130_mpos, var__fake_133_mpos, var__secret_136_mpos) {

                let _23 := 0x04
                let expr_147 := _23
                let expr_149 := caller()
                let _24 := mapping_index_access_t_mapping$_t_address_$_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_$_of_t_address(expr_147,expr_149)
                let _25_slot := _24
                let expr_150_slot := _25_slot
                let expr_151 := array_length_t_array$_t_struct$_Bid_$6_storage_$dyn_storage(expr_150_slot)
                let var_length_146 := expr_151
                let _26_mpos := var__values_130_mpos
                let expr_154_mpos := _26_mpos
                let expr_155 := array_length_t_array$_t_uint256_$dyn_memory_ptr(expr_154_mpos)
                let _27 := var_length_146
                let expr_156 := _27
                let expr_157 := eq(cleanup_t_uint256(expr_155), cleanup_t_uint256(expr_156))
                require_helper(expr_157)
                let _28_mpos := var__fake_133_mpos
                let expr_161_mpos := _28_mpos
                let expr_162 := array_length_t_array$_t_bool_$dyn_memory_ptr(expr_161_mpos)
                let _29 := var_length_146
                let expr_163 := _29
                let expr_164 := eq(cleanup_t_uint256(expr_162), cleanup_t_uint256(expr_163))
                require_helper(expr_164)
                let _30_mpos := var__secret_136_mpos
                let expr_168_mpos := _30_mpos
                let expr_169 := array_length_t_array$_t_bytes32_$dyn_memory_ptr(expr_168_mpos)
                let _31 := var_length_146
                let expr_170 := _31
                let expr_171 := eq(cleanup_t_uint256(expr_169), cleanup_t_uint256(expr_170))
                require_helper(expr_171)
                let var_refund_175
                let zero_t_uint256_32 := zero_value_for_split_t_uint256()
                var_refund_175 := zero_t_uint256_32
                for {
                    let expr_179 := 0x00
                    let var_i_178 := convert_t_rational_0_by_1_to_t_uint256(expr_179)
                    } 1 {
                    let _34 := var_i_178
                    let _33 := increment_t_uint256(_34)
                    var_i_178 := _33
                    let expr_185 := _34
                }
                {
                    let _35 := var_i_178
                    let expr_181 := _35
                    let _36 := var_length_146
                    let expr_182 := _36
                    let expr_183 := lt(cleanup_t_uint256(expr_181), cleanup_t_uint256(expr_182))
                    if iszero(expr_183) { break }
                    let _37 := 0x04
                    let expr_190 := _37
                    let expr_192 := caller()
                    let _38 := mapping_index_access_t_mapping$_t_address_$_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_$_of_t_address(expr_190,expr_192)
                    let _39_slot := _38
                    let expr_193_slot := _39_slot
                    let _40 := var_i_178
                    let expr_194 := _40

                    let _41, _42 := storage_array_index_access_t_array$_t_struct$_Bid_$6_storage_$dyn_storage(expr_193_slot, expr_194)
                    let _43_slot := _41
                    let expr_195_slot := _43_slot
                    let var_bidToCheck_189_slot := convert_t_struct$_Bid_$6_storage_to_t_struct$_Bid_$6_storage_ptr(expr_195_slot)
                    let _44_mpos := var__values_130_mpos
                    let expr_203_mpos := _44_mpos
                    let _45 := var_i_178
                    let expr_204 := _45
                    let _46 := read_from_memoryt_uint256(memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(expr_203_mpos, expr_204))
                    let expr_205 := _46
                    let expr_212_component_1 := expr_205
                    let _47_mpos := var__fake_133_mpos
                    let expr_206_mpos := _47_mpos
                    let _48 := var_i_178
                    let expr_207 := _48
                    let _49 := read_from_memoryt_bool(memory_array_index_access_t_array$_t_bool_$dyn_memory_ptr(expr_206_mpos, expr_207))
                    let expr_208 := _49
                    let expr_212_component_2 := expr_208
                    let _50_mpos := var__secret_136_mpos
                    let expr_209_mpos := _50_mpos
                    let _51 := var_i_178
                    let expr_210 := _51
                    let _52 := read_from_memoryt_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_209_mpos, expr_210))
                    let expr_211 := _52
                    let expr_212_component_3 := expr_211
                    let var_value_198 := expr_212_component_1
                    let var_fake_200 := expr_212_component_2
                    let var_secret_202 := expr_212_component_3
                    let _53_slot := var_bidToCheck_189_slot
                    let expr_214_slot := _53_slot
                    let _54 := add(expr_214_slot, 0)
                    let _55 := read_from_storage_split_offset_0_t_bytes32(_54)
                    let expr_215 := _55
                    let _56 := var_value_198
                    let expr_219 := _56
                    let _57 := var_fake_200
                    let expr_220 := _57
                    let _58 := var_secret_202
                    let expr_221 := _58

                    let expr_222_mpos := allocate_unbounded()
                    let _59 := add(expr_222_mpos, 0x20)

                    let _60 := abi_encode_tuple_packed_t_uint256_t_bool_t_bytes32__to_t_uint256_t_bool_t_bytes32__nonPadded_inplace_fromStack(_59, expr_219, expr_220, expr_221)
                    mstore(expr_222_mpos, sub(_60, add(expr_222_mpos, 0x20)))
                    finalize_allocation(expr_222_mpos, sub(_60, expr_222_mpos))
                    let expr_223 := keccak256(array_dataslot_t_bytes_memory_ptr(expr_222_mpos), array_length_t_bytes_memory_ptr(expr_222_mpos))
                    let expr_224 := iszero(eq(cleanup_t_bytes32(expr_215), cleanup_t_bytes32(expr_223)))
                    if expr_224 {
                        continue
                    }
                    let _61_slot := var_bidToCheck_189_slot
                    let expr_229_slot := _61_slot
                    let _62 := add(expr_229_slot, 1)
                    let _63 := read_from_storage_split_offset_0_t_uint256(_62)
                    let expr_230 := _63
                    let _64 := var_refund_175
                    expr_230 := checked_add_t_uint256(_64, expr_230)
                    var_refund_175 := expr_230
                    let expr_231 := expr_230
                    let _65 := var_fake_200
                    let expr_233 := _65
                    let expr_234 := cleanup_t_bool(iszero(expr_233))
                    let expr_239 := expr_234
                    if expr_239 {
                        let _66_slot := var_bidToCheck_189_slot
                        let expr_235_slot := _66_slot
                        let _67 := add(expr_235_slot, 1)
                        let _68 := read_from_storage_split_offset_0_t_uint256(_67)
                        let expr_236 := _68
                        let _69 := var_value_198
                        let expr_237 := _69
                        let expr_238 := iszero(lt(cleanup_t_uint256(expr_236), cleanup_t_uint256(expr_237)))
                        expr_239 := expr_238
                    }
                    if expr_239 {
                        let expr_240_functionIdentifier := 375
                        let expr_242 := caller()
                        let _70 := var_value_198
                        let expr_243 := _70
                        let expr_244 := fun_placeBid_375(expr_242, expr_243)
                        if expr_244 {
                            let _71 := var_value_198
                            let expr_246 := _71
                            let _72 := var_refund_175
                            expr_246 := checked_sub_t_uint256(_72, expr_246)
                            var_refund_175 := expr_246
                            let expr_247 := expr_246
                        }
                    }
                    let expr_257 := 0x00
                    let expr_258 := convert_t_rational_0_by_1_to_t_bytes32(expr_257)
                    let _73_slot := var_bidToCheck_189_slot
                    let expr_252_slot := _73_slot
                    let _74 := add(expr_252_slot, 0)
                    update_storage_value_offset_0t_bytes32_to_t_bytes32(_74, expr_258)
                    let expr_259 := expr_258
                }
                let expr_266 := caller()
                let expr_267 := convert_t_address_to_t_address_payable(expr_266)
                let expr_268_address := convert_t_address_payable_to_t_address(expr_267)
                let _75 := var_refund_175
                let expr_269 := _75

                let _76 := 0
                if iszero(expr_269) { _76 := 2300 }
                let _77 := call(_76, expr_268_address, expr_269, 0, 0, 0, 0)

                if iszero(_77) { revert_forward_1() }

            }

            function fun_withdraw_306() {

                let _78 := 0x07
                let expr_279 := _78
                let expr_281 := caller()
                let _79 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_279,expr_281)
                let _80 := read_from_storage_split_offset_0_t_uint256(_79)
                let expr_282 := _80
                let var_amount_278 := expr_282
                let _81 := var_amount_278
                let expr_284 := _81
                let expr_285 := 0x00
                let expr_286 := gt(cleanup_t_uint256(expr_284), convert_t_rational_0_by_1_to_t_uint256(expr_285))
                if expr_286 {
                    let expr_291 := 0x00
                    let _82 := convert_t_rational_0_by_1_to_t_uint256(expr_291)
                    let _83 := 0x07
                    let expr_287 := _83
                    let expr_289 := caller()
                    let _84 := mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(expr_287,expr_289)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_84, _82)
                    let expr_292 := _82
                    let expr_297 := caller()
                    let expr_298 := convert_t_address_to_t_address_payable(expr_297)
                    let expr_299_address := convert_t_address_payable_to_t_address(expr_298)
                    let _85 := var_amount_278
                    let expr_300 := _85

                    let _86 := 0
                    if iszero(expr_300) { _86 := 2300 }
                    let _87 := call(_86, expr_299_address, expr_300, 0, 0, 0, 0)

                    if iszero(_87) { revert_forward_1() }

                }

            }

            function getter_fun_beneficiary_8() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address_payable(slot, offset)

            }

            function getter_fun_biddingEnd_10() -> ret {

                let slot := 1
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_bids_20(key_0, key_1) -> ret_0, ret_1 {

                let slot := 4
                let offset := 0

                slot := mapping_index_access_t_mapping$_t_address_$_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_$_of_t_address(slot, key_0)

                if iszero(lt(key_1, array_length_t_array$_t_struct$_Bid_$6_storage_$dyn_storage(slot))) { revert(0, 0) }

                slot, offset := storage_array_index_access_t_array$_t_struct$_Bid_$6_storage_$dyn_storage(slot, key_1)

                ret_0 := read_from_storage_split_offset_0_t_bytes32(add(slot, 0))

                ret_1 := read_from_storage_split_offset_0_t_uint256(add(slot, 1))

            }

            function getter_fun_ended_14() -> ret {

                let slot := 3
                let offset := 0

                ret := read_from_storage_split_dynamic_t_bool(slot, offset)

            }

            function getter_fun_highestBid_24() -> ret {

                let slot := 6
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function getter_fun_highestBidder_22() -> ret {

                let slot := 5
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }

            function getter_fun_revealEnd_12() -> ret {

                let slot := 2
                let offset := 0

                ret := read_from_storage_split_dynamic_t_uint256(slot, offset)

            }

            function increment_t_uint256(value) -> ret {
                value := cleanup_t_uint256(value)
                if eq(value, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) { panic_error_0x11() }
                ret := add(value, 1)
            }

            function leftAlign_t_bool(value) -> aligned {
                aligned := leftAlign_t_uint8(value)
            }

            function leftAlign_t_bytes32(value) -> aligned {
                aligned := value
            }

            function leftAlign_t_uint256(value) -> aligned {
                aligned := value
            }

            function leftAlign_t_uint8(value) -> aligned {
                aligned := shift_left_248(value)
            }

            function long_byte_array_index_access_no_checks(array, index) -> slot, offset {

                offset := sub(31, mod(index, 0x20))
                let dataArea := array_dataslot_t_bytes_storage_ptr(array)
                slot := add(dataArea, div(index, 0x20))

            }

            function mapping_index_access_t_mapping$_t_address_$_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function mapping_index_access_t_mapping$_t_address_$_t_uint256_$_of_t_address(slot , key) -> dataSlot {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }

            function memory_array_index_access_t_array$_t_bool_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_bool_$dyn_memory_ptr(baseRef))) {
                    panic_error_0x32()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_bytes32_$dyn_memory_ptr(baseRef))) {
                    panic_error_0x32()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function memory_array_index_access_t_array$_t_uint256_$dyn_memory_ptr(baseRef, index) -> addr {
                if iszero(lt(index, array_length_t_array$_t_uint256_$dyn_memory_ptr(baseRef))) {
                    panic_error_0x32()
                }

                let offset := mul(index, 32)

                offset := add(offset, 32)

                addr := add(baseRef, offset)
            }

            function modifier_onlyAfter_140(var__values_130_mpos, var__fake_133_mpos, var__secret_136_mpos) {

                let _11 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_139 := _11
                let _12 := expr_139
                let var__time_64 := _12

                let expr_67 := timestamp()
                let _13 := var__time_64
                let expr_68 := _13
                let expr_69 := iszero(gt(cleanup_t_uint256(expr_67), cleanup_t_uint256(expr_68)))
                if expr_69 {
                    let _14 := var__time_64
                    let expr_71 := _14
                    {
                        let _15 := allocate_unbounded()
                        mstore(_15, 19091908490143049560467913968745328851371417287440725826973055816145204936704)
                        let _16 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(add(_15, 4) , expr_71)
                        revert(_15, sub(_16, _15))
                }}
                modifier_onlyBefore_143(var__values_130_mpos, var__fake_133_mpos, var__secret_136_mpos)

            }

            function modifier_onlyAfter_311() {

                let _88 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_310 := _88
                let _89 := expr_310
                let var__time_64 := _89

                let expr_67 := timestamp()
                let _90 := var__time_64
                let expr_68 := _90
                let expr_69 := iszero(gt(cleanup_t_uint256(expr_67), cleanup_t_uint256(expr_68)))
                if expr_69 {
                    let _91 := var__time_64
                    let expr_71 := _91
                    {
                        let _92 := allocate_unbounded()
                        mstore(_92, 19091908490143049560467913968745328851371417287440725826973055816145204936704)
                        let _93 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(add(_92, 4) , expr_71)
                        revert(_92, sub(_93, _92))
                }}
                fun_auctionEnd_334_inner()

            }

            function modifier_onlyBefore_111(var__blindedBid_107) {

                let _1 := read_from_storage_split_offset_0_t_uint256(0x01)
                let expr_110 := _1
                let _2 := expr_110
                let var__time_49 := _2

                let expr_52 := timestamp()
                let _3 := var__time_49
                let expr_53 := _3
                let expr_54 := iszero(lt(cleanup_t_uint256(expr_52), cleanup_t_uint256(expr_53)))
                if expr_54 {
                    let _4 := var__time_49
                    let expr_56 := _4
                    {
                        let _5 := allocate_unbounded()
                        mstore(_5, 47546451568165213027155428440708054397658490033123287746570589397336977309696)
                        let _6 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(add(_5, 4) , expr_56)
                        revert(_5, sub(_6, _5))
                }}
                fun_bid_126_inner(var__blindedBid_107)

            }

            function modifier_onlyBefore_143(var__values_130_mpos, var__fake_133_mpos, var__secret_136_mpos) {

                let _17 := read_from_storage_split_offset_0_t_uint256(0x02)
                let expr_142 := _17
                let _18 := expr_142
                let var__time_49 := _18

                let expr_52 := timestamp()
                let _19 := var__time_49
                let expr_53 := _19
                let expr_54 := iszero(lt(cleanup_t_uint256(expr_52), cleanup_t_uint256(expr_53)))
                if expr_54 {
                    let _20 := var__time_49
                    let expr_56 := _20
                    {
                        let _21 := allocate_unbounded()
                        mstore(_21, 47546451568165213027155428440708054397658490033123287746570589397336977309696)
                        let _22 := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(add(_21, 4) , expr_56)
                        revert(_21, sub(_22, _21))
                }}
                fun_reveal_273_inner(var__values_130_mpos, var__fake_133_mpos, var__secret_136_mpos)

            }

            function panic_error_0x00() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x00)
                revert(0, 0x24)
            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function panic_error_0x32() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x32)
                revert(0, 0x24)
            }

            function panic_error_0x41() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function prepare_store_t_bool(value) -> ret {
                ret := value
            }

            function prepare_store_t_bytes32(value) -> ret {
                ret := shift_right_0_unsigned(value)
            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function read_from_memoryt_bool(ptr) -> returnValue {

                let value := cleanup_t_bool(mload(ptr))

                returnValue :=

                value

            }

            function read_from_memoryt_bytes32(ptr) -> returnValue {

                let value := cleanup_t_bytes32(mload(ptr))

                returnValue :=

                value

            }

            function read_from_memoryt_uint256(ptr) -> returnValue {

                let value := cleanup_t_uint256(mload(ptr))

                returnValue :=

                value

            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_address_payable(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address_payable(sload(slot), offset)

            }

            function read_from_storage_split_dynamic_t_bool(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_bool(sload(slot), offset)

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

            function read_from_storage_split_offset_0_t_bool(slot) -> value {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))

            }

            function read_from_storage_split_offset_0_t_bytes32(slot) -> value {
                value := extract_from_storage_value_offset_0t_bytes32(sload(slot))

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

            function shift_left_248(value) -> newValue {
                newValue :=

                shl(248, value)

            }

            function shift_left_dynamic(bits, value) -> newValue {
                newValue :=

                shl(bits, value)

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

            function storage_array_index_access_t_array$_t_struct$_Bid_$6_storage_$dyn_storage(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_struct$_Bid_$6_storage_$dyn_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error_0x32() }

                let dataArea := array_dataslot_t_array$_t_struct$_Bid_$6_storage_$dyn_storage(array)
                slot := add(dataArea, mul(index, 2))
                offset := 0

            }

            function storage_array_index_access_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_ptr(array, index) -> slot, offset {
                let arrayLength := array_length_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_ptr(array)
                if iszero(lt(index, arrayLength)) { panic_error_0x32() }

                let dataArea := array_dataslot_t_array$_t_struct$_Bid_$6_storage_$dyn_storage_ptr(array)
                slot := add(dataArea, mul(index, 2))
                offset := 0

            }

            function update_byte_slice_1_shift_0(value, toInsert) -> result {
                let mask := 255
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
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

            function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0) {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }

            function update_storage_value_offset_0t_bytes32_to_t_bytes32(slot, value_0) {
                let convertedValue_0 := convert_t_bytes32_to_t_bytes32(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_bytes32(convertedValue_0)))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

            function update_storage_value_t_struct$_Bid_$6_memory_ptr_to_t_struct$_Bid_$6_storage(slot, offset, value_0) {
                if offset { panic_error_0x00() }
                copy_struct_to_storage_from_t_struct$_Bid_$6_memory_ptr_to_t_struct$_Bid_$6_storage(slot, value_0)
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

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function write_to_memory_t_bytes32(memPtr, value) {
                mstore(memPtr, cleanup_t_bytes32(value))
            }

            function write_to_memory_t_uint256(memPtr, value) {
                mstore(memPtr, cleanup_t_uint256(value))
            }

            function zero_value_for_split_t_bool() -> ret {
                ret := 0
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

