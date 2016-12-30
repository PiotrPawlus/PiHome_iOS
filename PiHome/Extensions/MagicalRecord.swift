//
//  MagicalRecord.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

extension MagicalRecord {
    
    static let context = NSManagedObjectContext.mr_default()
    
    //MARK: - Class Methods
    
    static func save(block: @escaping (NSManagedObjectContext) -> Swift.Void, completion: @escaping ErrorHandler) {
        
        if ProcessInfo.isTesting {
            
            block(context)
            completion(nil)
            
        } else {
            
            MagicalRecord.save({ context in
                
                block(context)
                
            }, completion: { finished, error in
                
                completion(Error(error: error))
            })
        }
    }
    
    //MARK: - Initialization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
}
