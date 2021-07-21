/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "Recursion_115" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("Recursion_115_deployed")
            codecopy(128, dataoffset("Recursion_115_deployed"), _1)
            return(128, _1)
        }
    }
    object "Recursion_115_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    switch shr(224, calldataload(_1))
                    case 0x7ff58107 {
                        if callvalue() { revert(_1, _1) }
                        abi_decode(calldatasize())
                        let ret := fun_get_fact1()
                        let memPos := mload(64)
                        return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
                    }
                    case 0x9899e555 {
                        if callvalue() { revert(_1, _1) }
                        let _2 := abi_decode_uint256(calldatasize())
                        emit __cost6
                        let var := fun_fib(_2)
                        let memPos_1 := mload(64)
                        return(memPos_1, sub(abi_encode_uint256(memPos_1, var), memPos_1))
                    }
                    case 0xdb134185 {
                        if callvalue() { revert(_1, _1) }
                        let ret_1 := fun_get_fact(abi_decode_uint256(calldatasize()))
                        let memPos_2 := mload(64)
                        return(memPos_2, sub(abi_encode_uint256(memPos_2, ret_1), memPos_2))
                    }
                    case 0xf17b85cd {
                        if callvalue() { revert(_1, _1) }
                        abi_decode(calldatasize())
                        let ret_2 := fun_get_fib1()
                        let memPos_3 := mload(64)
                        return(memPos_3, sub(abi_encode_uint256(memPos_3, ret_2), memPos_3))
                    }
                }
                revert(0, 0)
            }
            function abi_decode(dataEnd)
            {
                if slt(add(dataEnd, not(3)), 0) { revert(0, 0) }
            }
            function abi_decode_uint256(dataEnd) -> value0
            {
                if slt(add(dataEnd, not(3)), 32) { revert(0, 0) }
                value0 := calldataload(4)
            }
            function abi_encode_uint256(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, value0)
            }
            function fun_fact_tail(var_n, var_a) -> var
            {
                emit __cost3
                switch iszero(gt(var_n, 0x01))
                case 0 {
                    emit __cost5
                    if lt(var_n, 0x01) { panic_error_0x11() }
                    let _1 := not(0)
                    if and(iszero(iszero(var_n)), gt(var_a, div(_1, var_n))) { panic_error_0x11() }
                    var := fun_fact_tail(add(var_n, _1), mul(var_n, var_a))
                    leave
                }
                default {
                    emit __cost4
                    var := var_a
                    leave
                }
            }
            function fun_fib(var_x) -> var
            {
                emit __cost0
                switch lt(var_x, 0x02)
                case 0 {
                    emit __cost2
                    if lt(var_x, 0x01) { panic_error_0x11() }
                    let expr := fun_fib(add(var_x, not(0)))
                    let _1 := fun_fib(add(var_x, not(1)))
                    if gt(expr, not(_1)) { panic_error_0x11() }
                    var := add(expr, _1)
                    leave
                }
                default {
                    emit __cost1
                    var := 0x01
                    leave
                }
            }
            function fun_get_fact1() -> var
            {
                emit __cost9
                var := fun_fact_tail(0x01, 0x01)
            }
            function fun_get_fact(var_n) -> var
            {
                emit __cost8
                var := fun_fact_tail(var_n, 0x01)
            }
            function fun_get_fib1() -> var_
            {
                emit __cost7
                var_ := fun_fib(0x01)
            }
            function panic_error_0x11()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x11)
                revert(0, 0x24)
            }
        }
    }
}
