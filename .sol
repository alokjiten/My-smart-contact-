<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bank Smart Contract</title>
  <script src="https://cdn.jsdelivr.net/npm/web3@1.8.0/dist/web3.min.js"></script>
  <style>
    /* Base Styles */
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background: #f3f4f6; /* Light grey background */
      color: #333; /* Dark grey text */
    }
 
    /* Header Styles */
    header {
      background: #4a4a4a; /* Dark grey */
      color: white;
      padding: 20px;
      text-align: center;
    }
 
    header h1 {
      margin: 0;
      font-size: 28px;
    }
 
    /* Form Styles */
    .container {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      background: #fff; /* White background */
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow */
    }
 
    h2 {
      font-size: 22px;
      color: #555; /* Medium grey */
      margin-bottom: 10px;
    }
 
    form {
      display: flex;
      flex-direction: column;
      gap: 10px;
    }
 
    input, button {
      font-size: 16px;
      padding: 10px;
      border-radius: 5px;
      border: 1px solid #ddd;
      transition: all 0.3s ease;
    }
 
    input:focus {
      outline: none;
      border-color: #4a90e2; /* Accent blue */
      box-shadow: 0 0 5px rgba(74, 144, 226, 0.5);
    }
 
    button {
      background: #4a90e2; /* Accent blue */
      color: white;
      border: none;
      cursor: pointer;
    }
 
    button:hover {
      background: #357ABD; /* Darker accent blue */
    }
 
    /* Output Styles */
    .output {
      margin-top: 20px;
      padding: 15px;
      background: #f9f9f9; /* Light grey */
      border-left: 5px solid #4a90e2; /* Accent blue */
      border-radius: 5px;
      color: #333;
    }
 
    /* Footer */
    footer {
      text-align: center;
      padding: 20px;
      background: #4a4a4a; /* Dark grey */
      color: white;
      margin-top: 20px;
    }
 
    footer p {
      margin: 0;
      font-size: 14px;
    }
 
    footer a {
      color: #4a90e2; /* Accent blue */
      text-decoration: none;
    }
 
    footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <header>
    <h1>Bank Smart Contract Interaction</h1>
  </header>
 
  <div class="container">
    <h2>Create Account</h2>
    <form id="createAccountForm">
      <input type="text" id="accountName" placeholder="Name" required>
      <input type="number" id="accountNumber" placeholder="Account Number" required>
      <input type="number" id="initialDeposit" placeholder="Initial Deposit" required>
      <input type="number" id="accountPin" placeholder="PIN" required>
      <button type="submit">Create Account</button>
    </form>
  </div>
 
  <div class="container">
    <h2>Check Balance</h2>
    <form id="checkBalanceForm">
      <input type="number" id="balanceAccountNumber" placeholder="Account Number" required>
      <input type="number" id="balanceAccountPin" placeholder="PIN" required>
      <button type="submit">Check Balance</button>
    </form>
  </div>
 
  <div class="container">
    <h2>Output</h2>
    <div class="output" id="output">Output will be displayed here.</div>
  </div>
 
  <footer>
    <p>&copy; 2025 Bank Contract UI | Designed with <span style="color: #4a90e2;">♥</span> for Blockchain Projects</p>
  </footer>
 
  <script>
    const web3 = new Web3("http://127.0.0.1:7545"); // Ganache RPC URL
 
    // Contract ABI and Address
    const contractABI = [
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": true,
            "internalType": "uint256",
            "name": "accountNumber",
            "type": "uint256"
          },
          {
            "indexed": false,
            "internalType": "string",
            "name": "name",
            "type": "string"
          }
        ],
