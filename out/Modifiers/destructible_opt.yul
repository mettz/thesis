/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "destructible_41" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            sstore(0, or(and(sload(0), not(sub(shl(160, 1), 1))), caller()))
            let _1 := datasize("destructible_41_deployed")
            codecopy(0, dataoffset("destructible_41_deployed"), _1)
            return(0, _1)
        }
    }
    object "destructible_41_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    if eq(0x83197ef0, shr(224, calldataload(_1)))
                    {
                        if callvalue() { revert(_1, _1) }
                        if slt(add(calldatasize(), not(3)), _1) { revert(_1, _1) }
                        if iszero(eq(caller(), and(sload(_1), sub(shl(160, 1), 1))))
                        {
                            mstore(128, shl(229, 4594637))
                            mstore(132, 32)
                            mstore(164, 34)
                            mstore(196, "Only owner can call this functio")
                            mstore(228, "n.")
                            revert(128, 132)
                        }
                        fun_destroy_inner()
                        return(128, _1)
                    }
                }
                revert(0, 0)
            }
            function fun_destroy_inner()
            {
                selfdestruct(and(sload(0x00), sub(shl(160, 1), 1)))
            }
        }
    }
}
