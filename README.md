# NFT-as-ownership

My main account's private key got compromised thus I needed to transfer ownership of each and every contract I deployed which was annoying and risky.
This library was built to ease the maintenance issue of your contracts ownership.

With `NFTOwned.sol` and `Ownership.sol`, you can designate an owner as an NFT token ID instead of your account's address.
One NFT can be the owner of multiple contracts so if you need to transfer an ownership of a protocol in bulk, it's enough to just transfer the NFT to the new owner in 1 transaction.

**Useful scenarios**:
  1. Your account got compromised so you need to transfer the ownerships in bulk (I hope this is not the case 🥲)
  2. Deploy a set of contracts using your EOA first, then bulk transfer the ownerships to a multisig wallet
  3. Your protocol got acquired by another organization so you need to transfer the ownerships to the acquirer
  4. You can even sell the ownership of the entire protocol easily (the more important contracts yours owns, more expensive it will get)

[![License: WTFPL](http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-3.png)](http://www.wtfpl.net/)

## License

Distributed under the WTFPL License. See `LICENSE` for more information.

## Contact

* [LevX](https://twitter.com/LEVXeth/)
