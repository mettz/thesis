/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "E_86" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("E_86_deployed")
            codecopy(0, dataoffset("E_86_deployed"), _1)
            return(0, _1)
        }
    }
    object "E_86_deployed" {
        code {
            {
                let _1 := 64
                mstore(_1, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _2 := 0
                    switch shr(224, calldataload(_2))
                    case 0x0c55699c {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret := fun_x()
                        let memPos := mload(_1)
                        return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
                    }
                    case 0x3bc5de30 {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret_1 := sload(0x01)
                        let memPos_1 := mload(_1)
                        return(memPos_1, sub(abi_encode_uint256(memPos_1, ret_1), memPos_1))
                    }
                    case 0x5b4b73a9 {
                        if callvalue() { revert(_2, _2) }
                        fun_setData(abi_decode_uint256(calldatasize()))
                        return(mload(_1), _2)
                    }
                    case 0x73d4a13a {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let _3 := sload(1)
                        let memPos_2 := mload(_1)
                        return(memPos_2, sub(abi_encode_uint256(memPos_2, _3), memPos_2))
                    }
                    case 0xd112200e {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let _4 := sload(_2)
                        let memPos_3 := mload(_1)
                        return(memPos_3, sub(abi_encode_uint256(memPos_3, _4), memPos_3))
                    }
                    case 0xe2179b8e {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        fun_g()
                        return(mload(_1), _2)
                    }
                }
                revert(0, 0)
            }
            function abi_decode(dataEnd)
            {
                if slt(add(dataEnd, not(3)), 0) { revert(0, 0) }
            }
            function abi_decode_uint256(dataEnd) -> value0
            {
                if slt(add(dataEnd, not(3)), 32) { revert(value0, value0) }
                value0 := calldataload(4)
            }
            function abi_encode_uint256(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, value0)
            }
            function fun_g()
            {
                let _1 := mload(64)
                let _2 := datasize("C_64")
                let _3 := add(_1, _2)
                if or(gt(_3, 0xffffffffffffffff), lt(_3, _1)) { panic_error_0x41() }
                datacopy(_1, dataoffset("C_64"), _2)
                if iszero(create(0, _1, sub(_3, _1)))
                {
                    returndatacopy(0, 0, returndatasize())
                    revert(0, returndatasize())
                }
            }
            function fun_setData(var_a)
            { sstore(0x01, var_a) }
            function fun_x() -> var
            {
                sstore(0x01, 0x03)
                if iszero(extcodesize(address())) { revert(var, var) }
                let _1 := mload(64)
                mstore(_1, shl(225, 0x39ea509d))
                let _2 := staticcall(gas(), address(), _1, 4, _1, 32)
                if iszero(_2)
                {
                    returndatacopy(var, var, returndatasize())
                    revert(var, returndatasize())
                }
                let expr := var
                if _2
                {
                    let newFreePtr := add(_1, and(add(returndatasize(), 31), not(31)))
                    if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, _1)) { panic_error_0x41() }
                    mstore(64, newFreePtr)
                    if slt(sub(add(_1, returndatasize()), _1), 32) { revert(var, var) }
                    expr := mload(_1)
                }
                var := expr
            }
            function panic_error_0x41()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
        }
        object "C_64" {
            code {
                {
                    mstore(64, 128)
                    if callvalue() { revert(0, 0) }
                    let _1 := datasize("C_64_deployed")
                    codecopy(0, dataoffset("C_64_deployed"), _1)
                    return(0, _1)
                }
            }
            object "C_64_deployed" {
                code {
                    {
                        let _1 := 64
                        mstore(_1, 128)
                        if iszero(lt(calldatasize(), 4))
                        {
                            let _2 := 0
                            switch shr(224, calldataload(_2))
                            case 0x0c55699c {
                                if callvalue() { revert(_2, _2) }
                                abi_decode(calldatasize())
                                let ret := fun_x()
                                let memPos := mload(_1)
                                return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
                            }
                            case 0x3bc5de30 {
                                if callvalue() { revert(_2, _2) }
                                abi_decode(calldatasize())
                                let ret_1 := sload(0x01)
                                let memPos_1 := mload(_1)
                                return(memPos_1, sub(abi_encode_uint256(memPos_1, ret_1), memPos_1))
                            }
                            case 0x5b4b73a9 {
                                if callvalue() { revert(_2, _2) }
                                fun_setData(abi_decode_uint256(calldatasize()))
                                return(mload(_1), _2)
                            }
                            case 0x73d4a13a {
                                if callvalue() { revert(_2, _2) }
                                abi_decode(calldatasize())
                                let _3 := sload(1)
                                let memPos_2 := mload(_1)
                                return(memPos_2, sub(abi_encode_uint256(memPos_2, _3), memPos_2))
                            }
                            case 0xd112200e {
                                if callvalue() { revert(_2, _2) }
                                abi_decode(calldatasize())
                                let _4 := sload(_2)
                                let memPos_3 := mload(_1)
                                return(memPos_3, sub(abi_encode_uint256(memPos_3, _4), memPos_3))
                            }
                        }
                        revert(0, 0)
                    }
                    function abi_decode(dataEnd)
                    {
                        if slt(add(dataEnd, not(3)), 0) { revert(0, 0) }
                    }
                    function abi_decode_uint256(dataEnd) -> value0
                    {
                        if slt(add(dataEnd, not(3)), 32) { revert(value0, value0) }
                        value0 := calldataload(4)
                    }
                    function abi_decode_uint256_fromMemory(headStart, dataEnd) -> value0
                    {
                        if slt(sub(dataEnd, headStart), 32) { revert(value0, value0) }
                        value0 := mload(headStart)
                    }
                    function abi_encode_uint256(headStart, value0) -> tail
                    {
                        tail := add(headStart, 32)
                        mstore(headStart, value0)
                    }
                    function fun_setData(var_a)
                    { sstore(0x01, var_a) }
                    function fun_x() -> var
                    {
                        sstore(0x01, 0x03)
                        if iszero(extcodesize(address())) { revert(var, var) }
                        let _1 := mload(64)
                        mstore(_1, shl(225, 0x39ea509d))
                        let _2 := staticcall(gas(), address(), _1, 4, _1, 32)
                        if iszero(_2)
                        {
                            returndatacopy(var, var, returndatasize())
                            revert(var, returndatasize())
                        }
                        let expr := var
                        if _2
                        {
                            let newFreePtr := add(_1, and(add(returndatasize(), 31), not(31)))
                            if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, _1))
                            {
                                mstore(var, shl(224, 0x4e487b71))
                                mstore(4, 0x41)
                                revert(var, 0x24)
                            }
                            mstore(64, newFreePtr)
                            expr := abi_decode_uint256_fromMemory(_1, add(_1, returndatasize()))
                        }
                        var := expr
                    }
                }
            }
        }
    }
}
