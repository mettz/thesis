/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "Ballot_314" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let programSize := datasize("Ballot_314")
            let argSize := sub(codesize(), programSize)
            let memoryDataOffset := allocate_memory(argSize)
            codecopy(memoryDataOffset, programSize, argSize)
            let _1 := add(memoryDataOffset, argSize)
            let _2 := 32
            if slt(sub(_1, memoryDataOffset), _2) { revert(0, 0) }
            let offset := mload(memoryDataOffset)
            let _3 := sub(shl(64, 1), 1)
            if gt(offset, _3) { revert(0, 0) }
            let _4 := add(memoryDataOffset, offset)
            if iszero(slt(add(_4, 0x1f), _1)) { revert(0, 0) }
            let _5 := mload(_4)
            if gt(_5, _3) { panic_error_0x41() }
            let _6 := shl(5, _5)
            let dst := allocate_memory(add(_6, _2))
            let dst_1 := dst
            mstore(dst, _5)
            dst := add(dst, _2)
            let src := add(_4, _2)
            if gt(add(add(_4, _6), _2), _1) { revert(0, 0) }
            let i := 0
            for { } lt(i, _5) { i := add(i, 1) }
            {
                mstore(dst, mload(src))
                dst := add(dst, _2)
                src := add(src, _2)
            }
            constructor_Ballot(dst_1)
            let _7 := datasize("Ballot_314_deployed")
            codecopy(0, dataoffset("Ballot_314_deployed"), _7)
            return(0, _7)
        }
        function allocate_memory(size) -> memPtr
        {
            memPtr := mload(64)
            let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
            if or(gt(newFreePtr, sub(shl(64, 1), 1)), lt(newFreePtr, memPtr)) { panic_error_0x41() }
            mstore(64, newFreePtr)
        }
        function array_push_from_struct_Proposal_to_array_struct_Proposal_storage_dyn_ptr(array, value0)
        {
            let oldLen := sload(array)
            if iszero(lt(oldLen, 18446744073709551616)) { panic_error_0x41() }
            let _1 := add(oldLen, 1)
            sstore(array, _1)
            if iszero(lt(oldLen, _1))
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x32)
                revert(0, 0x24)
            }
            mstore(0, array)
            let data := keccak256(0, 0x20)
            let slot := add(data, shl(1, oldLen))
            sstore(slot, mload(value0))
            sstore(add(slot, 1), mload(add(value0, 0x20)))
        }
        function constructor_Ballot(var_proposalNames_mpos)
        {
            let _1 := 0x00
            sstore(_1, or(and(sload(_1), not(sub(shl(160, 1), 1))), caller()))
            mstore(_1, caller())
            let _2 := 0x01
            let _3 := 0x20
            mstore(_3, _2)
            let _4 := 0x40
            sstore(keccak256(_1, _4), _2)
            let var_i := _1
            for { }
            _2
            {
                if eq(var_i, not(0))
                {
                    mstore(_1, shl(224, 0x4e487b71))
                    mstore(4, 0x11)
                    revert(_1, 0x24)
                }
                var_i := add(var_i, _2)
            }
            {
                if iszero(lt(var_i, mload(var_proposalNames_mpos))) { break }
                let returnValue := mload(add(add(var_proposalNames_mpos, shl(5, var_i)), _3))
                let expr_mpos := allocate_memory(_4)
                mstore(expr_mpos, returnValue)
                mstore(add(expr_mpos, _3), _1)
                array_push_from_struct_Proposal_to_array_struct_Proposal_storage_dyn_ptr(0x02, expr_mpos)
            }
        }
        function panic_error_0x41()
        {
            mstore(0, shl(224, 0x4e487b71))
            mstore(4, 0x41)
            revert(0, 0x24)
        }
    }
    object "Ballot_314_deployed" {
        code {
            {
                mstore(64, 128)
                let _1 := 4
                if iszero(lt(calldatasize(), _1))
                {
                    let _2 := 0
                    switch shr(224, calldataload(_2))
                    case 0x0121b93f {
                        if callvalue() { revert(_2, _2) }
                        fun_vote(abi_decode_uint256(_1, calldatasize()))
                        return(allocate_memory(_2), _2)
                    }
                    case 0x013cf08b {
                        if callvalue() { revert(_2, _2) }
                        let ret, ret_1 := getter_fun_proposals(abi_decode_uint256(_1, calldatasize()))
                        let memPos := allocate_memory(_2)
                        return(memPos, sub(abi_encode_bytes32_uint256(memPos, ret, ret_1), memPos))
                    }
                    case 0x2e4176cf {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(_1, calldatasize())
                        let ret_2 := and(sload(_2), sub(shl(160, 1), 1))
                        let memPos_1 := allocate_memory(_2)
                        return(memPos_1, sub(abi_encode_address(memPos_1, ret_2), memPos_1))
                    }
                    case 0x5c19a95c {
                        if callvalue() { revert(_2, _2) }
                        fun_delegate(abi_decode_address(_1, calldatasize()))
                        return(allocate_memory(_2), _2)
                    }
                    case 0x609ff1bd {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(_1, calldatasize())
                        let ret_3 := fun_winningProposal()
                        let memPos_2 := allocate_memory(_2)
                        return(memPos_2, sub(abi_encode_bytes32(memPos_2, ret_3), memPos_2))
                    }
                    case 0x9e7b8d61 {
                        if callvalue() { revert(_2, _2) }
                        fun_giveRightToVote(abi_decode_address(_1, calldatasize()))
                        return(allocate_memory(_2), _2)
                    }
                    case 0xa3ec138d {
                        if callvalue() { revert(_2, _2) }
                        let ret_4, ret_5, ret_6, ret_7 := getter_fun_voters(abi_decode_address(_1, calldatasize()))
                        let memPos_3 := allocate_memory(_2)
                        return(memPos_3, sub(abi_encode_uint256_bool_address_uint256(memPos_3, ret_4, ret_5, ret_6, ret_7), memPos_3))
                    }
                    case 0xe2ba53f0 {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(_1, calldatasize())
                        let ret_8 := fun_winnerName()
                        let memPos_4 := allocate_memory(_2)
                        return(memPos_4, sub(abi_encode_bytes32(memPos_4, ret_8), memPos_4))
                    }
                }
                revert(0, 0)
            }
            function abi_decode(headStart, dataEnd)
            {
                if slt(sub(dataEnd, headStart), 0) { revert(0, 0) }
            }
            function abi_decode_address(headStart, dataEnd) -> value0
            {
                if slt(sub(dataEnd, headStart), 32) { revert(value0, value0) }
                let value := calldataload(headStart)
                if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(value0, value0) }
                value0 := value
            }
            function abi_decode_uint256(headStart, dataEnd) -> value0
            {
                if slt(sub(dataEnd, headStart), 32) { revert(value0, value0) }
                value0 := calldataload(headStart)
            }
            function abi_encode_address(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, and(value0, sub(shl(160, 1), 1)))
            }
            function abi_encode_bytes32(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, value0)
            }
            function abi_encode_bytes32_uint256(headStart, value0, value1) -> tail
            {
                tail := add(headStart, 64)
                mstore(headStart, value0)
                mstore(add(headStart, 32), value1)
            }
            function abi_encode_uint256_bool_address_uint256(headStart, value0, value1, value2, value3) -> tail
            {
                tail := add(headStart, 128)
                mstore(headStart, value0)
                mstore(add(headStart, 32), iszero(iszero(value1)))
                mstore(add(headStart, 64), and(value2, sub(shl(160, 1), 1)))
                mstore(add(headStart, 96), value3)
            }
            function allocate_memory(size) -> memPtr
            {
                memPtr := mload(64)
                let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x41)
                    revert(0, 0x24)
                }
                mstore(64, newFreePtr)
            }
            function checked_add_uint256(x, y) -> sum
            {
                if gt(x, not(y)) { panic_error_0x11() }
                sum := add(x, y)
            }
            function cleanup_from_storage_address(value) -> cleaned
            {
                cleaned := and(value, sub(shl(160, 1), 1))
            }
            function cleanup_bool(value) -> cleaned
            {
                cleaned := iszero(iszero(value))
            }
            function extract_from_storage_value_offsett_bool(slot_value) -> value
            {
                value := and(slot_value, 0xff)
            }
            function fun_delegate(var_to)
            {
                let _1 := 0x01
                let _2 := mapping_index_access_mapping_address_struct_Voter_storage_of_address(_1, caller())
                let _3 := add(_2, _1)
                require_helper_stringliteral_657c(cleanup_bool(iszero(extract_from_storage_value_offsett_bool(sload(_3)))))
                let _4 := sub(shl(160, 1), 1)
                require_helper_stringliteral_f37b(iszero(eq(and(var_to, _4), caller())))
                for { } _1 { }
                {
                    if iszero(cleanup_from_storage_address(read_from_storage_split_offset_address(add(mapping_index_access_mapping_address_struct_Voter_storage_of_address(_1, var_to), _1)))) { break }
                    var_to := read_from_storage_split_offset_address(add(mapping_index_access_mapping_address_struct_Voter_storage_of_address(_1, var_to), _1))
                    require_helper_stringliteral_8bd7(iszero(eq(and(var_to, _4), caller())))
                }
                update_storage_value_offsett_bool_to_bool(_3, _1)
                update_storage_value_offsett_address_to_address(_3, var_to)
                let _5 := mapping_index_access_mapping_address_struct_Voter_storage_of_address(_1, var_to)
                switch extract_from_storage_value_offsett_bool(sload(add(_5, _1)))
                case 0 {
                    sstore(_5, checked_add_uint256(sload(_5), sload(_2)))
                }
                default {
                    let _6 := sload(_2)
                    let _7, _8 := storage_array_index_access_struct_Proposal__dyn(0x02, sload(add(_5, 0x02)))
                    let _9 := add(_7, _1)
                    sstore(_9, checked_add_uint256(sload(_9), _6))
                }
            }
            function fun_giveRightToVote(var_voter)
            {
                let _1 := sub(shl(160, 1), 1)
                if iszero(eq(caller(), and(sload(0x00), _1)))
                {
                    let memPtr := mload(64)
                    mstore(memPtr, shl(229, 4594637))
                    mstore(add(memPtr, 4), 32)
                    mstore(add(memPtr, 36), 40)
                    mstore(add(memPtr, 68), "Only chairperson can give right ")
                    mstore(add(memPtr, 100), "to vote.")
                    revert(memPtr, 132)
                }
                mstore(0x00, and(var_voter, _1))
                mstore(0x20, 0x01)
                require_helper_stringliteral_d39b(cleanup_bool(iszero(read_from_storage_split_offset_bool(add(keccak256(0x00, 0x40), 0x01)))))
                require_helper(iszero(sload(mapping_index_access_mapping_address_struct_Voter_storage_of_address(0x01, var_voter))))
                sstore(mapping_index_access_mapping_address_struct_Voter_storage_of_address(0x01, var_voter), 0x01)
            }
            function fun_vote(var_proposal)
            {
                mstore(0, caller())
                mstore(0x20, 0x01)
                let dataSlot := keccak256(0, 0x40)
                if iszero(sload(dataSlot))
                {
                    let memPtr := mload(0x40)
                    mstore(memPtr, shl(229, 4594637))
                    mstore(add(memPtr, 4), 0x20)
                    mstore(add(memPtr, 36), 20)
                    mstore(add(memPtr, 68), "Has no right to vote")
                    revert(memPtr, 100)
                }
                let _1 := add(dataSlot, 0x01)
                if iszero(iszero(and(sload(_1), 0xff)))
                {
                    let memPtr_1 := mload(0x40)
                    mstore(memPtr_1, shl(229, 4594637))
                    mstore(add(memPtr_1, 4), 0x20)
                    mstore(add(memPtr_1, 36), 14)
                    mstore(add(memPtr_1, 68), "Already voted.")
                    revert(memPtr_1, 100)
                }
                update_storage_value_offsett_bool_to_bool(_1, 0x01)
                sstore(add(dataSlot, 2), var_proposal)
                let _2 := sload(dataSlot)
                let _3, _4 := storage_array_index_access_struct_Proposal__dyn(2, var_proposal)
                let _5 := add(_3, 0x01)
                sstore(_5, checked_add_uint256(sload(_5), _2))
            }
            function fun_winnerName() -> var_winnerName
            {
                let _1, _2 := storage_array_index_access_struct_Proposal__dyn(0x02, fun_winningProposal())
                var_winnerName := sload(_1)
            }
            function fun_winningProposal() -> var_winningProposal
            {
                var_winningProposal := var_winningProposal
                let var_winningVoteCount := 0x00
                let var_p := var_winningVoteCount
                let _1 := 0x02
                let _2 := sload(_1)
                for { }
                lt(var_p, _2)
                {
                    if eq(var_p, not(0)) { panic_error_0x11() }
                    var_p := add(var_p, 1)
                }
                {
                    let _3, _4 := storage_array_index_access_struct_Proposal__dyn(_1, var_p)
                    let _5 := 1
                    if gt(sload(add(_3, _5)), var_winningVoteCount)
                    {
                        let _6, _7 := storage_array_index_access_struct_Proposal__dyn(_1, var_p)
                        var_winningVoteCount := sload(add(_6, _5))
                        var_winningProposal := var_p
                    }
                }
            }
            function getter_fun_proposals(key) -> ret, ret_1
            {
                if iszero(lt(key, sload(2))) { revert(ret_1, ret_1) }
                let slot, offset := storage_array_index_access_struct_Proposal__dyn(2, key)
                ret := sload(slot)
                ret_1 := sload(add(slot, 1))
            }
            function getter_fun_voters(key) -> ret, ret_1, ret_2, ret_3
            {
                let _1 := sub(shl(160, 1), 1)
                mstore(ret_2, and(key, _1))
                mstore(0x20, 1)
                let dataSlot := keccak256(ret_2, 0x40)
                ret := sload(dataSlot)
                let _2 := sload(add(dataSlot, 1))
                ret_1 := and(_2, 0xff)
                ret_2 := and(shr(8, _2), _1)
                ret_3 := sload(add(dataSlot, 2))
            }
            function mapping_index_access_mapping_address_struct_Voter_storage_of_address(slot, key) -> dataSlot
            {
                mstore(dataSlot, and(key, sub(shl(160, 1), 1)))
                mstore(0x20, slot)
                dataSlot := keccak256(dataSlot, 0x40)
            }
            function panic_error_0x11()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x11)
                revert(0, 0x24)
            }
            function read_from_storage_split_offset_bool(slot) -> value
            {
                value := and(sload(slot), 0xff)
            }
            function read_from_storage_split_offset_address(slot) -> value
            {
                value := and(shr(8, sload(slot)), sub(shl(160, 1), 1))
            }
            function require_helper(condition)
            {
                if iszero(condition) { revert(0, 0) }
            }
            function require_helper_stringliteral_657c(condition)
            {
                if iszero(condition)
                {
                    let memPtr := mload(64)
                    mstore(memPtr, shl(229, 4594637))
                    mstore(add(memPtr, 4), 32)
                    mstore(add(memPtr, 36), 18)
                    mstore(add(memPtr, 68), "You already voted.")
                    revert(memPtr, 100)
                }
            }
            function require_helper_stringliteral_8bd7(condition)
            {
                if iszero(condition)
                {
                    let memPtr := mload(64)
                    mstore(memPtr, shl(229, 4594637))
                    mstore(add(memPtr, 4), 32)
                    mstore(add(memPtr, 36), 25)
                    mstore(add(memPtr, 68), "Found loop in delegation.")
                    revert(memPtr, 100)
                }
            }
            function require_helper_stringliteral_d39b(condition)
            {
                if iszero(condition)
                {
                    let memPtr := mload(64)
                    mstore(memPtr, shl(229, 4594637))
                    mstore(add(memPtr, 4), 32)
                    mstore(add(memPtr, 36), 24)
                    mstore(add(memPtr, 68), "The voter already voted.")
                    revert(memPtr, 100)
                }
            }
            function require_helper_stringliteral_f37b(condition)
            {
                if iszero(condition)
                {
                    let memPtr := mload(64)
                    mstore(memPtr, shl(229, 4594637))
                    mstore(add(memPtr, 4), 32)
                    mstore(add(memPtr, 36), 30)
                    mstore(add(memPtr, 68), "Self-delegation is disallowed.")
                    revert(memPtr, 100)
                }
            }
            function storage_array_index_access_struct_Proposal__dyn(array, index) -> slot, offset
            {
                if iszero(lt(index, sload(array)))
                {
                    mstore(offset, shl(224, 0x4e487b71))
                    mstore(4, 0x32)
                    revert(offset, 0x24)
                }
                mstore(offset, array)
                let data := keccak256(offset, 0x20)
                slot := add(data, shl(1, index))
                offset := offset
            }
            function update_storage_value_offsett_bool_to_bool(slot, value)
            {
                let value_1 := and(sload(slot), not(255))
                sstore(slot, or(value_1, and(iszero(iszero(value)), 255)))
            }
            function update_storage_value_offsett_address_to_address(slot, value)
            {
                let _1 := sload(slot)
                sstore(slot, or(and(_1, not(sub(shl(168, 1), 256))), and(shl(8, value), sub(shl(168, 1), 256))))
            }
        }
    }
}
