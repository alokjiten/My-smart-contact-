        "name": "AccountCreated",
        "type": "event"
      },
      {
        "inputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "name": "accounts",
        "outputs": [
          {
            "internalType": "string",
            "name": "name",
            "type": "string"
          },
          {
            "internalType": "uint256",
            "name": "accountNumber",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "balance",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "pin",
            "type": "uint256"
          },
          {
            "internalType": "bool",
            "name": "exists",
            "type": "bool"
          }
        ],
        "stateMutability": "view",
        "type": "function",
        "constant": true
      },
      {
        "inputs": [
          {
            "internalType": "string",
            "name": "_name",
            "type": "string"
          },
          {
            "internalType": "uint256",
            "name": "_accountNumber",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "_initialDeposit",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "_pin",
            "type": "uint256"
          }
        ],
        "name": "createAccount",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "uint256",
            "name": "_accountNumber",
            "type": "uint256"
          },
          {
            "internalType": "uint256",
            "name": "_pin",
            "type": "uint256"
          }
        ],
        "name": "checkBalance",
        "outputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "stateMutability": "view",
        "type": "function",
        "constant": true
      }
    ];
 
    const contractAddress = "0x379c4409f2a66f081c59CE99a24dE2c90c4e3D13"; // Updated contract address
    const senderAddress = "0x9a903e3bbfB93d221043324Ee249E0281B32AFb5"; // Sender address
 
    const contract = new web3.eth.Contract(contractABI, contractAddress);
    const outputDiv = document.getElementById("output");
 
    document.getElementById("createAccountForm").addEventListener("submit", async (e) => {
      e.preventDefault();
      const name = document.getElementById("accountName").value;
      const accountNumber = document.getElementById("accountNumber").value;
      const initialDeposit = document.getElementById("initialDeposit").value;
      const pin = document.getElementById("accountPin").value;
 
      try {
        const gasEstimate = await contract.methods.createAccount(name, accountNumber, initialDeposit, pin).estimateGas({ from: senderAddress });
        await contract.methods.createAccount(name, accountNumber, initialDeposit, pin).send({
          from: senderAddress,
          gas: gasEstimate + 100000 // Add extra gas buffer
        });
        outputDiv.innerText = Account created for ${name}!;
      } catch (error) {
        outputDiv.innerText = Error: ${error.message};
      }
    });
 
    document.getElementById("checkBalanceForm").addEventListener("submit", async (e) => {
      e.preventDefault();
      const accountNumber = document.getElementById("balanceAccountNumber").value;
      const pin = document.getElementById("balanceAccountPin").value;
 
      try {
        const balance = await contract.methods.checkBalance(accountNumber, pin).call();
        outputDiv.innerText = Account Balance: ${balance} ETH;
      } catch (error) {
        outputDiv.innerText = Error: ${error.message};
      }
    });
  </script>
</body>
</html>
