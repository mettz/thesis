/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "Recursion_115" {
    code {
        mstore(64, 128)
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_Recursion_115()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("Recursion_115_deployed"), datasize("Recursion_115_deployed"))

        return(_1, datasize("Recursion_115_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function constructor_Recursion_115() {

        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

    }
    object "Recursion_115_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x7ff58107
                {
                    // get_fact1()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_get_fact1_114()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0x9899e555
                {
                    // get_fib(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_get_fib_77(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xdb134185
                {
                    // get_fact(uint256)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    let ret_0 :=  fun_get_fact_102(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xf17b85cd
                {
                    // get_fib1()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  fun_get_fib1_88()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_uint256__to_t_uint256__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74()

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
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

            function checked_sub_t_uint256(x, y) -> diff {
                x := cleanup_t_uint256(x)
                y := cleanup_t_uint256(y)

                if lt(x, y) { panic_error_0x11() }

                diff := sub(x, y)
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_rational_1_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function convert_t_rational_2_by_1_to_t_uint256(value) -> converted {
                converted := cleanup_t_uint256(value)
            }

            function fun_fact_tail_64(var_n_36, var_a_38) -> var__41 {
                let zero_t_uint256_12 := zero_value_for_split_t_uint256()
                var__41 := zero_t_uint256_12

                emit __cost3
                let _13 := var_n_36
                let expr_44 := _13
                let expr_45 := 0x01
                let expr_46 := iszero(gt(cleanup_t_uint256(expr_44), convert_t_rational_1_by_1_to_t_uint256(expr_45)))
                switch expr_46
                case 0 {
                    emit __cost5
                    let expr_52_functionIdentifier := 64
                    let _14 := var_n_36
                    let expr_53 := _14
                    let expr_54 := 0x01
                    let expr_55 := checked_sub_t_uint256(expr_53, convert_t_rational_1_by_1_to_t_uint256(expr_54))

                    let _15 := var_n_36
                    let expr_56 := _15
                    let _16 := var_a_38
                    let expr_57 := _16
                    let expr_58 := checked_mul_t_uint256(expr_56, expr_57)

                    let expr_59 := fun_fact_tail_64(expr_55, expr_58)
                    var__41 := expr_59
                    leave
                }
                default {
                    emit __cost4
                    let _17 := var_a_38
                    let expr_48 := _17
                    var__41 := expr_48
                    leave
                }

            }

            function fun_fib_34(var_x_5) -> var__8 {
                let zero_t_uint256_3 := zero_value_for_split_t_uint256()
                var__8 := zero_t_uint256_3

                emit __cost0
                let _4 := var_x_5
                let expr_11 := _4
                let expr_12 := 0x02
                let expr_13 := lt(cleanup_t_uint256(expr_11), convert_t_rational_2_by_1_to_t_uint256(expr_12))
                switch expr_13
                case 0 {
                    emit __cost2
                    let expr_19_functionIdentifier := 34
                    let _5 := var_x_5
                    let expr_20 := _5
                    let expr_21 := 0x01
                    let expr_22 := checked_sub_t_uint256(expr_20, convert_t_rational_1_by_1_to_t_uint256(expr_21))

                    let expr_23 := fun_fib_34(expr_22)
                    let expr_24_functionIdentifier := 34
                    let _6 := var_x_5
                    let expr_25 := _6
                    let expr_26 := 0x02
                    let expr_27 := checked_sub_t_uint256(expr_25, convert_t_rational_2_by_1_to_t_uint256(expr_26))

                    let expr_28 := fun_fib_34(expr_27)
                    let expr_29 := checked_add_t_uint256(expr_23, expr_28)

                    var__8 := expr_29
                    leave
                }
                default {
                    emit __cost1
                    let expr_15 := 0x01
                    var__8 := convert_t_rational_1_by_1_to_t_uint256(expr_15)
                    leave
                }

            }

            function fun_get_fact1_114() -> var__105 {
                let zero_t_uint256_18 := zero_value_for_split_t_uint256()
                var__105 := zero_t_uint256_18

                emit __cost9
                let expr_108_functionIdentifier := 64
                let expr_109 := 0x01
                let expr_110 := 0x01
                let _19 := convert_t_rational_1_by_1_to_t_uint256(expr_109)
                let _20 := convert_t_rational_1_by_1_to_t_uint256(expr_110)
                let expr_111 := fun_fact_tail_64(_19, _20)
                var__105 := expr_111
                leave

            }

            function fun_get_fact_102(var_n_90) -> var__93 {
                let zero_t_uint256_9 := zero_value_for_split_t_uint256()
                var__93 := zero_t_uint256_9

                emit __cost8
                let expr_96_functionIdentifier := 64
                let _10 := var_n_90
                let expr_97 := _10
                let expr_98 := 0x01
                let _11 := convert_t_rational_1_by_1_to_t_uint256(expr_98)
                let expr_99 := fun_fact_tail_64(expr_97, _11)
                var__93 := expr_99
                leave

            }

            function fun_get_fib1_88() -> var__80 {
                let zero_t_uint256_7 := zero_value_for_split_t_uint256()
                var__80 := zero_t_uint256_7

                emit __cost7
                let expr_83_functionIdentifier := 34
                let expr_84 := 0x01
                let _8 := convert_t_rational_1_by_1_to_t_uint256(expr_84)
                let expr_85 := fun_fib_34(_8)
                var__80 := expr_85
                leave

            }

            function fun_get_fib_77(var_x_66) -> var__69 {
                let zero_t_uint256_1 := zero_value_for_split_t_uint256()
                var__69 := zero_t_uint256_1

                emit __cost6
                let expr_72_functionIdentifier := 34
                let _2 := var_x_66
                let expr_73 := _2
                let expr_74 := fun_fib_34(expr_73)
                var__69 := expr_74
                leave

            }

            function panic_error_0x11() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x11)
                revert(0, 0x24)
            }

            function revert_error_42b3090547df1d2001c96683413b8cf91c1b902ef5e3cb8d9f6f304cf7446f74() {
                revert(0, 0)
            }

            function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
                revert(0, 0)
            }

            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
                revert(0, 0)
            }

            function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
                revert(0, 0)
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

