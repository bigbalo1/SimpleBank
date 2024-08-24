const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");



const TokenModule = buildModule("AccountModule", (m) => {
  

  const lock = m.contract("SimpleBank");

  return { lock };
});
module.exports = TokenModule;