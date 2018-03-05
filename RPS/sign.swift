//
//  sign.swift
//  RPS
//
//  Created by Rosalie Wessels on 06/01/2018.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

enum Sign {
    case rock, paper, scissors
    
    var TextValue: String {
        switch self {
        case .rock: return "👊"
        case .paper: return "✋"
        case .scissors: return "✌️"
        }
    }
    
    func gameState(computer: Sign) -> GameState {
        
        if self == .rock && computer == .paper {
            return GameState.Lose
        }
        else if self == .rock && computer == .scissors {
            return GameState.Win
        }
        else if self == .rock && computer == .rock {
            return GameState.Draw
        }
        else if self == .scissors && computer == .rock {
            return GameState.Lose
        }
        else if self == .scissors && computer == .scissors {
            return GameState.Draw
        }
        else if self == .scissors && computer == .paper{
            return GameState.Win
        }
        else if self == .paper && computer == .rock{
            return GameState.Win
        }
        else if self == .paper && computer == .paper{
            return GameState.Draw
        }
        else if self == .paper && computer == .scissors{
            return GameState.Lose
        }
        else{
            return GameState.Draw
        }
    }

}

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    }
    else {
        return .scissors
    }
}





