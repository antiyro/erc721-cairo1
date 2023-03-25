//TODO remove this file once these functionalities are implemented in the corelib

use starknet::Felt252TryIntoContractAddress;
use starknet::ContractAddressIntoFelt252;
use starknet::contract_address_to_felt252;
use starknet::StorageAccess;
use starknet::StorageBaseAddress;
use starknet::SyscallResult;
use traits::Into;
use traits::TryInto;
use option::OptionTrait;

impl StorageAccessContractAddress of StorageAccess::<ContractAddress> {
    fn read(address_domain: felt252, base: StorageBaseAddress) -> SyscallResult::<ContractAddress> {
        Result::Ok(StorageAccess::<felt252>::read(address_domain, base)?.try_into().expect('blah'))
    }
    fn write(
        address_domain: felt252, base: StorageBaseAddress, value: ContractAddress
    ) -> SyscallResult::<()> {
        StorageAccess::<felt252>::write(address_domain, base, value.into())
    }
}


