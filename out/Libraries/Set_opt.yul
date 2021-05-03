/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "Set_80" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("Set_80_deployed")
            codecopy(0, dataoffset("Set_80_deployed"), _1)
            setimmutable(0, "library_deploy_address", address())
            return(0, _1)
        }
    }
    object "Set_80_deployed" {
        code {
            {
                mstore(64, 128)
                let _1 := eq(loadimmutable("library_deploy_address"), address())
                if iszero(lt(calldatasize(), 4))
                {
                    switch shr(224, calldataload(0))
                    case 0x3ab90ad8 {
                        if _1 { revert(0, 0) }
                        let param, param_1 := abi_decode_struct_Data_storage_ptrt_uint256(calldatasize())
                        let ret := fun_insert(param, param_1)
                        let memPos := mload(64)
                        return(memPos, sub(abi_encode_bool(memPos, ret), memPos))
                    }
                    case 0x438854c1 {
                        let param_2, param_3 := abi_decode_struct_Data_storage_ptrt_uint256(calldatasize())
                        let ret_1 := read_from_storage_split_offset_bool(mapping_index_access_mapping_uint256_bool_of_uint256(param_2, param_3))
                        let memPos_1 := mload(64)
                        return(memPos_1, sub(abi_encode_bool(memPos_1, ret_1), memPos_1))
                    }
                    case 0x9ffe9b2f {
                        if _1 { revert(0, 0) }
                        let param_4, param_5 := abi_decode_struct_Data_storage_ptrt_uint256(calldatasize())
                        let ret_2 := fun_remove(param_4, param_5)
                        let memPos_2 := mload(64)
                        return(memPos_2, sub(abi_encode_bool(memPos_2, ret_2), memPos_2))
                    }
                }
                revert(0, 0)
            }
            function abi_decode_struct_Data_storage_ptrt_uint256(dataEnd) -> value0, value1
            {
                if slt(add(dataEnd, not(3)), 64) { revert(value0, value0) }
                value0 := calldataload(4)
                value1 := calldataload(36)
            }
            function abi_encode_bool(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, iszero(iszero(value0)))
            }
            function fun_insert(var_self_9_slot, var_value) -> var
            {
                mstore(var, var_value)
                mstore(0x20, var_self_9_slot)
                if and(sload(keccak256(var, 0x40)), 0xff)
                {
                    var := var
                    leave
                }
                mstore(0, var_value)
                mstore(0x20, var_self_9_slot)
                let dataSlot := keccak256(0, 0x40)
                sstore(dataSlot, or(and(sload(dataSlot), not(255)), 0x01))
                var := 0x01
            }
            function fun_remove(var_self_slot, var_value) -> var
            {
                mstore(var, var_value)
                mstore(0x20, var_self_slot)
                if iszero(and(sload(keccak256(var, 0x40)), 0xff))
                {
                    var := var
                    leave
                }
                mstore(0, var_value)
                mstore(0x20, var_self_slot)
                let dataSlot := keccak256(0, 0x40)
                sstore(dataSlot, and(sload(dataSlot), not(255)))
                var := 1
            }
            function mapping_index_access_mapping_uint256_bool_of_uint256(slot, key) -> dataSlot
            {
                mstore(dataSlot, key)
                mstore(0x20, slot)
                dataSlot := keccak256(dataSlot, 0x40)
            }
            function read_from_storage_split_offset_bool(slot) -> value
            {
                value := and(sload(slot), 0xff)
            }
        }
    }
}
