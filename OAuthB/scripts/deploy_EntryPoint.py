from brownie import EntryPoint,accounts
from brownie.network import gas_price
from brownie.network.gas.strategies import LinearScalingStrategy

gas_strategy = LinearScalingStrategy("60 gwei", "70 gwei", 1.1)

gas_price(gas_strategy)


def main():
    sbox = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    key = 0xAABBEEFFAABBEEFFAABBEEFFAABBEEFF
    secret = 0xAAFFBB99
    contract = EntryPoint.deploy(secret , key, sbox,{
        'from':accounts[0],
        "gas_price": gas_strategy
    })

    print(contract.communication_chanel_client(sbox))
