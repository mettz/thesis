/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "priced_54" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("priced_54_deployed")
            codecopy(0, dataoffset("priced_54_deployed"), _1)
            return(0, _1)
        }
    }
    object "priced_54_deployed" {
        code {
            {
                mstore(64, 128)
                revert(0, 0)
            }
        }
    }
}
