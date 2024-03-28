<h1 align="center">
	<img width="300" src="https://github.com/OAuth-b2-0/OAUTHB2.0_CONTACT/assets/98285552/dbf5b7fc-3cf6-4182-ad2c-e5472c3ebc19" alt="OAuth b2.0">
	<br>
</h1>

## Theme: Zero Trust Security
OAuth b2.0 revolutionizes the landscape of online authorization, addressing the vulnerabilities of centralized systems and enhancing user control over their data. OAuth b2.0 introduces a groundbreaking approach to authorization, putting users in control and creating a safer, more privacy-focused online space.

| User | Communication Channel | Opcode | Type       | Description                                 | Packet function                       | Group                      | Progress |
|------|-----------------------|---------|------------|--------------------------------------------------|----------------------------------------|------------------------------|----------|
| 1    |                       | 0x01    | request   | login to the contract                       |                                       | User login                   |          |
| 2    |                       | 0x02    | response  | login successful and send token           | user_login_send_access_token(uint16 token) | User login                   |          |
| 3    |                       | 0x03    | response  | login unsuccessful                         | user_login_fail                       | User login                   |          |
| 4    |                       | 0x04    | request   | logout to the contract and send login token |                                       | User login                   |          |
| 5    |                       | 0x05    | response  | logout successful                            | user_logout_successful()               | User login                   |          |
| 6    |                       | 0x06    | response  | logout fail                                  | user_logout_fail)                       | User login                   |          |
| 7    |                       | 0x00    | request   | get data add token                           | uner data add_token(uint16 token)       | Data Store Management        | X        |
| @user |                       |         | response  | send data add token                          |                                       | Data Store Management        | X        |
| 8    |                       | 009     | response  | fail to send data add token                 | user_data_add_token_fail()               | Data Store Management       |          |
| 9    |                       |         | request   | get data update token                        |                                       | Data Store Management        | X        |
| 10   |                       |         | response  | send data update token                       | user_data_update_token(pant16 token)    | Data Store Management        | X        |
| 11   |                       |         | response  | fail to send data update token               | user_data_update_token_fail()            | Data Store Management       |          |
| 12   |                       | OxDE    | response  | data manipulation operation (ADD) done       | user_data_manipulation_add_done()       | Data Store Management        |          |
| 13   |                       |         | response  | data manipulation operation (UPDATE) done   | user_data_manipulation_update_done()    | Data Store Management        |          |
| 14   |                       | COF     | response  | data manipulation operation fails            | user_data_manipulation_fail)            | Data Store Management       |          |


## ⚙️ Setup
  ```shell
  # ganache setup
  cd ganache
  npm install

  #setup virtual env
  python -m venv env
  
  #activate env
  #Linux
  . ./env/bin/activate
  #Windows
  .\env\Scripts\activate
  
  #install requiremnts
  pip install -r req.txt

  #install browine
  pip install eth-brownie
  ```

## Start ganache server
    ```shell
    cd ganache
    npm run ganache
    ```
    Note: 
    - Default port is 8545
    - You can change configration via changing the code in package.json
## Compile *.SOL
    - ``` shell
        cd OAuthB
        brownie compile
      ``` 
## Deploy contact in CHAIN
  - ```shell
    cd OAuthB
    brownie run scripts/*.py
    ```

### NOTE!!
- ```
    All Rights Reserved

    Copyright (c) 2024 R Ansh Joseph

    THE CONTENTS OF THIS PROJECT ARE PROPRIETARY AND CONFIDENTIAL.
    UNAUTHORIZED COPYING, TRANSFERRING OR REPRODUCTION OF THE CONTENTS OF THIS PROJECT, VIA ANY MEDIUM IS STRICTLY PROHIBITED.

    The receipt or possession of the source code and/or any parts thereof does not convey or imply any right to use them
    for any purpose other than the purpose for which they were provided to you.

    The software is provided "AS IS", without warranty of any kind, express or implied, including but not limited to
    the warranties of merchantability, fitness for a particular purpose and non infringement.
    In no event shall the authors or copyright holders be liable for any claim, damages or other liability,
    whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software
    or the use or other dealings in the software.

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the software.


    ```
### Some importants points
-   gas fee is nessary ifnot given itnot gonna process the block 
