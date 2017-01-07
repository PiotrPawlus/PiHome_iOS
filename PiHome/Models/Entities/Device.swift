//
//  Device.swift
//  PiHome
//
//  Created by Piotr Pawluś on 06/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

@objc(Device)
class Device: NSManagedObject {
    
    @NSManaged var identifier: Int64
    @NSManaged var information: String
    @NSManaged var name: String
    @NSManaged var pin: Int32
    @NSManaged var state: Bool
    @NSManaged var type: String
    
    @NSManaged var user: User?
    
    //MARK: - Class Methods
    
    class func createOrUpdate(with dictionary: [AnyHashable: Any], in context: NSManagedObjectContext) -> Device {
        
        let identifier = dictionary["id"] as! Int
        let device = find(withIdentifier: identifier, in: context) ?? Device.mr_createEntity(in: context)
        
        device!.identifier = Int64(identifier)
    
        if let information = dictionary["info"] as? String {
            device!.information = information
        }
        
        if let name = dictionary["name"] as? String {
            device!.name = name
        }
        
        if let pin = dictionary["pin"] as? Int {
            device!.pin = Int32(pin)
        }
        
        if let state = dictionary["state"] as? Bool {
            device!.state = state
        }
        
        if let type = dictionary["type"] as? String {
            device!.type = type
        }
        
        return device!
    }
    
    class func find(withIdentifier identifier: Int, in context: NSManagedObjectContext) -> Device? {
        return Device.mr_findFirst(byAttribute: "identifier", withValue: identifier, in: context)
    }
    
    class func removeOrphaned(in context: NSManagedObjectContext) {
        
        let predicate = NSPredicate(format: "user = nil")
        Device.mr_deleteAll(matching: predicate, in: context)
    }
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
}

