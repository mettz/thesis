/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "TokenCreator_124" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("TokenCreator_124_deployed")
            codecopy(0, dataoffset("TokenCreator_124_deployed"), _1)
            return(0, _1)
        }
    }
    object "TokenCreator_124_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    switch shr(224, calldataload(_1))
                    case 0x7379b422 {
                        if callvalue() { revert(_1, _1) }
                        let param, param_1 := abi_decode_contract_OwnedTokent_bytes32(calldatasize())
                        fun_changeName(param, param_1)
                        return(mload(64), _1)
                    }
                    case 0xae3edb65 {
                        if callvalue() { revert(_1, _1) }
                        let ret := fun_createToken(abi_decode_bytes32(calldatasize()))
                        let memPos := mload(64)
                        return(memPos, sub(abi_encode_contract_OwnedToken(memPos, ret), memPos))
                    }
                    case 0xc3cee9c1 {
                        if callvalue() { revert(_1, _1) }
                        let param_2, param_3 := abi_decode_addresst_address(calldatasize())
                        let ret_1 := fun_isTokenTransferOK(param_2, param_3)
                        let memPos_1 := mload(64)
                        return(memPos_1, sub(abi_encode_bool(memPos_1, ret_1), memPos_1))
                    }
                }
                revert(0, 0)
            }
            function abi_decode_addresst_address(dataEnd) -> value0, value1
            {
                if slt(add(dataEnd, not(3)), 64) { revert(value0, value0) }
                let value := calldataload(4)
                validator_revert_address(value)
                value0 := value
                let value_1 := calldataload(36)
                validator_revert_address(value_1)
                value1 := value_1
            }
            function abi_decode_bytes32(dataEnd) -> value0
            {
                if slt(add(dataEnd, not(3)), 32) { revert(value0, value0) }
                value0 := calldataload(4)
            }
            function abi_decode_contract_OwnedTokent_bytes32(dataEnd) -> value0, value1
            {
                if slt(add(dataEnd, not(3)), 64) { revert(value0, value0) }
                let value := calldataload(4)
                validator_revert_address(value)
                value0 := value
                value1 := calldataload(36)
            }
            function abi_encode_bool(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, iszero(iszero(value0)))
            }
            function abi_encode_contract_OwnedToken(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, and(value0, sub(shl(160, 1), 1)))
            }
            function fun_changeName(var_tokenAddress_89_address, var_name)
            {
                let expr_address := and(var_tokenAddress_89_address, sub(shl(160, 1), 1))
                if iszero(extcodesize(expr_address)) { revert(0, 0) }
                let _1 := mload(64)
                mstore(_1, shl(224, 0x898855ed))
                mstore(add(_1, 4), var_name)
                let _2 := 0
                let _3 := call(gas(), expr_address, _2, _1, 36, _1, _2)
                if iszero(_3)
                {
                    returndatacopy(_2, _2, returndatasize())
                    revert(_2, returndatasize())
                }
                if _3
                {
                    let newFreePtr := add(_1, and(add(returndatasize(), 31), not(31)))
                    if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, _1)) { panic_error_0x41() }
                    mstore(64, newFreePtr)
                    if slt(sub(add(_1, returndatasize()), _1), _2) { revert(_2, _2) }
                }
            }
            function fun_createToken(var_name) -> var_tokenAddress_address
            {
                let _1 := mload(64)
                let _2 := datasize("OwnedToken_71")
                let _3 := add(_1, _2)
                if or(gt(_3, 0xffffffffffffffff), lt(_3, _1)) { panic_error_0x41() }
                datacopy(_1, dataoffset("OwnedToken_71"), _2)
                mstore(_3, var_name)
                let expr_83_address := create(var_tokenAddress_address, _1, add(sub(_3, _1), 32))
                if iszero(expr_83_address)
                {
                    returndatacopy(var_tokenAddress_address, var_tokenAddress_address, returndatasize())
                    revert(var_tokenAddress_address, returndatasize())
                }
                var_tokenAddress_address := expr_83_address
            }
            function fun_isTokenTransferOK(var_currentOwner, var_newOwner) -> var_ok
            {
                let expr_mpos := mload(64)
                let _1 := add(expr_mpos, 0x20)
                let _2 := not(0xffffffffffffffffffffffff)
                mstore(_1, and(shl(96, var_currentOwner), _2))
                mstore(add(expr_mpos, 52), and(shl(96, var_newOwner), _2))
                mstore(expr_mpos, 40)
                let newFreePtr := add(expr_mpos, 96)
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, expr_mpos)) { panic_error_0x41() }
                mstore(64, newFreePtr)
                let expr := keccak256(_1, mload(expr_mpos))
                if iszero(lt(var_ok, 0x20))
                {
                    mstore(var_ok, shl(224, 0x4e487b71))
                    mstore(4, 0x32)
                    revert(var_ok, 0x24)
                }
                var_ok := eq(and(shl(248, byte(var_ok, expr)), shl(248, 255)), shl(248, 127))
            }
            function panic_error_0x41()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            function validator_revert_address(value)
            {
                if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(0, 0) }
            }
        }
        object "OwnedToken_71" {
            code {
                {
                    mstore(64, 128)
                    if callvalue() { revert(0, 0) }
                    let programSize := datasize("OwnedToken_71")
                    let argSize := sub(codesize(), programSize)
                    let newFreePtr := add(128, and(add(argSize, 31), not(31)))
                    if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, 128))
                    {
                        mstore(0, shl(224, 0x4e487b71))
                        mstore(4, 0x41)
                        revert(0, 0x24)
                    }
                    mstore(64, newFreePtr)
                    codecopy(128, programSize, argSize)
                    if slt(argSize, 32) { revert(0, 0) }
                    constructor_OwnedToken(mload(128))
                    let _1 := datasize("OwnedToken_71_deployed")
                    codecopy(0, dataoffset("OwnedToken_71_deployed"), _1)
                    return(0, _1)
                }
                function constructor_OwnedToken(var_name)
                {
                    let _1 := shl(160, 0xffffffffffffffffffffffff)
                    sstore(0x01, or(and(sload(0x01), _1), caller()))
                    sstore(0, or(and(sload(0), _1), caller()))
                    sstore(0x02, var_name)
                }
            }
            object "OwnedToken_71_deployed" {
                code {
                    {
                        mstore(64, 128)
                        if iszero(lt(calldatasize(), 4))
                        {
                            let _1 := 0
                            switch shr(224, calldataload(_1))
                            case 0x1a695230 {
                                if callvalue() { revert(_1, _1) }
                                if slt(add(calldatasize(), not(3)), 32) { revert(_1, _1) }
                                let value := calldataload(4)
                                if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(_1, _1) }
                                fun_transfer(value)
                                return(mload(64), _1)
                            }
                            case 0x898855ed {
                                if callvalue() { revert(_1, _1) }
                                fun_changeName(abi_decode_bytes32(calldatasize()))
                                return(mload(64), _1)
                            }
                        }
                        revert(0, 0)
                    }
                    function abi_decode_bool_fromMemory(headStart, dataEnd) -> value0
                    {
                        if slt(sub(dataEnd, headStart), 32) { revert(value0, value0) }
                        let value := mload(headStart)
                        if iszero(eq(value, iszero(iszero(value)))) { revert(value0, value0) }
                        value0 := value
                    }
                    function abi_decode_bytes32(dataEnd) -> value0
                    {
                        if slt(add(dataEnd, not(3)), 32) { revert(value0, value0) }
                        value0 := calldataload(4)
                    }
                    function abi_encode_address_address(headStart, value0, value1) -> tail
                    {
                        tail := add(headStart, 64)
                        let _1 := sub(shl(160, 1), 1)
                        mstore(headStart, and(value0, _1))
                        mstore(add(headStart, 32), and(value1, _1))
                    }
                    function cleanup_from_storage_address(value) -> cleaned
                    {
                        cleaned := and(value, sub(shl(160, 1), 1))
                    }
                    function finalize_allocation(memPtr, size)
                    {
                        let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
                        if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr))
                        {
                            mstore(0, shl(224, 0x4e487b71))
                            mstore(4, 0x41)
                            revert(0, 0x24)
                        }
                        mstore(64, newFreePtr)
                    }
                    function fun_changeName(var_newName)
                    {
                        if eq(caller(), and(sload(0x00), sub(shl(160, 1), 1))) { sstore(0x02, var_newName) }
                    }
                    function fun_transfer(var_newOwner)
                    {
                        let _1 := cleanup_from_storage_address(sload(0x01))
                        if iszero(eq(caller(), and(_1, sub(shl(160, 1), 1)))) { leave }
                        let expr_address := cleanup_from_storage_address(cleanup_from_storage_address(sload(0x00)))
                        if iszero(extcodesize(expr_address)) { revert(0x00, 0x00) }
                        let _2 := mload(64)
                        mstore(_2, shl(224, 0xc3cee9c1))
                        let _3 := staticcall(gas(), expr_address, _2, sub(abi_encode_address_address(add(_2, 4), _1, var_newOwner), _2), _2, 32)
                        if iszero(_3) { revert_forward() }
                        let expr := 0x00
                        if _3
                        {
                            finalize_allocation(_2, returndatasize())
                            expr := abi_decode_bool_fromMemory(_2, add(_2, returndatasize()))
                        }
                        if expr
                        {
                            update_storage_value_offsett_address_to_address(var_newOwner)
                        }
                    }
                    function revert_forward()
                    {
                        returndatacopy(0, 0, returndatasize())
                        revert(0, returndatasize())
                    }
                    function update_storage_value_offsett_address_to_address(value)
                    {
                        sstore(0x01, or(and(sload(0x01), shl(160, 0xffffffffffffffffffffffff)), and(value, sub(shl(160, 1), 1))))
                    }
                }
            }
        }
    }
}
