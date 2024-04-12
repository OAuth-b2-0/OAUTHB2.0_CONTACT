from brownie import EntryPoint,accounts
from brownie.network import gas_price
from brownie.network.gas.strategies import LinearScalingStrategy

gas_strategy = LinearScalingStrategy("60 gwei", "70 gwei", 1.1)

gas_price(gas_strategy)

def mearge_bytes_16(hight:int,low:int)->int:
    hight = hight << 8
    hight = hight | low
    return hight

def main():
    sbox = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    key = 0xAABBEEFFAABBEEFFAABBEEFFAABBEEFF
    secret = 0xAAFFBB99

    user = accounts[0]
    client = accounts[1]

    contract = EntryPoint.deploy(secret , key, sbox,{
        'from':user,
        "gas_price": gas_strategy
    })
    print(f"contract address: {contract.address}")
    # User Section
    ## Login
    print("User Login")
    login_payload = [0x01,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    login_token = contract.user_communication(login_payload)
    login_token = list(login_token.return_value)
    print(login_token)
    print("------------------------------------------------------------")

    # Add Data
    print("User adding data to store")
    add_token = login_token[::]
    add_token[0] = 0x07
    add_token = contract.user_communication(add_token)
    add_token = list(add_token.return_value)
    print("Add permit Token")
    print(add_token)
    add_token = mearge_bytes_16(add_token[15],add_token[16])
    contract.data_access_point(add_token,'ansh','name',True)
    print("------------------------------------------------------------")

    # Check Value
    print("User view added data")
    view_token = login_token[::]
    view_token[0] = 0x10
    view_token = contract.user_communication(view_token)
    view_token = list(view_token.return_value)
    print("Permit View Token")
    print(view_token)
    view_token = mearge_bytes_16(view_token[15],view_token[16])
    print(contract.data_access_point(view_token,'','',True).return_value)
    print("------------------------------------------------------------")

    ## Get Client ID
    print("User alloting client ID")
    client_id_token = login_token[::]
    client_id_token[0] = 0x16
    client_id_token = contract.user_communication(client_id_token)
    client_id_token = list(client_id_token.return_value)
    print("Client ID")
    print(client_id_token)
    client_id_token = mearge_bytes_16(client_id_token[15],client_id_token[16])
    print(client_id_token)
    print("------------------------------------------------------------")

    # Client Section
    print("Client Recive ID and Genrate Permission Payload")
    client_premission = [0x29, client_id_token >> 8, client_id_token & (2**8 - 1), 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    print(client_premission)
    client_premission = contract.client_communication(client_premission,{"from":client,"gas_price": gas_strategy})
    print(client_premission.events)
    client_premission = list(client_premission.return_value)
    print(client_premission)
    print("------------------------------------------------------------")

    # user section fetch notifiction
    print("User check notification for Permission request")
    notification = login_token[::]
    notification = contract.notification(notification,{"from":user,"gas_price": gas_strategy})
    notification = list(notification.return_value)[0]
    print(notification)
    print("------------------------------------------------------------")


    # user section fetch notifiction verify token
    print("User verify permission by client user")
    notification_verify = login_token[::]
    notification_verify[0] = 0x1C
    notification_verify[1] = notification[0]
    notification_verify[2] = notification[1]
    for i in range(8):
        notification_verify[i+3] = notification[i+2]
    print(notification_verify)
    notification_verify = contract.user_communication(notification_verify,{"from":user,"gas_price": gas_strategy})
    
    print(notification_verify.events)
    notification_verify = list(notification_verify.return_value)
    print(notification_verify)
    print("------------------------------------------------------------")
    
    # check permit list
    print("permit list")
    x = contract.retrive_all()
    print(x.return_value)
    print("------------------------------------------------------------")

    # client get valid token
    print("client get user verifiyed token")
    client_get_token = [0x2C, client_id_token >> 8, client_id_token & (2**8 - 1), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    print(client_get_token)
    client_get_token = contract.client_communication(client_get_token,{"from":client,"gas_price": gas_strategy})
    client_get_token = list(client_get_token.return_value)
    print(client_get_token)
    print("------------------------------------------------------------")

    
    
    # client verifiy token
    print("verify token client")
    client_verify_token = client_get_token[::]
    client_verify_token[0] = 0x1F
    client_verify_token = contract.client_communication(client_verify_token,{"from":client,"gas_price": gas_strategy})
    print(client_verify_token.events)
    print(client_verify_token.return_value)
    print("------------------------------------------------------------")

    
    # client get refesh token
    print("client getting refesh token")
    client_get_token_rf = [0x23] + client_get_token[1:]
    print(client_get_token_rf)
    client_get_token_rf = contract.client_communication(client_get_token_rf,{"from":client,"gas_price": gas_strategy})
    print(client_get_token_rf.events)
    client_get_token_rf = list(client_get_token_rf.return_value)
    print(client_get_token_rf) 
    
    # client fetch data
    print("client featch data")
    client_data = [0x36] + client_get_token_rf[1:]
    print(client_data)
    client_data = contract.client_communication(client_data,{"from":client,"gas_price": gas_strategy})
    print(client_data.events)
    client_data = list(client_data.return_value)
    print(client_data)
    client_data = mearge_bytes_16(client_data[15],client_data[16])
    print(client_data)
    print(contract.data_access_point(client_data,'','',True).return_value)
    print("------------------------------------------------------------")

    ## logout
    logout_token = login_token[::]
    logout_token[0] = 0x04
    logout_token = contract.user_communication(logout_token)
    print("Logout")
    print(logout_token.return_value)
    print("------------------------------------------------------------")
