<h1 align="center">
	<img width="300" src="https://github.com/OAuth-b2-0/OAUTHB2.0_CONTACT/assets/98285552/dbf5b7fc-3cf6-4182-ad2c-e5472c3ebc19" alt="OAuth b2.0">
	<br>
</h1>

# Documentation for OAuth b2.0 🔒💻🚀

## Table of contents 📚
- [Introduction](#introduction)
- [Request and Response Structure](#request-and-response-structure)
- [Key Features](#key-features)
- [Architecture Diagram](#architecture-diagram)
- [Get Started](#get-started)
- [Setup](#setup)
- [About Us](#about-us)
- [What We Offer](#what-we-offer)
- [Note](#note)
- [Thank You for Visiting!](#thank-you-for-visiting)

## ➡️ Introduction 
Our goal is to create a secure, decentralized authentication system using the original consortium blockchain. We aim to provide users with greater control over their data and privacy, ensuring that their information is protected and accessible only to authorized parties. By leveraging blockchain technology, we can create a tamper-proof, transparent system that enhances security and trust in online interactions.

## Request and Response Structure 
The request and response structure of the OAuth b2.0 protocol is shown below:

| Index | Communication Channel | Opcode | Type     | Description                           | Packet function                    | Group            | Progress | Sample                                       |
|-------|-----------------------|--------|----------|---------------------------------------|-----------------------------------|------------------|----------|----------------------------------------------|
| 1     | user                  | 0x01   | request  | login to the contract                 |                                   | User login       | ✅        | [0x01,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]      |
| 2     | user                  | 0x02   | response | login successful and send token      | user_login_send_access_token()    |                                   |          |                                              |
| 3     | user                  | 0x03   | response | login unsuccessful                   | user_login_fail()                 |                                   |          |                                              |
| 4     | user                  | 0x04   | request  | logout to the contract and send login token |                                   |                                   |          | [0x04,0,0,0,0,0,0,0,0,0,0,0,0,0,0,165,84] |
| 5     | user                  | 0x05   | response | logout successful                    | user_logout_successful()         |                                   |          |                                              |
| 6     | user                  | 0x06   | response | logout fail                          | user_logout_fail()               |                                   |          |                                              |
|       |                       |        |          |                                       |                                   |                                   |          |                                              |
| 7     | user                  | 0x07   | request  | get data add token                   |                                   | Data Store Management             | ✅        | [0x07,0,0,0,0,0,0,0,0,0,0,0,0,0,0,165,84]    |
| 8     | user                  | 0x08   | response | send data add token                  | user_data_add_token()             |                                   |          |                                              |
| 9     | user                  | 0x09   | response | fail to send data add token          | user_data_add_token_fail()        |                                   |          |                                              |
| 10    | user                  | 0x0A   | request  | get data update token                |                                   |                                   |          | [0x0A,0,0,0,0,0,0,0,0,0,0,0,0,idx,idx,165,84] |
| 11    | user                  | 0x0B   | response | send data update token               | user_data_update_token()          |                                   |          |                                              |
| 12    | user                  | 0x0C   | response | fail to send data update token       | user_data_update_token_fail()     |                                   |          |                                              |
| 13    | user                  | 0x0D   | response | data manipulation operation (ADD) done | user_data_manipulation_add_done() |                                   |          |                                              |
| 14    | user                  | 0x0E   | response | data manipulation operation (UPDATE) done | user_data_manipulation_update_done() |                               |          |                                              |
| 15    | user                  | 0x0F   | response | data manipulation operation fails    | user_data_manipulation_fail()    |                                   |          |                                              |
| 16    | user                  | 0x10   | request  | get data view token                  |                                   |                                   |          | [0x10,0,0,0,0,0,0,0,0,0,0,0,0,idx,idx,165,84] |
| 17    | user                  | 0x11   | response | send data view token                 | user_data_view_token()            |                                   |          |                                              |
| 18    | user                  | 0x12   | response | send data view token error           | user_data_view_token_error()      |                                   |          |                                              |
| 19    | user                  | 0x13   | request  | get key value in data store token    |                                   |                                   |          | [0x13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,165,84]    |
| 20    | user                  | 0x14   | response | send key value in data store token   | user_data_key_value_token()       |                                   |          |                                              |
| 21    | user                  | 0x15   | response | get key value in data store token error | user_data_key_value_token_error() |                                   |          |                                              |
|       |                       |        |          |                                       |                                   |                                   |          |                                              |
| 22    | user                  | 0x16   | request  | get client id token(15 bits)         |                                   | Issues Resolver                   |          |                                              |
| 23    | user                  | 0x17   | response | send client id token                 |                                   |                                   |          |                                              |
| 24    | user                  | 0x18   | response | send client id token error           |                                   |                                   |          |                                              |
| 25    | client                | 0x19   | request  | permit client(15 bits)               |                                   |                                   |          |                                              |
| 26    | client                | 0x1A   | response | get client permit packets            |                                   |                                   |          |                                              |
| 27    | client                | 0x1B   | response | get client permit packets error      |                                   |                                   |          |                                              |
| 28    | user                  | 0x1C   | request  | send permit verified                 |                                   |                                   |          |                                              |
| 29    | user                  | 0x1D   | response | send permit verified successful      |                                   |                                   |          |                                              |
| 30    | user                  | 0x1E   | response | send permit verified failed          |                                   |                                   |          |                                              |
|       |                       |        |          |                                       |                                   |                                   |          |                                              |
| 31    | client                | 0x1F   | request  | verify token                         |                                   | Token Verifier                    |          |                                              |
| 32    | client                | 0x20   | response | token verify successful              |                                   |                                   |          |                                              |
| 33    | client                | 0x21   | response | token verify fail                    |                                   |                                   |          |                                              |
| 34    | client                | 0x22   | response | token verify successful but get refresh token |                                   |                                   |          |                                              |
| 35    | client                | 0x23   | request  | get refresh token                    |                                   |                                   |          |                                              |
| 36    | client                | 0x24   | response | send refresh token                   |                                   |                                   |          |                                              |
| 37    | client                | 0x25   | response | error send refresh token             |                                   |                                   |          |                                              |
|       |                       |        |          |                                       |                                   |                                   |          |                                              |
| 38    | client                | 0x(3~B)6 | request | request data 3~B                     |                                   | Client Data Store Module          |          |                                              |
| 39    | client                | 0x27   | response | send data token take token give it to data data_access_point |                                   |                                   |          |                                              |
| 40    | client                | 0x28   | response | send data token error                |                                   |                                   |          |                                              |

## 🗒️ Key Features 
- 🔒 **Secure Authentication:** Protect user credentials and data with advanced security measures.
- 🔑 **Decentralized Access Control:** Empower users with greater control over their data privacy.
- 📊 **Immutable Verification:** Ensure tamper-proof verification of user records with blockchain technology.
- 🕰️ **Transparent Authentication Processes:** Enable secure and reliable credential verification for users.
- 🔍 **Future-Proof Solutions:** Stay ahead of the curve with forward-thinking approaches to identity management.

## ✏️ Architecture Diagram
- **Blockchain Layer:** Securely stores user credentials and authentication data.
- **OAuth 2.0 Integration:**  Facilitates secure authorization and access control.
- **Smart Contracts:**  Manages authentication processes and access control mechanisms.
- **Client Applications:**  Initiates authentication requests and accesses user resources securely.
- **Authentication Service:**  Handles user login, token issuance, and verification securely.
- **Data Store Management:**  Manages storage and retrieval of user data while ensuring privacy and integrity.

![Architecture Diagram](https://github.com/OAuth-b2-0/OAUTHB2.0_CONTACT/images/OAuthB2.0WorkingCanva.png)

## ➡️ Get Started
Explore our repository to discover innovative solutions for your authentication and access control needs. Feel free to contribute, provide feedback, or reach out to us with any questions. Together, let's shape the future of cybersecurity!

## 🔨 Setup
  ```shell
  # ganache setup
  cd ganache
  npm install

  #setup virtual env
  cd ..
  python -m venv env
  
  #install browine
  pip install eth-brownie
  ```
### Start ganache server (In new terminal)
  ```shell
  cd ganache
  npm run ganache
  ```
    Note: 
    - Default port is 8545
    - You can change configration via changing the code in package.json

### Compiling .SOL files
  ``` shell
  cd OAuthB
  brownie compile
  ``` 
### Deploy contact in CHAIN
  ```shell
  brownie run -i scripts/deploy_Entrypoint.py 
  ```

## 📸 Screenshots of deployed contract
  ![image](https://github.com/OAuth-b2-0/OAUTHB2.0_CONTACT/raw/main/Readme%20image%202.png)  

## 👥 About Us
We are a team dedicated to revolutionizing authentication and access control with cutting-edge technologies. Our mission is to provide secure, decentralized solutions that empower users and protect their privacy.

## 👉 What We Offer
Our repository houses innovative solutions for authentication and access management, built on robust frameworks like OAuth b2.0 and blockchain technology. With our tools, you can enhance security, streamline access control, and foster trust in your digital interactions.

### 📝 NOTE!!
  ```
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
### 📌 Important Point
   ```
   Gas Fee is necessary if not given it not gonna process the block
   ```

## 🤝 Thank You for Visiting!
We appreciate your interest in our repository. 
<hr>
<p align="center">
Happy coding and stay secure! 🛡️🔒
</p>