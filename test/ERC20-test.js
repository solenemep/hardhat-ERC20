const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("ERC20", function () {
  let ERC20, erc20, dev, owner, alice, bob, charlie, dan, eve

  beforeEach(async function () {
    [dev, owner, alice, bob, charlie, dan, eve] = await ethers.getSigners();
    ERC20 = await ethers.getContractFactory("ERC20");
    erc20 = await ERC20.connect(dev).deploy(owner.address, 1000000);
    await erc20.deployed();
  })

  describe("Deployment", function () {
    it('Has name CoinCoin', async function () {
      expect(await erc20.name()).to.equal('CoinCoin');
    })
    it('Has symbol CC', async function () {
      expect(await erc20.symbol()).to.equal('CC');
    })
    it('Mints initialSupply to owner', async () => {
      expect(await erc20.balanceOf(owner.address)).to.equal(1000000);
    });
    it('Emits event Transfer on deployement', async function () {
      /*
      await ERC20.connect(dev).deploy(owner.address, 1000000).to.emit(erc20, 'Transfer').withArgs()
      */
    });

  });

  describe("Transactions", function () {

    describe("transfer", function () {
      it('Should transfer tokens', async () => { })
      it('Should fail if msg.sender doesnt have enough tokens', async () => {
        await expect().to.be.revertedWith("ERC20: Not enough Ether to transfer");
      });
      it('Should fail if msg.sender is address(0)', async () => {
        await expect().to.be.revertedWith("ERC20: transfer to the zero address");
      });
      it("Emits event Transfer when transfer token", async function () { })
    });

    describe("transferFrom", function () {
      it('Should transferFrom tokens', async () => { });
      it('Should fail if msg.sender is not allowed by from', async () => {
        await expect().to.be.revertedWith("ERC20: transfer amount exceeds allowance");
      });
      it('Should fail if from doesnt have enough tokens', async () => {
        await expect().to.be.revertedWith("ERC20: Not enough Ether to transfer");
      });
      it('Should fail if from is address(0)', async () => {
        await expect().to.be.revertedWith("ERC20: transfer to the zero address");
      });
      it("Emits event Transfer when transferFrom token", async function () { })
    });

    describe("approve", function () {
      it('Should approve allowances', async () => { });
      it('Should fail if spender is address(0)', async () => {
        await expect().to.be.revertedWith("ERC20: approve to the zero address");
      });
      it("Emits event Approval when approve spender", async function () { })
    });

  })
})
