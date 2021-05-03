/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "C_55" {
    code {
        {
            mstore(64, 224)
            if callvalue() { revert(0, 0) }
            let programSize := datasize("C_55")
            let argSize := sub(codesize(), programSize)
            let newFreePtr := add(224, and(add(argSize, 31), not(31)))
            if or(gt(newFreePtr, sub(shl(64, 1), 1)), lt(newFreePtr, 224))
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            mstore(64, newFreePtr)
            codecopy(224, programSize, argSize)
            if slt(argSize, 64) { revert(0, 0) }
            let value := mload(224)
            let value_1 := mload(256)
            if iszero(eq(value_1, and(value_1, sub(shl(160, 1), 1)))) { revert(0, 0) }
            constructor_C(value, value_1)
            let _1 := mload(128)
            let _2 := mload(160)
            let _3 := mload(192)
            let _4 := datasize("C_55_deployed")
            codecopy(0, dataoffset("C_55_deployed"), _4)
            setimmutable(0, "24", _3)
            setimmutable(0, "20", _2)
            setimmutable(0, "18", _1)
            return(0, _4)
        }
        function constructor_C(var_decimals, var_reference)
        {
            mstore(192, caller())
            mstore(128, var_decimals)
            mstore(160, balance(var_reference))
        }
    }
    object "C_55_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    if eq(0xfb499085, shr(224, calldataload(_1)))
                    {
                        if callvalue() { revert(_1, _1) }
                        if slt(add(calldatasize(), not(3)), 32) { revert(_1, _1) }
                        let value := calldataload(4)
                        if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(_1, _1) }
                        let expr := balance(value)
                        return(128, add(abi_encode_bool(gt(expr, loadimmutable("20"))), not(127)))
                    }
                }
                revert(0, 0)
            }
            function abi_encode_bool(value0) -> tail
            {
                tail := 160
                mstore(128, iszero(iszero(value0)))
            }
        }
    }
}
