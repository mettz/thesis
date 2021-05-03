/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "C_39" {
    code {
        {
            mstore(64, 128)
            if callvalue() { revert(0, 0) }
            let _1 := datasize("C_39_deployed")
            codecopy(0, dataoffset("C_39_deployed"), _1)
            return(0, _1)
        }
    }
    object "C_39_deployed" {
        code {
            {
                mstore(64, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _1 := 0
                    switch shr(224, calldataload(_1))
                    case 0x13d1aa2e {
                        if callvalue() { revert(_1, _1) }
                        if slt(add(calldatasize(), not(3)), 64) { revert(_1, _1) }
                        let ret := fun_f(calldataload(4), calldataload(36))
                        let memPos := mload(64)
                        return(memPos, sub(abi_encode_uint256(memPos, ret), memPos))
                    }
                    case 0x1cd65ae4 {
                        if callvalue() { revert(_1, _1) }
                        let param, param_1 := abi_decode_uint256t_uint256(calldatasize())
                        let ret_1 := checked_mul_uint256(param, checked_add_uint256(param_1))
                        let memPos_1 := mload(64)
                        return(memPos_1, sub(abi_encode_uint256(memPos_1, ret_1), memPos_1))
                    }
                }
                revert(0, 0)
            }
            function abi_decode_uint256t_uint256(dataEnd) -> value0, value1
            {
                if slt(add(dataEnd, not(3)), 64) { revert(value0, value0) }
                value0 := calldataload(4)
                value1 := calldataload(36)
            }
            function abi_encode_uint256(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, value0)
            }
            function checked_add_uint256(x) -> sum
            {
                if gt(x, not(42)) { panic_error_0x11() }
                sum := add(x, 0x2a)
            }
            function checked_mul_uint256(x, y) -> product
            {
                if and(iszero(iszero(x)), gt(y, div(not(0), x))) { panic_error_0x11() }
                product := mul(x, y)
            }
            function fun_f(var_a, var_b) -> var
            {
                if gt(var_b, not(42)) { panic_error_0x11() }
                let expr := checked_mul_uint256(var_a, add(var_b, 0x2a))
                if gt(expr, not(timestamp())) { panic_error_0x11() }
                var := add(expr, timestamp())
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
