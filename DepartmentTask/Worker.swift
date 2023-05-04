//
//  Worker.swift
//  DepartmentTask
//
//  Created by Иван Захаров on 04.05.2023.
//

import Foundation

final class Worker {
    
    let name: String
    var rank: Int
    var workers: [Worker]? = nil
    
    init(name: String, rank: Int) {
        self.name = name
        self.rank = rank
    }
    
    func increaseRank(newRank: Int) {
        rank = newRank
        guard let workers else {
            return
        }
        for worker in workers {
            worker.increaseRank(newRank: newRank + 1)
        }
    }
    
    func printName() {
        var spaces = ""
        for _ in 1..<rank {
            spaces += "   "
        }
        print("\(spaces)\(name)")
        
        guard let workers else {
            return
        }
        for worker in workers {
            worker.printName()
        }
    }
}

extension Worker: Hashable {
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(name)
    }
    
    static func == (lhs: Worker, rhs: Worker) -> Bool {
        return lhs.name == rhs.name
    }
}
