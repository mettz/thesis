/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "Purchase_229" {
    code {
        {
            mstore(64, 128)
            sstore(0x01, or(and(sload(0x01), not(sub(shl(160, 1), 1))), caller()))
            let _1 := shr(0x01, callvalue())
            sstore(0x00, _1)
            if and(0x01, gt(_1, sub(shl(255, 1), 1)))
            {
                mstore(0x00, shl(224, 0x4e487b71))
                mstore(4, 0x11)
                revert(0x00, 0x24)
            }
            if iszero(eq(and(callvalue(), not(1)), callvalue()))
            {
                mstore(128, shl(225, 0x5f1f2621))
                revert(128, 4)
            }
            let _2 := datasize("Purchase_229_deployed")
            codecopy(0x00, dataoffset("Purchase_229_deployed"), _2)
            return(0x00, _2)
        }
    }
    object "Purchase_229_deployed" {
        code {
            {
                let _1 := 64
                mstore(_1, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _2 := 0
                    switch shr(224, calldataload(_2))
                    case 0x08551a53 {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        return(128, add(abi_encode_address_payable_1839(and(sload(1), sub(shl(160, 1), 1))), not(127)))
                    }
                    case 0x35a063b4 {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        modifier_onlySeller_117()
                        return(mload(_1), _2)
                    }
                    case 0x3fa4f245 {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let _3 := sload(_2)
                        let memPos := mload(_1)
                        return(memPos, sub(abi_encode_uint256(memPos, _3), memPos))
                    }
                    case 0x7150d8ae {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret := and(sload(2), sub(shl(160, 1), 1))
                        let memPos_1 := mload(_1)
                        return(memPos_1, sub(abi_encode_address_payable(memPos_1, ret), memPos_1))
                    }
                    case 0x73fac6f0 {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        modifier_onlyBuyer()
                        return(mload(_1), _2)
                    }
                    case 0xc19d93fb {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret_1 := and(shr(160, sload(2)), 0xff)
                        let memPos_2 := mload(_1)
                        return(memPos_2, sub(abi_encode_enum_State(memPos_2, ret_1), memPos_2))
                    }
                    case 0xc7981b1b {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        modifier_onlySeller()
                        return(mload(_1), _2)
                    }
                    case 0xd6960697 {
                        abi_decode(calldatasize())
                        modifier_inState()
                        return(mload(_1), _2)
                    }
                }
                revert(0, 0)
            }
            function abi_decode(dataEnd)
            {
                if slt(add(dataEnd, not(3)), 0) { revert(0, 0) }
            }
            function abi_encode_address_payable_1839(value0) -> tail
            {
                tail := 160
                mstore(128, and(value0, sub(shl(160, 1), 1)))
            }
            function abi_encode_address_payable(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, and(value0, sub(shl(160, 1), 1)))
            }
            function abi_encode_enum_State(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                if iszero(lt(value0, 4))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x21)
                    revert(0, 0x24)
                }
                mstore(headStart, value0)
            }
            function abi_encode_uint256(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, value0)
            }
            function modifier_inState()
            {
                let _1 := sload(0x02)
                let value := and(shr(160, _1), 0xff)
                if iszero(lt(value, 4))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x21)
                    revert(0, 0x24)
                }
                if iszero(iszero(value))
                {
                    let _2 := mload(64)
                    mstore(_2, shl(224, 0xbaf3f0f7))
                    revert(_2, 4)
                }
                let _3 := 0x00
                let _4 := sload(_3)
                if and(1, gt(_4, sub(shl(255, 1), 1)))
                {
                    mstore(_3, shl(224, 0x4e487b71))
                    mstore(4, 0x11)
                    revert(_3, 0x24)
                }
                if iszero(eq(callvalue(), shl(1, _4))) { revert(_3, _3) }
                log1(mload(64), _3, 0xd5d55c8a68912e9a110618df8d5e2e83b8d83211c57a8ddd1203df92885dc881)
                sstore(0x02, or(and(_1, shl(160, 0xffffffffffffffffffffffff)), caller()))
                sstore(0x02, or(or(and(_1, shl(168, 0xffffffffffffffffffffff)), and(caller(), not(shl(160, 255)))), shl(160, 1)))
            }
            function modifier_onlyBuyer()
            {
                let _1 := sload(0x02)
                let _2 := and(_1, sub(shl(160, 1), 1))
                if iszero(eq(caller(), _2))
                {
                    let _3 := mload(64)
                    mstore(_3, shl(224, 0x86efbb55))
                    revert(_3, 4)
                }
                let value := and(shr(160, _1), 0xff)
                if iszero(lt(value, 4))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x21)
                    revert(0, 0x24)
                }
                if iszero(eq(value, 1))
                {
                    let _4 := mload(64)
                    mstore(_4, shl(224, 0xbaf3f0f7))
                    revert(_4, 4)
                }
                let _5 := 0
                log1(mload(64), _5, 0xe89152acd703c9d8c7d28829d443260b411454d45394e7995815140c8cbcbcf7)
                sstore(0x02, or(and(_1, not(shl(160, 255))), shl(161, 1)))
                let _6 := sload(_5)
                let _7 := _5
                if iszero(_6) { _7 := 2300 }
                if iszero(call(_7, _2, _6, _5, _5, _5, _5))
                {
                    returndatacopy(_5, _5, returndatasize())
                    revert(_5, returndatasize())
                }
            }
            function modifier_onlySeller_117()
            {
                let _1 := sub(shl(160, 1), 1)
                if iszero(eq(caller(), and(sload(0x01), _1)))
                {
                    let _2 := mload(64)
                    mstore(_2, shl(225, 0x42e8fb93))
                    revert(_2, 4)
                }
                let value := and(shr(160, sload(0x02)), 0xff)
                if iszero(lt(value, 4))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x21)
                    revert(0, 0x24)
                }
                if iszero(iszero(value))
                {
                    let _3 := mload(64)
                    mstore(_3, shl(224, 0xbaf3f0f7))
                    revert(_3, 4)
                }
                let _4 := 0
                log1(mload(64), _4, 0x72c874aeff0b183a56e2b79c71b46e1aed4dee5e09862134b8821ba2fddbf8bf)
                update_storage_value_offsett_enum_State_to_enum_State()
                let cleaned := and(sload(0x01), _1)
                let expr := selfbalance()
                let _5 := _4
                if iszero(expr) { _5 := 2300 }
                if iszero(call(_5, cleaned, expr, _4, _4, _4, _4))
                {
                    returndatacopy(_4, _4, returndatasize())
                    revert(_4, returndatasize())
                }
            }
            function modifier_onlySeller()
            {
                let _1 := sub(shl(160, 1), 1)
                if iszero(eq(caller(), and(sload(0x01), _1)))
                {
                    let _2 := mload(64)
                    mstore(_2, shl(225, 0x42e8fb93))
                    revert(_2, 4)
                }
                let value := and(shr(160, sload(2)), 0xff)
                if iszero(lt(value, 4))
                {
                    mstore(0, shl(224, 0x4e487b71))
                    mstore(4, 0x21)
                    revert(0, 0x24)
                }
                if iszero(eq(value, 2))
                {
                    let _3 := mload(64)
                    mstore(_3, shl(224, 0xbaf3f0f7))
                    revert(_3, 4)
                }
                let _4 := 0
                log1(mload(64), _4, 0xfda69c32bcfdba840a167777906b173b607eb8b4d8853b97a80d26e613d858db)
                update_storage_value_offsett_enum_State_to_enum_State()
                let cleaned := and(sload(0x01), _1)
                let _5 := sload(_4)
                if and(0x01, gt(_5, 0x5555555555555555555555555555555555555555555555555555555555555555))
                {
                    mstore(_4, shl(224, 0x4e487b71))
                    mstore(4, 0x11)
                    revert(_4, 0x24)
                }
                let product := mul(3, _5)
                let _6 := _4
                if iszero(product) { _6 := 2300 }
                if iszero(call(_6, cleaned, product, _4, _4, _4, _4))
                {
                    returndatacopy(_4, _4, returndatasize())
                    revert(_4, returndatasize())
                }
            }
            function update_storage_value_offsett_enum_State_to_enum_State()
            {
                sstore(0x02, or(and(sload(0x02), not(shl(160, 255))), shl(160, 3)))
            }
        }
    }
}
