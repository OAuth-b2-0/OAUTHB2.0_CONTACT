# OAuthB 2.0
- ## Setup
  ```shell
  # setup virtual env
  python -m venv env
  
  # activate env
  ## Linux
  . ./env/bin/activate
  ## Windows
  \enc\Scripts\activate
  
  # install requiremnts
  pip install -r req.txt
  
  #setup path
  pipx ensurepath

  #install browine
  pipx install eth-brownie
  ```

- ## Start ganache server
    ```shell
    cd ganache
    npm run ganache
    ```
    note: 
    - default port is 8545
    - you can change configration via changing the code in package.json
- ## compile *.SOL
    - ``` shell
        cd OAuthB
        brownie compile
      ``` 
- ## Deploy contact in CHAIN
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