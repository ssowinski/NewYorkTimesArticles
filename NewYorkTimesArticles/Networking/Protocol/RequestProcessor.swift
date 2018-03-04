//
//  RequestProcessor.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 03.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol RequestProcessor: class {
    var networkService: NetworkService { get }
    var successSerializer: SuccessSerializing { get }
    var errorSerializer: ErrorSerializing { get }
    var networkLogger: NetworkLogging? { get }
    //TODO: var reachabilityProvider: ReachabilityProviding { get }
}

extension RequestProcessor {
    
    func getObject<T: JsonInitializable>(requestTarget: RequestTargetType, completionHandler: @escaping (Result<T?>) -> Void) {

        networkService.startRequest(requestTarget) {[weak self] (response, data, error) in

            guard let strongSelf = self else { return }

            strongSelf.networkLogger?.log(requestTarget, response, data, error)

            guard error == nil else {
                let serializedError = strongSelf.errorSerializer.serializeError(error, statusCode: response?.statusCode, data: data)
                completionHandler(.failure(serializedError))
                return
            }
            
            let obj: T? = strongSelf.successSerializer.toObject(fromData: data, nestedObjPath: requestTarget.nestedObjPath)
            completionHandler(.success(obj))
        }
    }

    func getCollection<T: JsonInitializable>(requestTarget: RequestTargetType, completionHandler: @escaping (Result<[T]>) -> Void) {

        networkService.startRequest(requestTarget) {[weak self] (response, data, error) in
            
            guard let strongSelf = self else { return }
            
            strongSelf.networkLogger?.log(requestTarget, response, data, error)
            
            guard error == nil else {
                let serializedError = strongSelf.errorSerializer.serializeError(error, statusCode: response?.statusCode, data: data)
                completionHandler(.failure(serializedError))
                return
            }
            
            let objColection: [T] = strongSelf.successSerializer.toObjectsColection(fromData: data, nestedObjPath: requestTarget.nestedObjPath)
            completionHandler(.success(objColection))
        }
    }

    func getNothing(requestTarget: RequestTargetType, completionHandler: @escaping (Result<Void>) -> Void) {

        networkService.startRequest(requestTarget) {[weak self] (response, data, error) in
            guard let strongSelf = self else { return }
            
            strongSelf.networkLogger?.log(requestTarget, response, data, error)
            
            guard error == nil else {
                let serializedError = strongSelf.errorSerializer.serializeError(error, statusCode: response?.statusCode, data: data)
                completionHandler(.failure(serializedError))
                return
            }
            completionHandler(.success(()))
        }
    }

}
