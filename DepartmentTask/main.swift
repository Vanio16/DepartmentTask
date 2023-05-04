//
//  main.swift
//  DepartmentTask
//
//  Created by Иван Захаров on 04.05.2023.
//

/*

Есть список отделов, каждый отдел состоит из сотрудников, на первом месте стоит руководитель отдела, одному сотруднику может подчиняться один отдел
Вывести структуру всех отделов согласно рангу

input: ["B2,E5,F6", "A1,B2,C3,D4", "D4,G7,I9", "G7,H8"]
output:
A1
     B2
         E5
         F6
     C3
     D4
         G7
             H8
         I9

*/

import Foundation

let ar = ["B2,E5,F6", "A1,B2,C3,D4", "D4,G7,I9", "G7,H8"]
let service: DepartmentService = .init()

service.printHierarchyWorkers(ar)






