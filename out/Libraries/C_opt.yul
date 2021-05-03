/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "C_98" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("C_98_deployed")
            codecopy(0, dataoffset("C_98_deployed"), _1)
            return(0, _1)
        }
    }
    object "C_98_deployed" {
        code {
            {
                let _1 := 128
                mstore(64, _1)
                if iszero(lt(calldatasize(), 4))
                {
                    let _2 := 0
                    if eq(0xf207564e, shr(224, calldataload(_2)))
                    {
                        if callvalue() { revert(_2, _2) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_2, _2) }
                        let expr_address := linkersymbol("examples/Libraries.sol:Set")
                        if iszero(extcodesize(expr_address)) { revert(_2, _2) }
                        mstore(_1, shl(227, 0x0757215b))
                        mstore(132, _2)
                        mstore(164, calldataload(4))
                        let _3 := delegatecall(gas(), expr_address, _1, 68, _1, 32)
                        if iszero(_3)
                        {
                            returndatacopy(_2, _2, returndatasize())
                            revert(_2, returndatasize())
                        }
                        let expr := _2
                        if _3
                        {
                            let newFreePtr := add(_1, and(add(returndatasize(), 31), not(31)))
                            if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, _1))
                            {
                                mstore(_2, shl(224, 0x4e487b71))
                                mstore(4, 0x41)
                                revert(_2, 36)
                            }
                            mstore(64, newFreePtr)
                            expr := abi_decode_bool_fromMemory(add(_1, returndatasize()))
                        }
                        require_helper(expr)
                        return(mload(64), _2)
                    }
                }
                revert(0, 0)
            }
            function abi_decode_bool_fromMemory(dataEnd) -> value0
            {
                if slt(add(dataEnd, not(127)), 32) { revert(value0, value0) }
                let value := mload(128)
                if iszero(eq(value, iszero(iszero(value)))) { revert(value0, value0) }
                value0 := value
            }
            function require_helper(condition)
            {
                if iszero(condition) { revert(0, 0) }
            }
        }
    }
}
