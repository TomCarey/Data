//
//  Model.swift
//  Data
//
//  Created by Daniel Brooker on 16/03/15.
//  Copyright (c) 2015 Nocturnal Code. All rights reserved.
//
import YapDatabase

/// Data.Archive
public typealias Archive = [String: AnyObject]

/// Data.Model
public protocol Model : Equatable {
    /// Unique identifier
    var uid : String { get }
    
    init(archive: Archive)
    var archive : Archive { get }
    
    func indexes() -> [Index]
}

public extension Model {

    func indexes() -> [Index] {
        return []
    }
    
}

func ==<T: Model>(lhs: T, rhs: T) -> Bool {
    return lhs.uid == rhs.uid
}

public protocol ManagedArchive {
    
    init(archive: Archive, store: YapStore, transaction: YapDatabaseReadTransaction)
    func archiveRelationships(store: YapStore, transaction: YapDatabaseReadWriteTransaction)
    
}