/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "D_14" {
    code {
        {
            mstore(64, 128)
            let programSize := datasize("D_14")
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
            if slt(argSize, 32) { revert(0, 0) }
            sstore(0x00, mload(128))
            let _1 := datasize("D_14_deployed")
            codecopy(0x00, dataoffset("D_14_deployed"), _1)
            return(0x00, _1)
        }
    }
    object "D_14_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    if eq(0x0c55699c, shr(224, calldataload(_1)))
                    {
                        if callvalue() { revert(_1, _1) }
                        if slt(add(calldatasize(), not(3)), _1) { revert(_1, _1) }
                        mstore(128, sload(_1))
                        return(128, 32)
                    }
                }
                revert(0, 0)
            }
        }
    }
}
