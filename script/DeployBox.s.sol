// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployBox is Script {

    address ANVILADDRESS = 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512;
    function run() external returns(address){
        address proxy = deployBox();
        return proxy;
    }

    function deployBox() public returns(address){
        vm.startBroadcast();
        BoxV1 box = new BoxV1();
        ERC1967Proxy proxy = new ERC1967Proxy(address(box, ""));
        BoxV1(address(proxy)).initialize(0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512);
        vm.stopBroadcast();
        return address(proxy);
    }
}