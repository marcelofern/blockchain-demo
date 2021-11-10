// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ElectricitySale {

    uint public trade_price;
    event trade_event(
      string message,
      string buyer_address,
      uint money,
      uint power_in_kwh
    )

    function seller_sets_the_price(uint256 price_from_seller) public {
        trade_price = price_from_seller;
        emit trade_event(
          "PRICE_OF_POWER_HAS_BEEN_SET",
          "",
          trade_price,
          100
        );
    }

    function consumer_buys(uint price_from_buyer, string memory buyer_address) public {
        if (price_from_buyer >= trade_price) {
            emit trade_event(
              "BUYER_MATCHED_POWER_PRICE",
              buyer_address,
              price_from_buyer,
              100
            );
        }
        else {
            emit trade_event(
              "BUYER_DID_NOT_MATCH_POWER_PRICE",
              buyer_address,
              price_from_buyer,
              100
            );
        }
    }
}


