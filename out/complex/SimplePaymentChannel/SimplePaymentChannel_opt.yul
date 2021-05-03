/*******************************************************
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *******************************************************/

object "SimplePaymentChannel_207" {
    code {
        {
            mstore(64, 128)
            let programSize := datasize("SimplePaymentChannel_207")
            let argSize := sub(codesize(), programSize)
            let newFreePtr := add(128, and(add(argSize, 31), not(31)))
            if or(gt(newFreePtr, sub(shl(64, 1), 1)), lt(newFreePtr, 128))
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            mstore(64, newFreePtr)
            codecopy(128, programSize, argSize)
            if slt(argSize, 64) { revert(0, 0) }
            let value := mload(128)
            if iszero(eq(value, and(value, sub(shl(160, 1), 1)))) { revert(0, 0) }
            constructor_SimplePaymentChannel(value, mload(160))
            let _1 := datasize("SimplePaymentChannel_207_deployed")
            codecopy(0, dataoffset("SimplePaymentChannel_207_deployed"), _1)
            return(0, _1)
        }
        function constructor_SimplePaymentChannel(var_recipient, var_duration)
        {
            let _1 := not(sub(shl(160, 1), 1))
            sstore(0x00, or(and(sload(0x00), _1), caller()))
            sstore(0x01, or(and(sload(0x01), _1), and(var_recipient, sub(shl(160, 1), 1))))
            if gt(timestamp(), not(var_duration))
            {
                mstore(0x00, shl(224, 0x4e487b71))
                mstore(4, 0x11)
                revert(0x00, 0x24)
            }
            sstore(0x02, add(timestamp(), var_duration))
        }
    }
    object "SimplePaymentChannel_207_deployed" {
        code {
            {
                let _1 := 64
                mstore(_1, 128)
                if iszero(lt(calldatasize(), 4))
                {
                    let _2 := 0
                    switch shr(224, calldataload(_2))
                    case 0x0e1da6c3 {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        fun_claimTimeout()
                        return(128, _2)
                    }
                    case 0x415ffba7 {
                        if callvalue() { revert(_2, _2) }
                        let param, param_1 := abi_decode_uint256t_bytes(calldatasize())
                        fun_close(param, param_1)
                        return(mload(_1), _2)
                    }
                    case 0x4665096d {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let _3 := sload(2)
                        let memPos := mload(_1)
                        return(memPos, sub(abi_encode_uint256(memPos, _3), memPos))
                    }
                    case 0x66d003ac {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret := and(sload(1), sub(shl(160, 1), 1))
                        let memPos_1 := mload(_1)
                        return(memPos_1, sub(abi_encode_address_payable(memPos_1, ret), memPos_1))
                    }
                    case 0x67e404ce {
                        if callvalue() { revert(_2, _2) }
                        abi_decode(calldatasize())
                        let ret_1 := and(sload(_2), sub(shl(160, 1), 1))
                        let memPos_2 := mload(_1)
                        return(memPos_2, sub(abi_encode_address_payable(memPos_2, ret_1), memPos_2))
                    }
                    case 0x9714378c {
                        if callvalue() { revert(_2, _2) }
                        fun_extend(abi_decode_uint256(calldatasize()))
                        return(mload(_1), _2)
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
                if slt(add(dataEnd, not(3)), 32) { revert(value0, value0) }
                value0 := calldataload(4)
            }
            function abi_decode_uint256t_bytes(dataEnd) -> value0, value1
            {
                if slt(add(dataEnd, not(3)), 64) { revert(value0, value0) }
                value0 := calldataload(4)
                let offset := calldataload(36)
                let _1 := 0xffffffffffffffff
                if gt(offset, _1) { revert(value1, value1) }
                if iszero(slt(add(offset, 35), dataEnd)) { revert(value1, value1) }
                let _2 := calldataload(add(4, offset))
                if gt(_2, _1) { panic_error_0x41() }
                let memPtr := mload(64)
                finalize_allocation(memPtr, add(and(add(_2, 0x1f), not(31)), 32))
                mstore(memPtr, _2)
                if gt(add(add(offset, _2), 36), dataEnd) { revert(value1, value1) }
                calldatacopy(add(memPtr, 32), add(offset, 36), _2)
                mstore(add(add(memPtr, _2), 32), value1)
                value1 := memPtr
            }
            function abi_encode_address_payable(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, and(value0, sub(shl(160, 1), 1)))
            }
            function abi_encode_uint256(headStart, value0) -> tail
            {
                tail := add(headStart, 32)
                mstore(headStart, value0)
            }
            function cleanup_from_storage_address_payable(value) -> cleaned
            {
                cleaned := and(value, sub(shl(160, 1), 1))
            }
            function finalize_allocation_1925(memPtr)
            {
                let newFreePtr := add(memPtr, 96)
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }
            function finalize_allocation(memPtr, size)
            {
                let newFreePtr := add(memPtr, and(add(size, 31), not(31)))
                if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
                mstore(64, newFreePtr)
            }
            function fun_claimTimeout()
            {
                if lt(timestamp(), sload(0x02)) { revert(0, 0) }
                selfdestruct(and(sload(0), sub(shl(160, 1), 1)))
            }
            function fun_close(var_amount, var_signature_mpos)
            {
                let _1 := sub(shl(160, 1), 1)
                let _2 := and(sload(0x01), _1)
                if iszero(eq(caller(), _2)) { revert(0, 0) }
                let expr_mpos := mload(64)
                let _3 := add(expr_mpos, 0x20)
                mstore(_3, shl(96, address()))
                mstore(add(expr_mpos, 52), var_amount)
                mstore(expr_mpos, 52)
                finalize_allocation_1925(expr_mpos)
                let _4 := keccak256(_3, mload(expr_mpos))
                let expr_mpos_1 := mload(64)
                let _5 := add(expr_mpos_1, 0x20)
                mstore(_5, 0x19457468657265756d205369676e6564204d6573736167653a0a333200000000)
                mstore(add(expr_mpos_1, 60), _4)
                mstore(expr_mpos_1, 60)
                finalize_allocation_1925(expr_mpos_1)
                let expr := fun_recoverSigner(keccak256(_5, mload(expr_mpos_1)), var_signature_mpos)
                let _6 := 0
                require_helper(eq(and(expr, _1), cleanup_from_storage_address_payable(cleanup_from_storage_address_payable(sload(_6)))))
                let _7 := _6
                if iszero(var_amount) { _7 := 2300 }
                if iszero(call(_7, _2, var_amount, _6, _6, _6, _6)) { revert_forward() }
                selfdestruct(cleanup_from_storage_address_payable(sload(_6)))
            }
            function fun_extend(var_newExpiration)
            {
                if iszero(eq(caller(), and(sload(0x00), sub(shl(160, 1), 1)))) { revert(0x00, 0x00) }
                if iszero(gt(var_newExpiration, sload(0x02))) { revert(0x00, 0x00) }
                sstore(0x02, var_newExpiration)
            }
            function fun_recoverSigner(var_message, var_sig_mpos) -> var
            {
                if iszero(eq(mload(var_sig_mpos), 0x41)) { revert(var, var) }
                let var_r := mload(add(var_sig_mpos, 32))
                let var_s := mload(add(var_sig_mpos, 64))
                let _1 := mload(add(var_sig_mpos, 96))
                let _2 := mload(64)
                mstore(_2, var_message)
                mstore(add(_2, 32), byte(var, _1))
                mstore(add(_2, 64), var_r)
                mstore(add(_2, 96), var_s)
                mstore(var, var)
                if iszero(staticcall(gas(), 1, _2, 128, var, 32))
                {
                    returndatacopy(var, var, returndatasize())
                    revert(var, returndatasize())
                }
                var := mload(var)
            }
            function panic_error_0x41()
            {
                mstore(0, shl(224, 0x4e487b71))
                mstore(4, 0x41)
                revert(0, 0x24)
            }
            function require_helper(condition)
            {
                if iszero(condition) { revert(0, 0) }
            }
            function revert_forward()
            {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }
        }
    }
}
