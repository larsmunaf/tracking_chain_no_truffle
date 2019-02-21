const net = require('net');
const Web3 = require('web3');
var path = require('path'),
    TrackingContractJSON = require(path.join(__dirname, '../tracking_chain/build/contracts/PositionTracking.json'));

module.exports = function (callback) {
    var provider = new Web3.providers.WebsocketProvider('ws://localhost:8546');//IpcProvider('/home/telekom/Library/Ethereum/geth.ipc', net);
    var web3 = new Web3(provider);
    var account;
    var contract;

    accounts = web3.eth.getAccounts()
        .then(function (accounts) {
            account = accounts[0]; // deprecated; addresses must be used
        }).then(function () {
            contract = new web3.eth.Contract(TrackingContractJSON.abi, TrackingContractJSON.networks['15'].address);
            setInterval (sendPositionIntoBlockchain, 2000);
        });

        function sendPositionIntoBlockchain ()
        {
            var x = Math.round (Math.random() * (1000 - 0) + 0);
            var y = Math.round (Math.random() * (1000 - 0) + 0);
            
            contract.methods.setRandomPosition(x, y).send({
                from: account
            });
        }
};

module.exports();