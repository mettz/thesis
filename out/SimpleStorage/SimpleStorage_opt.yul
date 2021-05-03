/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "SimpleStorage_26" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("SimpleStorage_26_deployed")
            codecopy(0, dataoffset("SimpleStorage_26_deployed"), _1)
            return(0, _1)
        }
    }
    object "SimpleStorage_26_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    if eq(0x6d4ce63c, shr(224, calldataload(_1)))
                    {
                        if callvalue() { revert(_1, _1) }
                        if slt(add(calldatasize(), not(3)), _1) { revert(_1, _1) }
                        sstore(_1, 0xfe)
                        mstore(128, 0xfe)
                        return(128, 32)
                    }
                }
                revert(0, 0)
            }
        }
    }
}
