const Token = artifacts.require("MyToken");
const TokenSale = artifacts.require("MyTokenSale");

const chai = require('./setupchai');
const BN = web3.utils.BN;
const expect = chai.expect;

require('dotenv').config({path: '../.env'});

contract("TokenSale", async function(accounts) {
    const [ initialHolder, recipient, anotherAccount ] = accounts;

    it("there shouldnt be any coins in my account", async () => {
        let instance = await Token.deployed();
        expect(instance.balanceOf.call(initialHolder)).to.eventually.be.a.bignumber.equal(new BN(0));
    });
});