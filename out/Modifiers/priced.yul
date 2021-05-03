/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "priced_54" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_priced_54()

        codecopy(0, dataoffset("priced_54_deployed"), datasize("priced_54_deployed"))

        return(0, datasize("priced_54_deployed"))

        function constructor_priced_54() {

        }

    }
    object "priced_54_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

        }

    }

}

