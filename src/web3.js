import Web3 from 'web3';

const web3 = new Web3(window.ethereum)

window.ethereum.enable().catch(error => {
    // User denied account access
    console.log(error)
})

web3.eth.getAccounts((err, res) => {                   
    console.log(res[0]);
});

export default web3;