/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "SimpleAuction_171" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let programSize := datasize("SimpleAuction_171")
            let argSize := sub(codesize(), programSize)
            let newFreePtr := add(128, and(add(argSize, 31), not(31)))
            if or(gt(newFreePtr, sub(shl(64, 1), 1)), lt(newFreePtr, 128))
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            mstore(64, newFreePtr)
            codecopy(128, programSize, argSize)
            if slt(argSize, 64) { revert(0, 0) }
            let value := mload(128)
            let value_1 := mload(160)
            if iszero(eq(value_1, and(value_1, sub(shl(160, 1), 1)))) { revert(0, 0) }
            constructor_SimpleAuction(value, value_1)
            let _1 := datasize("SimpleAuction_171_deployed")
            codecopy(0, dataoffset("SimpleAuction_171_deployed"), _1)
            return(0, _1)
        }
        function constructor_SimpleAuction(var_biddingTime, var_beneficiary)
        {
            sstore(0x00, or(and(sload(0x00), not(sub(shl(160, 1), 1))), and(var_beneficiary, sub(shl(160, 1), 1))))
            if gt(timestamp(), not(var_biddingTime))
            {
                mstore(0x00, shl(224, 0x4e487b71))
                mstore(4, 0x11)
                revert(0x00, 0x24)
            }
            sstore(0x01, add(timestamp(), var_biddingTime))
        }
    }
    object "SimpleAuction_171_deployed" {
        code {
            {
                let _1 := 64
                mstore(_1, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _2 := 0
                    switch shr(224, calldataload(_2))
                    case 0x1998aeef {
                        abi_decode(calldatasize())
                        fun_bid()
                        return(mload(_1), _2)
                    }
                    case 0x2a24f46c {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        fun_auctionEnd()
                        return(mload(_1), _2)
                    }
                    case 0x38af3eed {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret := and(sload(_2), sub(shl(160, 1), 1))
                        let memPos := mload(_1)
                        return(memPos, sub(abi_encode_address(memPos, ret), memPos))
                    }
                    case 0x3ccfd60b {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret_1 := fun_withdraw()
                        let memPos_1 := mload(_1)
                        return(memPos_1, sub(abi_encode_bool(memPos_1, ret_1), memPos_1))
                    }
                    case 0x4b449cba {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let _3 := sload(1)
                        let memPos_2 := mload(_1)
                        return(memPos_2, sub(abi_encode_uint256(memPos_2, _3), memPos_2))
                    }
                    case 0x91f90157 {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret_2 := and(sload(2), sub(shl(160, 1), 1))
                        let memPos_3 := mload(_1)
                        return(memPos_3, sub(abi_encode_address(memPos_3, ret_2), memPos_3))
                    }
                    case 0xd57bde79 {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let _4 := sload(3)
                        let memPos_4 := mload(_1)
                        return(memPos_4, sub(abi_encode_uint256(memPos_4, _4), memPos_4))
                    }
                }
                revert(0, 0)
            }
            function abi_decode(dataEnd)
            {
                if slt(add(dataEnd, not(3)), 0) { revert(0, 0) }
            }
            function abi_encode_address(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, and(value0, sub(shl(160, 1), 1)))
            }
            function abi_encode_address_uint256(headStart, value0, value1) -> tail
            {
                tail := add(headStart, 64)
                mstore(headStart, and(value0, sub(shl(160, 1), 1)))
                mstore(add(headStart, 32), value1)
            }
            function abi_encode_bool(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, iszero(iszero(value0)))
            }
            function abi_encode_uint256(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, value0)
            }
            function checked_add_uint256(x, y) -> sum
            {
                if gt(x, not(y))
                {
                    mstore(sum, shl(224, 0x4e487b71))
                    mstore(4, 0x11)
                    revert(sum, 0x24)
                }
                sum := add(x, y)
            }
            function cleanup_from_storage_address(value) -> cleaned
            {
                cleaned := and(value, sub(shl(160, 1), 1))
            }
            function fun_auctionEnd()
            {
                let _1 := 0x00
                let cleaned := and(sload(_1), sub(shl(160, 1), 1))
                let _2 := sload(0x03)
                let _3 := _1
                if iszero(_2) { _3 := 2300 }
                if iszero(call(_3, cleaned, _2, _1, _1, _1, _1))
                {
                    returndatacopy(_1, _1, returndatasize())
                    revert(_1, returndatasize())
                }
            }
            function fun_bid()
            {
                if gt(timestamp(), sload(0x01))
                {
                    let _1 := mload(64)
                    mstore(_1, shl(224, 0xd02e774d))
                    revert(_1, 4)
                }
                let _2 := sload(0x03)
                if iszero(gt(callvalue(), _2))
                {
                    let _3 := mload(64)
                    mstore(_3, shl(224, 0x4e12c1bb))
                    revert(_3, sub(abi_encode_uint256(add(_3, 4), _2), _3))
                }
                if iszero(iszero(_2))
                {
                    let _4 := mapping_index_access_mapping_address_uint256_of_address(cleanup_from_storage_address(sload(0x02)))
                    sstore(_4, checked_add_uint256(sload(_4), _2))
                }
                update_storage_value_offsett_address_to_address(caller())
                update_storage_value_offsett_uint256_to_uint256(callvalue())
                let _5 := mload(64)
                log1(_5, sub(abi_encode_address_uint256(_5, caller(), callvalue()), _5), 0xf4757a49b326036464bec6fe419a4ae38c8a02ce3e68bf0809674f6aab8ad300)
            }
            function fun_withdraw() -> var
            {
                mstore(var, caller())
                mstore(0x20, 0x04)
                let _1 := sload(keccak256(var, 0x40))
                if gt(_1, var)
                {
                    mstore(var, caller())
                    mstore(0x20, 0x04)
                    sstore(keccak256(var, 0x40), var)
                    let _2 := var
                    if iszero(_1) { _2 := 2300 }
                    if iszero(call(_2, caller(), _1, var, var, var, var))
                    {
                        sstore(mapping_index_access_mapping_address_uint256_of_address(caller()), _1)
                        var := var
                        leave
                    }
                }
                var := 0x01
            }
            function mapping_index_access_mapping_address_uint256_of_address(key) -> dataSlot
            {
                mstore(dataSlot, and(key, sub(shl(160, 1), 1)))
                mstore(0x20, 0x04)
                dataSlot := keccak256(dataSlot, 0x40)
            }
            function update_storage_value_offsett_address_to_address(value)
            {
                sstore(0x02, or(and(sload(0x02), shl(160, 0xffffffffffffffffffffffff)), and(value, sub(shl(160, 1), 1))))
            }
            function update_storage_value_offsett_uint256_to_uint256(value)
            { sstore(0x03, value) }
        }
    }
}
