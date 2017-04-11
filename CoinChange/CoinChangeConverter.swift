//
//  CoinChangeConverter.swift
//  CoinChange
//
//  Created by Michelline Tran on 4/11/17.
//  Copyright © 2017 MichellineTran. All rights reserved.
//

import Foundation

struct ChangeSet : Equatable {
    let quarters : UInt
    let dimes : UInt
    let nickels : UInt
    let pennies : UInt

    static func == (lhs: ChangeSet, rhs: ChangeSet) -> Bool {
        return
            lhs.quarters == rhs.quarters &&
            lhs.dimes == rhs.dimes &&
            lhs.nickels == rhs.nickels &&
            lhs.pennies == rhs.pennies
    }
}


class CoinChangeConverter  {

    func convertToChange(value: UInt) -> ChangeSet {
        switch value {
        case 25 : return ChangeSet(quarters: 1, dimes: 0, nickels: 0, pennies: 0)
        case 10 : return ChangeSet(quarters: 0, dimes: 1, nickels: 0, pennies: 0)
        case 5 : return ChangeSet(quarters: 0, dimes: 0, nickels: 1, pennies: 0)
        case 1 : return ChangeSet(quarters: 0, dimes: 0, nickels: 0, pennies: 1)
        default :
                let numberOfQuarters = value / 25
                let remainderFromQuarters = value % 25

                let numberOfDimes = remainderFromQuarters / 10
                let remainderFromDimes = remainderFromQuarters % 10

                let numberOfNickels = remainderFromDimes / 5
                let remainderFromNickels = remainderFromDimes % 5

                let numberOfPennies = remainderFromNickels

                return ChangeSet(quarters: numberOfQuarters, dimes: numberOfDimes, nickels: numberOfNickels, pennies: numberOfPennies)
        }

    }

}

//0.25x + 0.10y + 0.05z + 0.01a = value
