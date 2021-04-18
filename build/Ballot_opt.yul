/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "Ballot_314" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }
        let _1 := copy_arguments_for_constructor_71_object_Ballot_314()
        constructor_Ballot_314(_1)
        codecopy(0, dataoffset("Ballot_314_deployed"), datasize("Ballot_314_deployed"))
        return(0, datasize("Ballot_314_deployed"))
        function abi_decode_available_length_t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(offset, length, end) -> array
        {
            array := allocate_memory(array_allocation_size_t_array$_t_bytes32_$dyn_memory_ptr(length))
            let dst := array
            mstore(array, length)
            dst := add(array, 0x20)
            let src := offset
            if gt(add(src, mul(length, 0x20)), end) { revert(0, 0) }
            for { let i := 0 } lt(i, length) { i := add(i, 1) }
            {
                let elementPos := src
                mstore(dst, abi_decode_t_bytes32_fromMemory(elementPos, end))
                dst := add(dst, 0x20)
                src := add(src, 0x20)
            }
        }
        function abi_decode_t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(offset, end) -> array
        {
            if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
            let length := mload(offset)
            array := abi_decode_available_length_t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(add(offset, 0x20), length, end)
        }
        function abi_decode_t_bytes32_fromMemory(offset, end) -> value
        {
            value := mload(offset)
            validator_revert_t_bytes32(value)
        }
        function abi_decode_tuple_t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(headStart, dataEnd) -> value0
        {
            if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }
            {
                let offset := mload(add(headStart, 0))
                if gt(offset, 0xffffffffffffffff) { revert(0, 0) }
                value0 := abi_decode_t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(add(headStart, offset), dataEnd)
            }
        }
        function allocate_memory(size) -> memPtr
        {
            memPtr := allocate_unbounded()
            finalize_allocation(memPtr, size)
        }
        function allocate_memory_struct_t_struct$_Proposal_$16_storage_ptr() -> memPtr
        { memPtr := allocate_memory(64) }
        function allocate_unbounded() -> memPtr
        { memPtr := mload(64) }
        function array_allocation_size_t_array$_t_bytes32_$dyn_memory_ptr(length) -> size
        {
            if gt(length, 0xffffffffffffffff) { panic_error_0x41() }
            size := mul(length, 0x20)
            size := add(size, 0x20)
        }
        function array_dataslot_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage_ptr(ptr) -> data
        {
            data := ptr
            mstore(0, ptr)
            data := keccak256(0, 0x20)
        }
        function array_length_t_array$_t_bytes32_$dyn_memory_ptr(value) -> length
        { length := mload(value) }
        function array_length_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage_ptr(value) -> length
        { length := sload(value) }
        function array_push_from_t_struct$_Proposal_$16_memory_ptr_to_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage_ptr(array, value0)
        {
            let oldLen := sload(array)
            if iszero(lt(oldLen, 18446744073709551616)) { panic_error_0x41() }
            sstore(array, add(oldLen, 1))
            let slot, offset := storage_array_index_access_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage_ptr(array, oldLen)
            update_storage_value_t_struct$_Proposal_$16_memory_ptr_to_t_struct$_Proposal_$16_storage(slot, offset, value0)
        }
        function cleanup_from_storage_t_address(value) -> cleaned
        {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }
        function cleanup_t_bytes32(value) -> cleaned
        { cleaned := value }
        function cleanup_t_uint160(value) -> cleaned
        {
            cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
        }
        function cleanup_t_uint256(value) -> cleaned
        { cleaned := value }
        function constructor_Ballot_314(var_proposalNames_31_mpos)
        {
            let expr_36 := caller()
            update_storage_value_offset_0t_address_to_t_address(0x00, expr_36)
            let expr_37 := expr_36
            let expr_43 := 0x01
            let _2 := convert_t_rational_1_by_1_to_t_uint256(expr_43)
            let _3 := 0x01
            let expr_39 := _3
            let _4 := read_from_storage_split_offset_0_t_address(0x00)
            let expr_40 := _4
            let _5 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Voter_$11_storage_$_of_t_address(expr_39, expr_40)
            let _6_slot := _5
            let expr_41_slot := _6_slot
            let _7 := add(expr_41_slot, 0)
            update_storage_value_offset_0t_uint256_to_t_uint256(_7, _2)
            let expr_44 := _2
            for {
                let expr_48 := 0x00
                let var_i_47 := convert_t_rational_0_by_1_to_t_uint256(expr_48)
            }
            1
            {
                let _9 := var_i_47
                let _8 := increment_t_uint256(_9)
                var_i_47 := _8
                let expr_55 := _9
            }
            {
                let _10 := var_i_47
                let expr_50 := _10
                let _11_mpos := var_proposalNames_31_mpos
                let expr_51_mpos := _11_mpos
                let expr_52 := array_length_t_array$_t_bytes32_$dyn_memory_ptr(expr_51_mpos)
                let expr_53 := lt(cleanup_t_uint256(expr_50), cleanup_t_uint256(expr_52))
                if iszero(expr_53) { break }
                let _12_slot := 0x02
                let expr_57_slot := _12_slot
                let expr_59_self_slot := convert_array_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage_to_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage_ptr(expr_57_slot)
                let _13_mpos := var_proposalNames_31_mpos
                let expr_61_mpos := _13_mpos
                let _14 := var_i_47
                let expr_62 := _14
                let _15 := read_from_memoryt_bytes32(memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(expr_61_mpos, expr_62))
                let expr_63 := _15
                let expr_64 := 0x00
                let expr_65_mpos := allocate_memory_struct_t_struct$_Proposal_$16_storage_ptr()
                write_to_memory_t_bytes32(add(expr_65_mpos, 0), expr_63)
                let _16 := convert_t_rational_0_by_1_to_t_uint256(expr_64)
                write_to_memory_t_uint256(add(expr_65_mpos, 32), _16)
                array_push_from_t_struct$_Proposal_$16_memory_ptr_to_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage_ptr(expr_59_self_slot, expr_65_mpos)
            }
        }
        function convert_array_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage_to_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage_ptr(value) -> converted
        { converted := value }
        function convert_t_address_to_t_address(value) -> converted
        {
            converted := convert_t_uint160_to_t_address(value)
        }
        function convert_t_bytes32_to_t_bytes32(value) -> converted
        {
            converted := cleanup_t_bytes32(value)
        }
        function convert_t_rational_0_by_1_to_t_uint256(value) -> converted
        {
            converted := cleanup_t_uint256(value)
        }
        function convert_t_rational_1_by_1_to_t_uint256(value) -> converted
        {
            converted := cleanup_t_uint256(value)
        }
        function convert_t_uint160_to_t_address(value) -> converted
        {
            converted := convert_t_uint160_to_t_uint160(value)
        }
        function convert_t_uint160_to_t_uint160(value) -> converted
        {
            converted := cleanup_t_uint160(value)
        }
        function convert_t_uint256_to_t_uint256(value) -> converted
        {
            converted := cleanup_t_uint256(value)
        }
        function copy_arguments_for_constructor_71_object_Ballot_314() -> ret_param_0
        {
            let programSize := datasize("Ballot_314")
            let argSize := sub(codesize(), programSize)
            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)
            ret_param_0 := abi_decode_tuple_t_array$_t_bytes32_$dyn_memory_ptr_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
        }
        function copy_struct_to_storage_from_t_struct$_Proposal_$16_memory_ptr_to_t_struct$_Proposal_$16_storage(slot, value)
        {
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
        function extract_from_storage_value_offset_0t_address(slot_value) -> value
        {
            value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
        }
        function finalize_allocation(memPtr, size)
        {
            let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
            if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
            mstore(64, newFreePtr)
        }
        function increment_t_uint256(value) -> ret
        {
            value := cleanup_t_uint256(value)
            if eq(value, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) { panic_error_0x11() }
            ret := add(value, 1)
        }
        function mapping_index_access_t_mapping$_t_address_$_t_struct$_Voter_$11_storage_$_of_t_address(slot, key) -> dataSlot
        {
            mstore(0, convert_t_address_to_t_address(key))
            mstore(0x20, slot)
            dataSlot := keccak256(0, 0x40)
        }
        function memory_array_index_access_t_array$_t_bytes32_$dyn_memory_ptr(baseRef, index) -> addr
        {
            if iszero(lt(index, array_length_t_array$_t_bytes32_$dyn_memory_ptr(baseRef))) { panic_error_0x32() }
            let offset := mul(index, 32)
            offset := add(offset, 32)
            addr := add(baseRef, offset)
        }
        function panic_error_0x00()
        {
            mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
            mstore(4, 0x00)
            revert(0, 0x24)
        }
        function panic_error_0x11()
        {
            mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
            mstore(4, 0x11)
            revert(0, 0x24)
        }
        function panic_error_0x32()
        {
            mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
            mstore(4, 0x32)
            revert(0, 0x24)
        }
        function panic_error_0x41()
        {
            mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
            mstore(4, 0x41)
            revert(0, 0x24)
        }
        function prepare_store_t_address(value) -> ret
        { ret := value }
        function prepare_store_t_bytes32(value) -> ret
        {
            ret := shift_right_0_unsigned(value)
        }
        function prepare_store_t_uint256(value) -> ret
        { ret := value }
        function read_from_memoryt_bytes32(ptr) -> returnValue
        {
            let value := cleanup_t_bytes32(mload(ptr))
            returnValue := value
        }
        function read_from_memoryt_uint256(ptr) -> returnValue
        {
            let value := cleanup_t_uint256(mload(ptr))
            returnValue := value
        }
        function read_from_storage_split_offset_0_t_address(slot) -> value
        {
            value := extract_from_storage_value_offset_0t_address(sload(slot))
        }
        function round_up_to_mul_of_32(value) -> result
        {
            result := and(add(value, 31), not(31))
        }
        function shift_left_0(value) -> newValue
        { newValue := shl(0, value) }
        function shift_left_dynamic(bits, value) -> newValue
        { newValue := shl(bits, value) }
        function shift_right_0_unsigned(value) -> newValue
        { newValue := shr(0, value) }
        function storage_array_index_access_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage_ptr(array, index) -> slot, offset
        {
            let arrayLength := array_length_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage_ptr(array)
            if iszero(lt(index, arrayLength)) { panic_error_0x32() }
            let dataArea := array_dataslot_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage_ptr(array)
            slot := add(dataArea, mul(index, 2))
            offset := 0
        }
        function update_byte_slice_20_shift_0(value, toInsert) -> result
        {
            let mask := 0xffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }
        function update_byte_slice_32_shift_0(value, toInsert) -> result
        {
            let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
            toInsert := shift_left_0(toInsert)
            value := and(value, not(mask))
            result := or(value, and(toInsert, mask))
        }
        function update_storage_value_offset_0t_address_to_t_address(slot, value_0)
        {
            let convertedValue_0 := convert_t_address_to_t_address(value_0)
            sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
        }
        function update_storage_value_offset_0t_bytes32_to_t_bytes32(slot, value_0)
        {
            let convertedValue_0 := convert_t_bytes32_to_t_bytes32(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_bytes32(convertedValue_0)))
        }
        function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0)
        {
            let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
            sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
        }
        function update_storage_value_t_struct$_Proposal_$16_memory_ptr_to_t_struct$_Proposal_$16_storage(slot, offset, value_0)
        {
            if offset { panic_error_0x00() }
            copy_struct_to_storage_from_t_struct$_Proposal_$16_memory_ptr_to_t_struct$_Proposal_$16_storage(slot, value_0)
        }
        function validator_revert_t_bytes32(value)
        {
            if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
        }
        function write_to_memory_t_bytes32(memPtr, value)
        {
            mstore(memPtr, cleanup_t_bytes32(value))
        }
        function write_to_memory_t_uint256(memPtr, value)
        {
            mstore(memPtr, cleanup_t_uint256(value))
        }
    }
    object "Ballot_314_deployed" {
        code {
            mstore(64, 128)
            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector
                case 0x0121b93f {
                    if callvalue() { revert(0, 0) }
                    let param_0 := abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_vote_256(param_0)
                    let memPos := allocate_memory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos)
                    return(memPos, sub(memEnd, memPos))
                }
                case 0x013cf08b {
                    if callvalue() { revert(0, 0) }
                    let param_0 := abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0, ret_1 := getter_fun_proposals_27(param_0)
                    let memPos := allocate_memory(0)
                    let memEnd := abi_encode_tuple_t_bytes32_t_uint256__to_t_bytes32_t_uint256__fromStack(memPos, ret_0, ret_1)
                    return(memPos, sub(memEnd, memPos))
                }
                case 0x2e4176cf {
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 := getter_fun_chairperson_18()
                    let memPos := allocate_memory(0)
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos, ret_0)
                    return(memPos, sub(memEnd, memPos))
                }
                case 0x5c19a95c {
                    if callvalue() { revert(0, 0) }
                    let param_0 := abi_decode_tuple_t_address(4, calldatasize())
                    fun_delegate_206(param_0)
                    let memPos := allocate_memory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos)
                    return(memPos, sub(memEnd, memPos))
                }
                case 0x609ff1bd {
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 := fun_winningProposal_299()
                    let memPos := allocate_memory(0)
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos, ret_0)
                    return(memPos, sub(memEnd, memPos))
                }
                case 0x9e7b8d61 {
                    if callvalue() { revert(0, 0) }
                    let param_0 := abi_decode_tuple_t_address(4, calldatasize())
                    fun_giveRightToVote_110(param_0)
                    let memPos := allocate_memory(0)
                    let memEnd := abi_encode_tuple__to__fromStack(memPos)
                    return(memPos, sub(memEnd, memPos))
                }
                case 0xa3ec138d {
                    if callvalue() { revert(0, 0) }
                    let param_0 := abi_decode_tuple_t_address(4, calldatasize())
                    let ret_0, ret_1, ret_2, ret_3 := getter_fun_voters_23(param_0)
                    let memPos := allocate_memory(0)
                    let memEnd := abi_encode_tuple_t_uint256_t_bool_t_address_t_uint256__to_t_uint256_t_bool_t_address_t_uint256__fromStack(memPos, ret_0, ret_1, ret_2, ret_3)
                    return(memPos, sub(memEnd, memPos))
                }
                case 0xe2ba53f0 {
                    if callvalue() { revert(0, 0) }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 := fun_winnerName_313()
                    let memPos := allocate_memory(0)
                    let memEnd := abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(memPos, ret_0)
                    return(memPos, sub(memEnd, memPos))
                }
                default { }
            }
            if iszero(calldatasize()) { }
            revert(0, 0)
            function abi_decode_t_address(offset, end) -> value
            {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }
            function abi_decode_t_uint256(offset, end) -> value
            {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }
            function abi_decode_tuple_(headStart, dataEnd)
            {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }
            }
            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0
            {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }
                {
                    let offset := 0
                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }
            }
            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0
            {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }
                {
                    let offset := 0
                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }
            }
            function abi_encode_t_address_to_t_address_fromStack(value, pos)
            {
                mstore(pos, cleanup_t_address(value))
            }
            function abi_encode_t_bool_to_t_bool_fromStack(value, pos)
            {
                mstore(pos, cleanup_t_bool(value))
            }
            function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos)
            {
                mstore(pos, cleanup_t_bytes32(value))
            }
            function abi_encode_t_stringliteral_0dc527e8fa9b76c996eb5eda9ddb749b21540f5509781b94e1e37f7027e7f50e_to_t_string_memory_ptr_fromStack(pos) -> end
            {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 20)
                store_literal_in_memory_0dc527e8fa9b76c996eb5eda9ddb749b21540f5509781b94e1e37f7027e7f50e(pos)
                end := add(pos, 32)
            }
            function abi_encode_t_stringliteral_56aab92b7164a4ea72a098d2d95a5e763b71d07f265e8d46fc7240404017fa84_to_t_string_memory_ptr_fromStack(pos) -> end
            {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 14)
                store_literal_in_memory_56aab92b7164a4ea72a098d2d95a5e763b71d07f265e8d46fc7240404017fa84(pos)
                end := add(pos, 32)
            }
            function abi_encode_t_stringliteral_657c6119c4ed567c60278fba62242b17c2fedf38962e651040dabfb3c9e15a5f_to_t_string_memory_ptr_fromStack(pos) -> end
            {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 18)
                store_literal_in_memory_657c6119c4ed567c60278fba62242b17c2fedf38962e651040dabfb3c9e15a5f(pos)
                end := add(pos, 32)
            }
            function abi_encode_t_stringliteral_80126ce3251ab2b6e4ade14fe5b2bc11f593510cbe9e3550c09bff1989e33b95_to_t_string_memory_ptr_fromStack(pos) -> end
            {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 40)
                store_literal_in_memory_80126ce3251ab2b6e4ade14fe5b2bc11f593510cbe9e3550c09bff1989e33b95(pos)
                end := add(pos, 64)
            }
            function abi_encode_t_stringliteral_8bd75322489f7ff7ab0b18506f4dcde935a32eca2a506b00f4d21b0becfa093c_to_t_string_memory_ptr_fromStack(pos) -> end
            {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 25)
                store_literal_in_memory_8bd75322489f7ff7ab0b18506f4dcde935a32eca2a506b00f4d21b0becfa093c(pos)
                end := add(pos, 32)
            }
            function abi_encode_t_stringliteral_d39b1db28626750c546703ffb72f30ea3facdfed1bebd47408e22ef18a76ba2d_to_t_string_memory_ptr_fromStack(pos) -> end
            {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 24)
                store_literal_in_memory_d39b1db28626750c546703ffb72f30ea3facdfed1bebd47408e22ef18a76ba2d(pos)
                end := add(pos, 32)
            }
            function abi_encode_t_stringliteral_f37bf1aca80f8fa291a40f639db6aeaa1425ceb0e8c61c8648f0e2efa282a947_to_t_string_memory_ptr_fromStack(pos) -> end
            {
                pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 30)
                store_literal_in_memory_f37bf1aca80f8fa291a40f639db6aeaa1425ceb0e8c61c8648f0e2efa282a947(pos)
                end := add(pos, 32)
            }
            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos)
            {
                mstore(pos, cleanup_t_uint256(value))
            }
            function abi_encode_tuple__to__fromStack(headStart) -> tail
            { tail := add(headStart, 0) }
            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                abi_encode_t_address_to_t_address_fromStack(value0, add(headStart, 0))
            }
            function abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0, add(headStart, 0))
            }
            function abi_encode_tuple_t_bytes32_t_uint256__to_t_bytes32_t_uint256__fromStack(headStart, value0, value1) -> tail
            {
                tail := add(headStart, 64)
                abi_encode_t_bytes32_to_t_bytes32_fromStack(value0, add(headStart, 0))
                abi_encode_t_uint256_to_t_uint256_fromStack(value1, add(headStart, 32))
            }
            function abi_encode_tuple_t_stringliteral_0dc527e8fa9b76c996eb5eda9ddb749b21540f5509781b94e1e37f7027e7f50e__to_t_string_memory_ptr__fromStack(headStart) -> tail
            {
                tail := add(headStart, 32)
                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_0dc527e8fa9b76c996eb5eda9ddb749b21540f5509781b94e1e37f7027e7f50e_to_t_string_memory_ptr_fromStack(tail)
            }
            function abi_encode_tuple_t_stringliteral_56aab92b7164a4ea72a098d2d95a5e763b71d07f265e8d46fc7240404017fa84__to_t_string_memory_ptr__fromStack(headStart) -> tail
            {
                tail := add(headStart, 32)
                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_56aab92b7164a4ea72a098d2d95a5e763b71d07f265e8d46fc7240404017fa84_to_t_string_memory_ptr_fromStack(tail)
            }
            function abi_encode_tuple_t_stringliteral_657c6119c4ed567c60278fba62242b17c2fedf38962e651040dabfb3c9e15a5f__to_t_string_memory_ptr__fromStack(headStart) -> tail
            {
                tail := add(headStart, 32)
                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_657c6119c4ed567c60278fba62242b17c2fedf38962e651040dabfb3c9e15a5f_to_t_string_memory_ptr_fromStack(tail)
            }
            function abi_encode_tuple_t_stringliteral_80126ce3251ab2b6e4ade14fe5b2bc11f593510cbe9e3550c09bff1989e33b95__to_t_string_memory_ptr__fromStack(headStart) -> tail
            {
                tail := add(headStart, 32)
                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_80126ce3251ab2b6e4ade14fe5b2bc11f593510cbe9e3550c09bff1989e33b95_to_t_string_memory_ptr_fromStack(tail)
            }
            function abi_encode_tuple_t_stringliteral_8bd75322489f7ff7ab0b18506f4dcde935a32eca2a506b00f4d21b0becfa093c__to_t_string_memory_ptr__fromStack(headStart) -> tail
            {
                tail := add(headStart, 32)
                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_8bd75322489f7ff7ab0b18506f4dcde935a32eca2a506b00f4d21b0becfa093c_to_t_string_memory_ptr_fromStack(tail)
            }
            function abi_encode_tuple_t_stringliteral_d39b1db28626750c546703ffb72f30ea3facdfed1bebd47408e22ef18a76ba2d__to_t_string_memory_ptr__fromStack(headStart) -> tail
            {
                tail := add(headStart, 32)
                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_d39b1db28626750c546703ffb72f30ea3facdfed1bebd47408e22ef18a76ba2d_to_t_string_memory_ptr_fromStack(tail)
            }
            function abi_encode_tuple_t_stringliteral_f37bf1aca80f8fa291a40f639db6aeaa1425ceb0e8c61c8648f0e2efa282a947__to_t_string_memory_ptr__fromStack(headStart) -> tail
            {
                tail := add(headStart, 32)
                mstore(add(headStart, 0), sub(tail, headStart))
                tail := abi_encode_t_stringliteral_f37bf1aca80f8fa291a40f639db6aeaa1425ceb0e8c61c8648f0e2efa282a947_to_t_string_memory_ptr_fromStack(tail)
            }
            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                abi_encode_t_uint256_to_t_uint256_fromStack(value0, add(headStart, 0))
            }
            function abi_encode_tuple_t_uint256_t_bool_t_address_t_uint256__to_t_uint256_t_bool_t_address_t_uint256__fromStack(headStart, value0, value1, value2, value3) -> tail
            {
                tail := add(headStart, 128)
                abi_encode_t_uint256_to_t_uint256_fromStack(value0, add(headStart, 0))
                abi_encode_t_bool_to_t_bool_fromStack(value1, add(headStart, 32))
                abi_encode_t_address_to_t_address_fromStack(value2, add(headStart, 64))
                abi_encode_t_uint256_to_t_uint256_fromStack(value3, add(headStart, 96))
            }
            function allocate_memory(size) -> memPtr
            {
                memPtr := allocate_unbounded()
                finalize_allocation(memPtr, size)
            }
            function allocate_unbounded() -> memPtr
            { memPtr := mload(64) }
            function array_dataslot_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(ptr) -> data
            {
                data := ptr
                mstore(0, ptr)
                data := keccak256(0, 0x20)
            }
            function array_length_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(value) -> length
            { length := sload(value) }
            function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos
            {
                mstore(pos, length)
                updated_pos := add(pos, 0x20)
            }
            function checked_add_t_uint256(x, y) -> sum
            {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }
                sum := add(x, y)
            }
            function cleanup_from_storage_t_address(value) -> cleaned
            {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }
            function cleanup_from_storage_t_bool(value) -> cleaned
            { cleaned := and(value, 0xff) }
            function cleanup_from_storage_t_bytes32(value) -> cleaned
            { cleaned := value }
            function cleanup_from_storage_t_uint256(value) -> cleaned
            { cleaned := value }
            function cleanup_t_address(value) -> cleaned
            {
                cleaned := cleanup_t_uint160(value)
            }
            function cleanup_t_bool(value) -> cleaned
            {
                cleaned := iszero(iszero(value))
            }
            function cleanup_t_bytes32(value) -> cleaned
            { cleaned := value }
            function cleanup_t_uint160(value) -> cleaned
            {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }
            function cleanup_t_uint256(value) -> cleaned
            { cleaned := value }
            function convert_t_address_to_t_address(value) -> converted
            {
                converted := convert_t_uint160_to_t_address(value)
            }
            function convert_t_bool_to_t_bool(value) -> converted
            {
                converted := cleanup_t_bool(value)
            }
            function convert_t_rational_0_by_1_to_t_address(value) -> converted
            {
                converted := convert_t_rational_0_by_1_to_t_uint160(value)
            }
            function convert_t_rational_0_by_1_to_t_uint160(value) -> converted
            {
                converted := cleanup_t_uint160(value)
            }
            function convert_t_rational_0_by_1_to_t_uint256(value) -> converted
            {
                converted := cleanup_t_uint256(value)
            }
            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted
            {
                converted := cleanup_t_uint256(value)
            }
            function convert_t_struct$_Voter_$11_storage_to_t_struct$_Voter_$11_storage_ptr(value) -> converted
            { converted := value }
            function convert_t_uint160_to_t_address(value) -> converted
            {
                converted := convert_t_uint160_to_t_uint160(value)
            }
            function convert_t_uint160_to_t_uint160(value) -> converted
            {
                converted := cleanup_t_uint160(value)
            }
            function convert_t_uint256_to_t_uint256(value) -> converted
            {
                converted := cleanup_t_uint256(value)
            }
            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value
            {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }
            function extract_from_storage_value_offset_0t_address(slot_value) -> value
            {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }
            function extract_from_storage_value_offset_0t_bool(slot_value) -> value
            {
                value := cleanup_from_storage_t_bool(shift_right_0_unsigned(slot_value))
            }
            function extract_from_storage_value_offset_0t_bytes32(slot_value) -> value
            {
                value := cleanup_from_storage_t_bytes32(shift_right_0_unsigned(slot_value))
            }
            function extract_from_storage_value_offset_0t_uint256(slot_value) -> value
            {
                value := cleanup_from_storage_t_uint256(shift_right_0_unsigned(slot_value))
            }
            function extract_from_storage_value_offset_1t_address(slot_value) -> value
            {
                value := cleanup_from_storage_t_address(shift_right_8_unsigned(slot_value))
            }
            function finalize_allocation(memPtr, size)
            {
                let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }
            function fun_delegate_206(var_to_113)
            {
                let _20 := 0x01
                let expr_119 := _20
                let expr_121 := caller()
                let _21 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Voter_$11_storage_$_of_t_address(expr_119, expr_121)
                let _22_slot := _21
                let expr_122_slot := _22_slot
                let var_sender_118_slot := convert_t_struct$_Voter_$11_storage_to_t_struct$_Voter_$11_storage_ptr(expr_122_slot)
                let _23_slot := var_sender_118_slot
                let expr_125_slot := _23_slot
                let _24 := add(expr_125_slot, 1)
                let _25 := read_from_storage_split_offset_0_t_bool(_24)
                let expr_126 := _25
                let expr_127 := cleanup_t_bool(iszero(expr_126))
                require_helper_t_stringliteral_657c6119c4ed567c60278fba62242b17c2fedf38962e651040dabfb3c9e15a5f(expr_127)
                let _26 := var_to_113
                let expr_132 := _26
                let expr_134 := caller()
                let expr_135 := iszero(eq(cleanup_t_address(expr_132), cleanup_t_address(expr_134)))
                require_helper_t_stringliteral_f37bf1aca80f8fa291a40f639db6aeaa1425ceb0e8c61c8648f0e2efa282a947(expr_135)
                for { } 1 { }
                {
                    let _27 := 0x01
                    let expr_139 := _27
                    let _28 := var_to_113
                    let expr_140 := _28
                    let _29 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Voter_$11_storage_$_of_t_address(expr_139, expr_140)
                    let _30_slot := _29
                    let expr_141_slot := _30_slot
                    let _31 := add(expr_141_slot, 1)
                    let _32 := read_from_storage_split_offset_1_t_address(_31)
                    let expr_142 := _32
                    let expr_145 := 0x00
                    let expr_146 := convert_t_rational_0_by_1_to_t_address(expr_145)
                    let expr_147 := iszero(eq(cleanup_t_address(expr_142), cleanup_t_address(expr_146)))
                    if iszero(expr_147) { break }
                    let _33 := 0x01
                    let expr_149 := _33
                    let _34 := var_to_113
                    let expr_150 := _34
                    let _35 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Voter_$11_storage_$_of_t_address(expr_149, expr_150)
                    let _36_slot := _35
                    let expr_151_slot := _36_slot
                    let _37 := add(expr_151_slot, 1)
                    let _38 := read_from_storage_split_offset_1_t_address(_37)
                    let expr_152 := _38
                    var_to_113 := expr_152
                    let expr_153 := expr_152
                    let _39 := var_to_113
                    let expr_156 := _39
                    let expr_158 := caller()
                    let expr_159 := iszero(eq(cleanup_t_address(expr_156), cleanup_t_address(expr_158)))
                    require_helper_t_stringliteral_8bd75322489f7ff7ab0b18506f4dcde935a32eca2a506b00f4d21b0becfa093c(expr_159)
                }
                let expr_168 := 0x01
                let _40_slot := var_sender_118_slot
                let expr_165_slot := _40_slot
                let _41 := add(expr_165_slot, 1)
                update_storage_value_offset_0t_bool_to_t_bool(_41, expr_168)
                let expr_169 := expr_168
                let _42 := var_to_113
                let expr_174 := _42
                let _43_slot := var_sender_118_slot
                let expr_171_slot := _43_slot
                let _44 := add(expr_171_slot, 1)
                update_storage_value_offset_1t_address_to_t_address(_44, expr_174)
                let expr_175 := expr_174
                let _45 := 0x01
                let expr_180 := _45
                let _46 := var_to_113
                let expr_181 := _46
                let _47 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Voter_$11_storage_$_of_t_address(expr_180, expr_181)
                let _48_slot := _47
                let expr_182_slot := _48_slot
                let var_delegate__179_slot := convert_t_struct$_Voter_$11_storage_to_t_struct$_Voter_$11_storage_ptr(expr_182_slot)
                let _49_slot := var_delegate__179_slot
                let expr_184_slot := _49_slot
                let _50 := add(expr_184_slot, 1)
                let _51 := read_from_storage_split_offset_0_t_bool(_50)
                let expr_185 := _51
                switch expr_185
                case 0 {
                    let _52_slot := var_sender_118_slot
                    let expr_199_slot := _52_slot
                    let _53 := add(expr_199_slot, 0)
                    let _54 := read_from_storage_split_offset_0_t_uint256(_53)
                    let expr_200 := _54
                    let _55_slot := var_delegate__179_slot
                    let expr_196_slot := _55_slot
                    let _56 := add(expr_196_slot, 0)
                    let _57 := read_from_storage_split_offset_0_t_uint256(_56)
                    expr_200 := checked_add_t_uint256(_57, expr_200)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_56, expr_200)
                    let expr_201 := expr_200
                }
                default {
                    let _58_slot := var_sender_118_slot
                    let expr_191_slot := _58_slot
                    let _59 := add(expr_191_slot, 0)
                    let _60 := read_from_storage_split_offset_0_t_uint256(_59)
                    let expr_192 := _60
                    let _61_slot := 0x02
                    let expr_186_slot := _61_slot
                    let _62_slot := var_delegate__179_slot
                    let expr_187_slot := _62_slot
                    let _63 := add(expr_187_slot, 2)
                    let _64 := read_from_storage_split_offset_0_t_uint256(_63)
                    let expr_188 := _64
                    let _65, _66 := storage_array_index_access_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(expr_186_slot, expr_188)
                    let _67_slot := _65
                    let expr_189_slot := _67_slot
                    let _68 := add(expr_189_slot, 1)
                    let _69 := read_from_storage_split_offset_0_t_uint256(_68)
                    expr_192 := checked_add_t_uint256(_69, expr_192)
                    update_storage_value_offset_0t_uint256_to_t_uint256(_68, expr_192)
                    let expr_193 := expr_192
                }
            }
            function fun_giveRightToVote_110(var_voter_73)
            {
                let expr_78 := caller()
                let _1 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_79 := _1
                let expr_80 := eq(cleanup_t_address(expr_78), cleanup_t_address(expr_79))
                require_helper_t_stringliteral_80126ce3251ab2b6e4ade14fe5b2bc11f593510cbe9e3550c09bff1989e33b95(expr_80)
                let _2 := 0x01
                let expr_85 := _2
                let _3 := var_voter_73
                let expr_86 := _3
                let _4 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Voter_$11_storage_$_of_t_address(expr_85, expr_86)
                let _5_slot := _4
                let expr_87_slot := _5_slot
                let _6 := add(expr_87_slot, 1)
                let _7 := read_from_storage_split_offset_0_t_bool(_6)
                let expr_88 := _7
                let expr_89 := cleanup_t_bool(iszero(expr_88))
                require_helper_t_stringliteral_d39b1db28626750c546703ffb72f30ea3facdfed1bebd47408e22ef18a76ba2d(expr_89)
                let _8 := 0x01
                let expr_94 := _8
                let _9 := var_voter_73
                let expr_95 := _9
                let _10 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Voter_$11_storage_$_of_t_address(expr_94, expr_95)
                let _11_slot := _10
                let expr_96_slot := _11_slot
                let _12 := add(expr_96_slot, 0)
                let _13 := read_from_storage_split_offset_0_t_uint256(_12)
                let expr_97 := _13
                let expr_98 := 0x00
                let expr_99 := eq(cleanup_t_uint256(expr_97), convert_t_rational_0_by_1_to_t_uint256(expr_98))
                require_helper(expr_99)
                let expr_106 := 0x01
                let _14 := convert_t_rational_1_by_1_to_t_uint256(expr_106)
                let _15 := 0x01
                let expr_102 := _15
                let _16 := var_voter_73
                let expr_103 := _16
                let _17 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Voter_$11_storage_$_of_t_address(expr_102, expr_103)
                let _18_slot := _17
                let expr_104_slot := _18_slot
                let _19 := add(expr_104_slot, 0)
                update_storage_value_offset_0t_uint256_to_t_uint256(_19, _14)
                let expr_107 := _14
            }
            function fun_vote_256(var_proposal_209)
            {
                let _70 := 0x01
                let expr_215 := _70
                let expr_217 := caller()
                let _71 := mapping_index_access_t_mapping$_t_address_$_t_struct$_Voter_$11_storage_$_of_t_address(expr_215, expr_217)
                let _72_slot := _71
                let expr_218_slot := _72_slot
                let var_sender_214_slot := convert_t_struct$_Voter_$11_storage_to_t_struct$_Voter_$11_storage_ptr(expr_218_slot)
                let _73_slot := var_sender_214_slot
                let expr_221_slot := _73_slot
                let _74 := add(expr_221_slot, 0)
                let _75 := read_from_storage_split_offset_0_t_uint256(_74)
                let expr_222 := _75
                let expr_223 := 0x00
                let expr_224 := iszero(eq(cleanup_t_uint256(expr_222), convert_t_rational_0_by_1_to_t_uint256(expr_223)))
                require_helper_t_stringliteral_0dc527e8fa9b76c996eb5eda9ddb749b21540f5509781b94e1e37f7027e7f50e(expr_224)
                let _76_slot := var_sender_214_slot
                let expr_229_slot := _76_slot
                let _77 := add(expr_229_slot, 1)
                let _78 := read_from_storage_split_offset_0_t_bool(_77)
                let expr_230 := _78
                let expr_231 := cleanup_t_bool(iszero(expr_230))
                require_helper_t_stringliteral_56aab92b7164a4ea72a098d2d95a5e763b71d07f265e8d46fc7240404017fa84(expr_231)
                let expr_238 := 0x01
                let _79_slot := var_sender_214_slot
                let expr_235_slot := _79_slot
                let _80 := add(expr_235_slot, 1)
                update_storage_value_offset_0t_bool_to_t_bool(_80, expr_238)
                let expr_239 := expr_238
                let _81 := var_proposal_209
                let expr_244 := _81
                let _82_slot := var_sender_214_slot
                let expr_241_slot := _82_slot
                let _83 := add(expr_241_slot, 2)
                update_storage_value_offset_0t_uint256_to_t_uint256(_83, expr_244)
                let expr_245 := expr_244
                let _84_slot := var_sender_214_slot
                let expr_251_slot := _84_slot
                let _85 := add(expr_251_slot, 0)
                let _86 := read_from_storage_split_offset_0_t_uint256(_85)
                let expr_252 := _86
                let _87_slot := 0x02
                let expr_247_slot := _87_slot
                let _88 := var_proposal_209
                let expr_248 := _88
                let _89, _90 := storage_array_index_access_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(expr_247_slot, expr_248)
                let _91_slot := _89
                let expr_249_slot := _91_slot
                let _92 := add(expr_249_slot, 1)
                let _93 := read_from_storage_split_offset_0_t_uint256(_92)
                expr_252 := checked_add_t_uint256(_93, expr_252)
                update_storage_value_offset_0t_uint256_to_t_uint256(_92, expr_252)
                let expr_253 := expr_252
            }
            function fun_winnerName_313() -> var_winnerName__302
            {
                let zero_t_bytes32_115 := zero_value_for_split_t_bytes32()
                var_winnerName__302 := zero_t_bytes32_115
                let _116_slot := 0x02
                let expr_305_slot := _116_slot
                let expr_306_functionIdentifier := 299
                let expr_307 := fun_winningProposal_299()
                let _117, _118 := storage_array_index_access_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(expr_305_slot, expr_307)
                let _119_slot := _117
                let expr_308_slot := _119_slot
                let _120 := add(expr_308_slot, 0)
                let _121 := read_from_storage_split_offset_0_t_bytes32(_120)
                let expr_309 := _121
                var_winnerName__302 := expr_309
                let expr_310 := expr_309
            }
            function fun_winningProposal_299() -> var_winningProposal__260
            {
                let zero_t_uint256_94 := zero_value_for_split_t_uint256()
                var_winningProposal__260 := zero_t_uint256_94
                let expr_264 := 0x00
                let var_winningVoteCount_263 := convert_t_rational_0_by_1_to_t_uint256(expr_264)
                for {
                    let expr_268 := 0x00
                    let var_p_267 := convert_t_rational_0_by_1_to_t_uint256(expr_268)
                }
                1
                {
                    let _96 := var_p_267
                    let _95 := increment_t_uint256(_96)
                    var_p_267 := _95
                    let expr_275 := _96
                }
                {
                    let _97 := var_p_267
                    let expr_270 := _97
                    let _98_slot := 0x02
                    let expr_271_slot := _98_slot
                    let expr_272 := array_length_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(expr_271_slot)
                    let expr_273 := lt(cleanup_t_uint256(expr_270), cleanup_t_uint256(expr_272))
                    if iszero(expr_273) { break }
                    let _99_slot := 0x02
                    let expr_277_slot := _99_slot
                    let _100 := var_p_267
                    let expr_278 := _100
                    let _101, _102 := storage_array_index_access_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(expr_277_slot, expr_278)
                    let _103_slot := _101
                    let expr_279_slot := _103_slot
                    let _104 := add(expr_279_slot, 1)
                    let _105 := read_from_storage_split_offset_0_t_uint256(_104)
                    let expr_280 := _105
                    let _106 := var_winningVoteCount_263
                    let expr_281 := _106
                    let expr_282 := gt(cleanup_t_uint256(expr_280), cleanup_t_uint256(expr_281))
                    if expr_282
                    {
                        let _107_slot := 0x02
                        let expr_284_slot := _107_slot
                        let _108 := var_p_267
                        let expr_285 := _108
                        let _109, _110 := storage_array_index_access_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(expr_284_slot, expr_285)
                        let _111_slot := _109
                        let expr_286_slot := _111_slot
                        let _112 := add(expr_286_slot, 1)
                        let _113 := read_from_storage_split_offset_0_t_uint256(_112)
                        let expr_287 := _113
                        var_winningVoteCount_263 := expr_287
                        let expr_288 := expr_287
                        let _114 := var_p_267
                        let expr_291 := _114
                        var_winningProposal__260 := expr_291
                        let expr_292 := expr_291
                    }
                }
            }
            function getter_fun_chairperson_18() -> ret
            {
                let slot := 0
                let offset := 0
                ret := read_from_storage_split_dynamic_t_address(slot, offset)
            }
            function getter_fun_proposals_27(key_0) -> ret_0, ret_1
            {
                let slot := 2
                let offset := 0
                if iszero(lt(key_0, array_length_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(slot))) { revert(0, 0) }
                slot, offset := storage_array_index_access_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(slot, key_0)
                ret_0 := read_from_storage_split_offset_0_t_bytes32(add(slot, 0))
                ret_1 := read_from_storage_split_offset_0_t_uint256(add(slot, 1))
            }
            function getter_fun_voters_23(key_0) -> ret_0, ret_1, ret_2, ret_3
            {
                let slot := 1
                let offset := 0
                slot := mapping_index_access_t_mapping$_t_address_$_t_struct$_Voter_$11_storage_$_of_t_address(slot, key_0)
                ret_0 := read_from_storage_split_offset_0_t_uint256(add(slot, 0))
                ret_1 := read_from_storage_split_offset_0_t_bool(add(slot, 1))
                ret_2 := read_from_storage_split_offset_1_t_address(add(slot, 1))
                ret_3 := read_from_storage_split_offset_0_t_uint256(add(slot, 2))
            }
            function increment_t_uint256(value) -> ret
            {
                value := cleanup_t_uint256(value)
                if eq(value, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) { panic_error_0x11() }
                ret := add(value, 1)
            }
            function mapping_index_access_t_mapping$_t_address_$_t_struct$_Voter_$11_storage_$_of_t_address(slot, key) -> dataSlot
            {
                mstore(0, convert_t_address_to_t_address(key))
                mstore(0x20, slot)
                dataSlot := keccak256(0, 0x40)
            }
            function panic_error_0x11()
            {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }
            function panic_error_0x32()
            {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x32)
                revert(0, 0x24)
            }
            function panic_error_0x41()
            {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            function prepare_store_t_address(value) -> ret
            { ret := value }
            function prepare_store_t_bool(value) -> ret
            { ret := value }
            function prepare_store_t_uint256(value) -> ret
            { ret := value }
            function read_from_storage_split_dynamic_t_address(slot, offset) -> value
            {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)
            }
            function read_from_storage_split_offset_0_t_address(slot) -> value
            {
                value := extract_from_storage_value_offset_0t_address(sload(slot))
            }
            function read_from_storage_split_offset_0_t_bool(slot) -> value
            {
                value := extract_from_storage_value_offset_0t_bool(sload(slot))
            }
            function read_from_storage_split_offset_0_t_bytes32(slot) -> value
            {
                value := extract_from_storage_value_offset_0t_bytes32(sload(slot))
            }
            function read_from_storage_split_offset_0_t_uint256(slot) -> value
            {
                value := extract_from_storage_value_offset_0t_uint256(sload(slot))
            }
            function read_from_storage_split_offset_1_t_address(slot) -> value
            {
                value := extract_from_storage_value_offset_1t_address(sload(slot))
            }
            function require_helper(condition)
            {
                if iszero(condition) { revert(0, 0) }
            }
            function require_helper_t_stringliteral_0dc527e8fa9b76c996eb5eda9ddb749b21540f5509781b94e1e37f7027e7f50e(condition)
            {
                if iszero(condition)
                {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_0dc527e8fa9b76c996eb5eda9ddb749b21540f5509781b94e1e37f7027e7f50e__to_t_string_memory_ptr__fromStack(add(memPtr, 4))
                    revert(memPtr, sub(end, memPtr))
                }
            }
            function require_helper_t_stringliteral_56aab92b7164a4ea72a098d2d95a5e763b71d07f265e8d46fc7240404017fa84(condition)
            {
                if iszero(condition)
                {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_56aab92b7164a4ea72a098d2d95a5e763b71d07f265e8d46fc7240404017fa84__to_t_string_memory_ptr__fromStack(add(memPtr, 4))
                    revert(memPtr, sub(end, memPtr))
                }
            }
            function require_helper_t_stringliteral_657c6119c4ed567c60278fba62242b17c2fedf38962e651040dabfb3c9e15a5f(condition)
            {
                if iszero(condition)
                {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_657c6119c4ed567c60278fba62242b17c2fedf38962e651040dabfb3c9e15a5f__to_t_string_memory_ptr__fromStack(add(memPtr, 4))
                    revert(memPtr, sub(end, memPtr))
                }
            }
            function require_helper_t_stringliteral_80126ce3251ab2b6e4ade14fe5b2bc11f593510cbe9e3550c09bff1989e33b95(condition)
            {
                if iszero(condition)
                {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_80126ce3251ab2b6e4ade14fe5b2bc11f593510cbe9e3550c09bff1989e33b95__to_t_string_memory_ptr__fromStack(add(memPtr, 4))
                    revert(memPtr, sub(end, memPtr))
                }
            }
            function require_helper_t_stringliteral_8bd75322489f7ff7ab0b18506f4dcde935a32eca2a506b00f4d21b0becfa093c(condition)
            {
                if iszero(condition)
                {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_8bd75322489f7ff7ab0b18506f4dcde935a32eca2a506b00f4d21b0becfa093c__to_t_string_memory_ptr__fromStack(add(memPtr, 4))
                    revert(memPtr, sub(end, memPtr))
                }
            }
            function require_helper_t_stringliteral_d39b1db28626750c546703ffb72f30ea3facdfed1bebd47408e22ef18a76ba2d(condition)
            {
                if iszero(condition)
                {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_d39b1db28626750c546703ffb72f30ea3facdfed1bebd47408e22ef18a76ba2d__to_t_string_memory_ptr__fromStack(add(memPtr, 4))
                    revert(memPtr, sub(end, memPtr))
                }
            }
            function require_helper_t_stringliteral_f37bf1aca80f8fa291a40f639db6aeaa1425ceb0e8c61c8648f0e2efa282a947(condition)
            {
                if iszero(condition)
                {
                    let memPtr := allocate_unbounded()
                    mstore(memPtr, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                    let end := abi_encode_tuple_t_stringliteral_f37bf1aca80f8fa291a40f639db6aeaa1425ceb0e8c61c8648f0e2efa282a947__to_t_string_memory_ptr__fromStack(add(memPtr, 4))
                    revert(memPtr, sub(end, memPtr))
                }
            }
            function round_up_to_mul_of_32(value) -> result
            {
                result := and(add(value, 31), not(31))
            }
            function shift_left_0(value) -> newValue
            { newValue := shl(0, value) }
            function shift_left_8(value) -> newValue
            { newValue := shl(8, value) }
            function shift_right_0_unsigned(value) -> newValue
            { newValue := shr(0, value) }
            function shift_right_224_unsigned(value) -> newValue
            { newValue := shr(224, value) }
            function shift_right_8_unsigned(value) -> newValue
            { newValue := shr(8, value) }
            function shift_right_unsigned_dynamic(bits, value) -> newValue
            { newValue := shr(bits, value) }
            function storage_array_index_access_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(array, index) -> slot, offset
            {
                let arrayLength := array_length_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(array)
                if iszero(lt(index, arrayLength)) { panic_error_0x32() }
                let dataArea := array_dataslot_t_array$_t_struct$_Proposal_$16_storage_$dyn_storage(array)
                slot := add(dataArea, mul(index, 2))
                offset := 0
            }
            function store_literal_in_memory_0dc527e8fa9b76c996eb5eda9ddb749b21540f5509781b94e1e37f7027e7f50e(memPtr)
            {
                mstore(add(memPtr, 0), "Has no right to vote")
            }
            function store_literal_in_memory_56aab92b7164a4ea72a098d2d95a5e763b71d07f265e8d46fc7240404017fa84(memPtr)
            {
                mstore(add(memPtr, 0), "Already voted.")
            }
            function store_literal_in_memory_657c6119c4ed567c60278fba62242b17c2fedf38962e651040dabfb3c9e15a5f(memPtr)
            {
                mstore(add(memPtr, 0), "You already voted.")
            }
            function store_literal_in_memory_80126ce3251ab2b6e4ade14fe5b2bc11f593510cbe9e3550c09bff1989e33b95(memPtr)
            {
                mstore(add(memPtr, 0), "Only chairperson can give right ")
                mstore(add(memPtr, 32), "to vote.")
            }
            function store_literal_in_memory_8bd75322489f7ff7ab0b18506f4dcde935a32eca2a506b00f4d21b0becfa093c(memPtr)
            {
                mstore(add(memPtr, 0), "Found loop in delegation.")
            }
            function store_literal_in_memory_d39b1db28626750c546703ffb72f30ea3facdfed1bebd47408e22ef18a76ba2d(memPtr)
            {
                mstore(add(memPtr, 0), "The voter already voted.")
            }
            function store_literal_in_memory_f37bf1aca80f8fa291a40f639db6aeaa1425ceb0e8c61c8648f0e2efa282a947(memPtr)
            {
                mstore(add(memPtr, 0), "Self-delegation is disallowed.")
            }
            function update_byte_slice_1_shift_0(value, toInsert) -> result
            {
                let mask := 255
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }
            function update_byte_slice_20_shift_1(value, toInsert) -> result
            {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff00
                toInsert := shift_left_8(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }
            function update_byte_slice_32_shift_0(value, toInsert) -> result
            {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }
            function update_storage_value_offset_0t_bool_to_t_bool(slot, value_0)
            {
                let convertedValue_0 := convert_t_bool_to_t_bool(value_0)
                sstore(slot, update_byte_slice_1_shift_0(sload(slot), prepare_store_t_bool(convertedValue_0)))
            }
            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0)
            {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }
            function update_storage_value_offset_1t_address_to_t_address(slot, value_0)
            {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_1(sload(slot), prepare_store_t_address(convertedValue_0)))
            }
            function validator_revert_t_address(value)
            {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }
            function validator_revert_t_uint256(value)
            {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }
            function zero_value_for_split_t_bytes32() -> ret
            { ret := 0 }
            function zero_value_for_split_t_uint256() -> ret
            { ret := 0 }
        }
    }
}
