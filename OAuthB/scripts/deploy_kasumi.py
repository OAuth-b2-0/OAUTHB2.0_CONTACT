from brownie import KASUMI,accounts
from brownie.network import gas_price
from brownie.network.gas.strategies import LinearScalingStrategy

gas_strategy = LinearScalingStrategy("60 gwei", "70 gwei", 1.1)

gas_price(gas_strategy)
sbox = [199 ,170, 187, 238, 255, 170, 187, 238, 255, 170, 187, 238, 255, 170, 187, 238, 255]
key = 0xAABBEEFFAABBEEFFAABBEEFFAABBEEFF
def deploy():
    contract = KASUMI.deploy(key,{
        'from':accounts[0],
        "gas_price": gas_strategy
    })
    return contract
def main():
    contract = deploy()
    out = contract.encription(sbox)
    enc = out.return_value
    print(enc)
    print((contract.decrypt(enc)).return_value)
