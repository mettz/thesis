/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "C_39" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_C_39()

        codecopy(0, dataoffset("C_39_deployed"), datasize("C_39_deployed"))

        return(0, datasize("C_39_deployed"))

        function constructor_C_39() {

        }

    }
    object "C_39_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x13d1aa2e
                {
                    // f(uint256,uint256)

                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    let ret_0 :=  fun_f_21(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x1cd65ae4
                {
                    // g(uint256,uint256)

                    if callvalue() { revert(0, 0) }
                    let param_0, param_1 :=  abi_decode_tuple_t_uint256t_uint256(4, calldatasize())
                    let ret_0 :=  fun_g_38(param_0, param_1)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_uint256t_uint256(headStart, dataEnd) -> value0, value1 {
                if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

                {

                    let offset := 32

                    value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple_t_uint256__to_t_uint256__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function checked_add_t_uint256(x, y) -> sum {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x > (maxValue - y)
                if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }

                sum := add(x, y)
            }

            function checked_mul_t_uint256(x, y) -> product {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                // overflow, if x != 0 and y > (maxValue / x)
                if and(iszero(iszero(x)), gt(y, div(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, x))) { panic_error_0x11() }

                product := mul(x, y)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_42_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function fun_f_21(var_a_3, var_b_5) -> var__8 {
                let zero_t_uint256_1 := zero_value_for_split_t_uint256()
                var__8 := zero_t_uint256_1

                let _2 := var_a_3
                let expr_10 := _2
                let _3 := var_b_5
                let expr_11 := _3
                let expr_12 := 0x2a
                let expr_13 := checked_add_t_uint256(expr_11, convert_t_rational_42_by_1_to_t_uint256(expr_12))

                let expr_14 := expr_13
                let expr_15 := checked_mul_t_uint256(expr_10, expr_14)

                let expr_17 := timestamp()
                let expr_18 := checked_add_t_uint256(expr_15, expr_17)

                var__8 := expr_18
                leave

            }

            function fun_g_38(var_a_23, var_b_25) -> var__28 {
                let zero_t_uint256_4 := zero_value_for_split_t_uint256()
                var__28 := zero_t_uint256_4

                let _5 := var_a_23
                let expr_30 := _5
                let _6 := var_b_25
                let expr_31 := _6
                let expr_32 := 0x2a
                let expr_33 := checked_add_t_uint256(expr_31, convert_t_rational_42_by_1_to_t_uint256(expr_32))

                let expr_34 := expr_33
                let expr_35 := checked_mul_t_uint256(expr_30, expr_34)

                var__28 := expr_35
                leave

            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

            function zero_value_for_split_t_uint256() -> ret {
                ret := 0
            }

        }

    }

}

