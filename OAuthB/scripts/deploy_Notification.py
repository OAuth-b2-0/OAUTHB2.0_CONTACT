from brownie import NotificationSystem,accounts
from brownie.network import gas_price
from brownie.network.gas.strategies import LinearScalingStrategy

gas_strategy = LinearScalingStrategy("60 gwei", "70 gwei", 1.1)

gas_price(gas_strategy)


def main():
    
    contract = NotificationSystem.deploy({
        'from':accounts[0],
        "gas_price": gas_strategy
    })