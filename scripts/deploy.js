const hre = require("hardhat");

async function main() {
    const initialSupply = hre.ethers.parseEther("1000000"); // 1 Million SLN Tokens
    const SalonSafeToken = await hre.ethers.getContractFactory("SalonSafeToken");
    const token = await SalonSafeToken.deploy(initialSupply);

    await token.waitForDeployment();

    console.log(`SalonSafe Token deployed to: ${await token.getAddress()}`);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
