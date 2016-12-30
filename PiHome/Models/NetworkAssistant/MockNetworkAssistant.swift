//
//  MockNetworkAssistant.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

class MockNetworkAssistant: NetworkAssistant {
    
    private var responseType: NetworkResponseType
    private var sessionDataTask = URLSessionDataTask()
    
    //MARK: - Class Methods
    
    //MARK: - Initialization
    
    init(responseType: NetworkResponseType = .success) {
        
        self.responseType = responseType
        super.init(baseURL: URL(string: ""), sessionConfiguration: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
    
    override func get(_ URLString: String, parameters: Any?, progress downloadProgress: ProgressHandler?, success: NetworkAssistantSuccessHandler?, failure: NetworkAssistantFailureHandler? = nil) -> URLSessionDataTask? {
        
        if case .failure = responseType {
            failure?(sessionDataTask, Error(error: .noDataFound))
        } else {
            success?(sessionDataTask, requestType.mockResponse)
        }
        
        return sessionDataTask
    }
    
    override func post(_ URLString: String, parameters: Any?, progress uploadProgress: ProgressHandler?, success: NetworkAssistantSuccessHandler?, failure: NetworkAssistantFailureHandler? = nil) -> URLSessionDataTask? {
        
        if case .failure = responseType {
            failure?(sessionDataTask, Error(error: .noDataFound))
        } else {
            success?(sessionDataTask, requestType.mockResponse)
        }
        
        return sessionDataTask
    }
}

