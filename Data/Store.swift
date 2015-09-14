//
//  DataBacked.swift
//  Take Note
//
//  Created by Daniel Brooker on 6/10/14.
//  Copyright (c) 2014 Nocturnal Code. All rights reserved.
//

import Foundation
import YapDatabase

public protocol Store {
    
    // READ
    func all<T : Model>() -> [T]
    func find<T : Model>(id: String) -> T?
    func filter<T: Model>(filter: (element: T) -> (Bool) ) -> [T]
    func count<T: Model>(klass: T.Type) -> Int
    func query<T : Model>(query: Query<T>) -> [T]

    // ASYNCREAD
    func asyncFind<T : Model>(id: String, callback: (object: T?) -> ())
    
    // WRITE
    func add<T : Model>(element: T)
    func remove<T : Model>(element: T)
    func update<T : Model>(element: T)
    func truncate<T: Model>(klass: T.Type)
    
    // ASYNCWRITE
    func asyncAdd<T : Model>(object: T)
    func asyncUpdate<T: Model>(element: T)

    // INDEXES
    func index<T: Model>(model : T)
    func find<T: Model>(key: String, value: Indexable) -> T?
    func filter<T: Model>(key: String, value: Indexable) -> [T]
    func asyncFilter<T: Model>(key: String, value: Indexable, callback: (objects: [T]) -> ())
    
    // SEARCH
    func search<T: Model>(string string: String) -> [T]
    func search<T: Model>(phrase phrase: String) -> [T]
    
    func asyncFind<T : Model where T: ManagedArchive>(id: String, callback: (object: T?) -> ())
    func asyncAdd<T : Model where T: ManagedArchive>(object: T)
    func save<T: Model>(object: T, transaction: YapDatabaseReadWriteTransaction)
    func advancedFind<T : Model where T: ManagedArchive>(id: String) -> T?
}