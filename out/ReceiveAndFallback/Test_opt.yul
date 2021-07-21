/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "Test_13" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("Test_13_deployed")
            codecopy(128, dataoffset("Test_13_deployed"), _1)
            return(128, _1)
        }
    }
    object "Test_13_deployed" {
        code {
            {
                mstore(64, 128)
                if callvalue() { revert(0, 0) }
                emit __cost0
                sstore(0x00, 0x01)
                stop()
            }
        }
    }
}
