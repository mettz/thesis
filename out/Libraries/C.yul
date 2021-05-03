/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/


object "C_98" {
    code {
        mstore(64, 128)
        if callvalue() { revert(0, 0) }

        constructor_C_98()

        codecopy(0, dataoffset("C_98_deployed"), datasize("C_98_deployed"))

        return(0, datasize("C_98_deployed"))

        function constructor_C_98() {

        }

    }
    object "C_98_deployed" {
        code {
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0xf207564e
                {
                    // register(uint256)

                    if callvalue() { revert(0, 0) }
                    let param_0 :=  abi_decode_tuple_t_uint256(4, calldatasize())
                    fun_register_97(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }
            if iszero(calldatasize()) {  }
            revert(0, 0)

            function abi_decode_t_bool_fromMemory(offset, end) -> value {
                value := mload(offset)
                validator_revert_t_bool(value)
            }

            function abi_decode_t_uint256(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_uint256(value)
            }

            function abi_decode_tuple_t_bool_fromMemory(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_bool_fromMemory(add(headStart, offset), dataEnd)
                }

            }

            function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

                {

                    let offset := 0

                    value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_t_struct$_Data_$6_storage_to_t_uint256_fromStack_library(value, pos) {
                mstore(pos, value)
            }

            function abi_encode_t_uint256_to_t_uint256_fromStack_library(value, pos) {
                mstore(pos, cleanup_t_uint256(value))
            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function abi_encode_tuple_t_struct$_Data_$6_storage_t_uint256__to_t_uint256_t_uint256__fromStack_library(headStart , value0, value1) -> tail {
                tail := add(headStart, 64)

                abi_encode_t_struct$_Data_$6_storage_to_t_uint256_fromStack_library(value0,  add(headStart, 0))

                abi_encode_t_uint256_to_t_uint256_fromStack_library(value1,  add(headStart, 32))

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function cleanup_t_bool(value) -> cleaned {
                cleaned := iszero(iszero(value))
            }

            function cleanup_t_uint256(value) -> cleaned {
                cleaned := value
            }

            function convert_t_type$_t_contract$_Set_$80_$_to_t_address(value) -> converted {
                converted := value
            }

            function finalize_allocation(memPtr, size) {
                let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
                // protect against overflow
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }

            function fun_register_97(var_value_85) {

                let expr_89_address := linkersymbol("examples/Libraries.sol:Set")
                let expr_90_address := convert_t_type$_t_contract$_Set_$80_$_to_t_address(expr_89_address)
                let expr_90_functionSelector := 0x3ab90ad8
                let _1_slot := 0x00
                let expr_91_slot := _1_slot
                let _2 := var_value_85
                let expr_92 := _2

                if iszero(extcodesize(expr_90_address)) { revert(0, 0) }

                // storage for arguments and returned data
                let _3 := allocate_unbounded()
                mstore(_3, shift_left_224(expr_90_functionSelector))
                let _4 := abi_encode_tuple_t_struct$_Data_$6_storage_t_uint256__to_t_uint256_t_uint256__fromStack_library(add(_3, 4) , expr_91_slot, expr_92)

                let _5 := delegatecall(gas(), expr_90_address,  _3, sub(_4, _3), _3, 32)

                if iszero(_5) { revert_forward_1() }

                let expr_93
                if _5 {

                    // update freeMemoryPointer according to dynamic return size
                    finalize_allocation(_3, returndatasize())

                    // decode return parameters from external try-call into retVars
                    expr_93 :=  abi_decode_tuple_t_bool_fromMemory(_3, add(_3, returndatasize()))
                }
                require_helper(expr_93)

            }

            function panic_error_0x41() {
                mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
                mstore(4, 0x41)
                revert(0, 0x24)
            }

            function require_helper(condition) {
                if iszero(condition) { revert(0, 0) }
            }

            function revert_forward_1() {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }

            function round_up_to_mul_of_32(value) -> result {
                result := and(add(value, 31), not(31))
            }

            function shift_left_224(value) -> newValue {
                newValue :=

                shl(224, value)

            }

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function validator_revert_t_bool(value) {
                if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
            }

            function validator_revert_t_uint256(value) {
                if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
            }

        }

    }

}

