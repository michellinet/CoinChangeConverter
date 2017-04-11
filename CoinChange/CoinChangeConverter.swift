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

    func convertToChange(value: Float) -> ChangeSet {
        switch value {
        case 0.25 : return ChangeSet(quarters: 1, dimes: 0, nickels: 0, pennies: 0)
        case 0.10 : return ChangeSet(quarters: 0, dimes: 1, nickels: 0, pennies: 0)
        case 0.05 : return ChangeSet(quarters: 0, dimes: 0, nickels: 1, pennies: 0)
        case 0.01 : return ChangeSet(quarters: 0, dimes: 0, nickels: 0, pennies: 1)
        default :
            if value >=  0.25 {
                let numberOfQuarters = UInt(value/0.25)
                let remainderFromQuarters = value.truncatingRemainder(dividingBy: 0.25)
                return ChangeSet(quarters: numberOfQuarters, dimes: 0, nickels: 0, pennies: 0 )
            } else {
                return ChangeSet(quarters: 0, dimes: 0, nickels: 0, pennies: 0)
            }

        }

    }

}

//0.25x + 0.10y + 0.05z + 0.01a = value
