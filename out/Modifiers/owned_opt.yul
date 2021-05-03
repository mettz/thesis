/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "owned_28" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            sstore(0, or(and(sload(0), not(sub(shl(160, 1), 1))), caller()))
            let _1 := datasize("owned_28_deployed")
            codecopy(0, dataoffset("owned_28_deployed"), _1)
            return(0, _1)
        }
    }
    object "owned_28_deployed" {
        code {
            {
                mstore(64, 128)
                revert(0, 0)
            }
        }
    }
}
