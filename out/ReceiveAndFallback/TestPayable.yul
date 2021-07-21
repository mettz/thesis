/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "TestPayable_46" {
    code {
        mstore(64, 128)
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_TestPayable_46()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("TestPayable_46_deployed"), datasize("TestPayable_46_deployed"))

        return(_1, datasize("TestPayable_46_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function constructor_TestPayable_46() {

        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

    }
    object "TestPayable_46_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                default {}
            }
            if iszero(calldatasize()) { fun__45() stop() }
            fun__31() stop()

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_uint256_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function fun__31() {

                emit __cost1
                let expr_22 := 0x01
                let _1 := convert_t_rational_1_by_1_to_t_uint256(expr_22)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x00, _1)
                let expr_23 := _1
                let expr_27 := callvalue()
                update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_27)
                let expr_28 := expr_27

            }

            function fun__45() {

                emit __cost2
                let expr_36 := 0x02
                let _2 := convert_t_rational_2_by_1_to_t_uint256(expr_36)
                update_storage_value_offset_0t_uint256_to_t_uint256(0x00, _2)
                let expr_37 := _2
                let expr_41 := callvalue()
                update_storage_value_offset_0t_uint256_to_t_uint256(0x01, expr_41)
                let expr_42 := expr_41

            }

            function prepare_store_t_uint256(value) -> ret {
                ret := value
            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function update_byte_slice_32_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function update_storage_value_offset_0t_uint256_to_t_uint256(slot, value_0) {
                let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
                sstore(slot, update_byte_slice_32_shift_0(sload(slot), prepare_store_t_uint256(convertedValue_0)))
            }

        }

    }

}

