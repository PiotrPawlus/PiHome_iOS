//
//  ProcesInfo+Extension.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

extension ProcessInfo {
    
    static var isTesting: Bool {
        return processInfo.environment["animations"] == "0" || processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
}
