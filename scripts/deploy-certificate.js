const hre = require("hardhat");

async function main() {
    const [deployer] = await hre.ethers.getSigners();

    const SalonSafeCertificate = await hre.ethers.getContractFactory("SalonSafeCertificate");
    const contract = await SalonSafeCertificate.deploy(deployer.address);

    await contract.waitForDeployment();
    console.log(`SalonSafe Certificate NFT deployed to: ${await contract.getAddress()}`);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
