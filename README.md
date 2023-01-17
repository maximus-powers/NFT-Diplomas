# Use case for soulbound tokens: NFT Diplomas

Soulbound NFTs (SBTs) have been a hot topic in Web3 circles since Vitalik Buterin co-authored the paper [Decentralized Society: Finding Web3's Soul](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4105763).

Soulbound NFTs create the opportunity to represent acoomplishments and identity digitally, since they can't be transfered, bought, or sold. One use case suggested in the paper was for verifying academic achievements (i.e. digital diplomas). This turns a two step verification process (which involves contacting a school, or interacting with their database), into a one step, universal process. 

I'm almost done writing an article that dives more in depth with this concept, I'll have it linked here by Jan 20.

## The goal of this project

This project's goal is to build coherent tools that allow schools to mint SBT diplomas. 

## Current state of the project

For now, it's just a smart contract (diploma.sol). It uses the Open Zeppelin ERC721 libraries to mint NFTs, and I've overriden the transfer functions to no longer allow the NFTs to be moved to a new wallet once they are created. 

I've also created a whitelist system that only the owner of the smart contract can add addresses to. These will be the addresses of the organizations (schools) that have been verified and approved to mint diplomas. 

The smart contract is pretty rough right now, I'm still working on it, I just wanted to get something up on GitHub because I haven't seen any similar repos.

## Contributing: Next Steps
If you'd like to contribute that'd be great. If you'd like to talk more about the project, message me on [LinkedIn](https://www.linkedin.com/in/maximuspowers/).

**Documentation:** Need to document all the functions and relevant variables, though the whole readme could use some work. 

**Front-end:** My goal is to build a front end for this too, where schools can setup an account, connect a wallet, and request to be approved to mint diplomas. Then they'd be able to input data to be stored in the diploma, such as major, minor, etc. Eventually I'd want them to do this for many students all at once by uploading a CSV file or with a MySQL database (which would have to contain students wallet addresses as well as their academic data).

Students should also have access to a front end, where they can copy a link to their diploma, that could be posted, on a LinkedIn for example, for others to view. 

**Security audit:** I'm still new to solidity so the smart contract could have some flaws or logical errors. 
