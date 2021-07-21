/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "TestPayable_46" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("TestPayable_46_deployed")
            codecopy(128, dataoffset("TestPayable_46_deployed"), _1)
            return(128, _1)
        }
    }
    object "TestPayable_46_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(calldatasize())
                {
                    emit __cost2
                    sstore(0x00, 0x02)
                    sstore(0x01, callvalue())
                    stop()
                }
                emit __cost1
                sstore(0x00, 0x01)
                sstore(0x01, callvalue())
                stop()
            }
        }
    }
}
