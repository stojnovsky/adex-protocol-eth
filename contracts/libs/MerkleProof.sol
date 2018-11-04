pragma solidity ^0.4.25;

library MerkleProof {
	function isContained(bytes32 valueHash, bytes32[] memory proof, bytes32 root) internal pure returns (bool) {
		bytes32 cursor = valueHash;

		// NOTE: Should we end up in a situation where we compare valueHash == root if the proof is empty?
		for (uint256 i = 0; i!=proof.length; i++) {
			if (cursor < proof[i]) {
				cursor = keccak256(abi.encodePacked(cursor, proof[i]));
			} else {
				cursor = keccak256(abi.encodePacked(proof[i], cursor));
			}
		}

		return cursor == root;
	}
}

