//
//  DepartmentService.swift
//  DepartmentTask
//
//  Created by Иван Захаров on 04.05.2023.
//

import Foundation

final class DepartmentService {
    var workers: Set<Worker> = []
    
    func printHierarchyWorkers(_ array: [String]) {
        findChiefs()
        printSortedDepartment()
    }
    
    private func findChiefs() {
        for string in ar {
            var department = string.components(separatedBy: ",")
            
            guard let chiefName = department.first else{
                return
            }
            let chief = createChief(by: chiefName)
            let _ = department.removeFirst()
            let slaves = createSlaves(department: department, chiefRank: chief.rank)
            chief.workers = slaves
        }
    }
    
    private func createSlaves(department: [String], chiefRank: Int) -> [Worker] {
        var slaves: [Worker] = []
        for personName in department {
            if let worker = hasWorker(name: personName) {
                worker.increaseRank(newRank: chiefRank + 1)
                slaves.append(worker)
            } else {
                let worker = Worker(name: personName, rank: chiefRank + 1)
                slaves.append(worker)
                workers.insert(worker)
            }
        }
        return slaves
    }

    private func createChief(by name: String) -> Worker {
        let chief: Worker
        if let worker = hasWorker(name: name) {
            chief = worker
            workers.insert(chief)
        }
        else {
            chief = Worker(name: name, rank: 1)
            workers.insert(chief)
        }
        return chief
    }

    private func hasWorker(name: String) -> Worker? {
        for worker in workers {
            if worker.name == name {
                return worker
            }
        }
        return nil
    }

    private func printSortedDepartment() {
        let headChief = workers.first { worker in
            return worker.rank == 1
        }
        guard let headChief else {
            return
        }
        
        headChief.printName()
    }
}
