const hre = require("hardhat");

async function main() {
    const contractAddress = "0x75a4BF652B00DE15EFeC602f9F2819A273403971"; // Your deployed NFT contract
    const recipient = "0x141bA487c2b408cD24F57bF1A58217be7a7b862A"; // 🔁 Use a proper 0x address
    const tokenURI = "ipfs://bafkreicqinvmi2rpzmui6da7lkjjtu4sqnsnkbd6gkxieufqox6wpy2z3u/metadata.json"; // From Pinata

    const [deployer] = await hre.ethers.getSigners();
    const cert = await hre.ethers.getContractAt("SalonSafeCertificate", contractAddress, deployer);

    const tx = await cert.issueCertificate(recipient, tokenURI);
    await tx.wait();

    console.log(`NFT Certificate minted to: ${recipient}`);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
