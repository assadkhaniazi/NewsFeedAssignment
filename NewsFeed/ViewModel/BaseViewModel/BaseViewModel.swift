//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation
import RxSwift

class BaseViewModel: NSObject {
    
    let mDataManager: DataManager = DataManager()
    let disposeBag = DisposeBag()
    var completeResponse: Box<Int?> = Box(nil)
    
    // Variables to store status codes
    var errorStatusCode: Box<Int?> = Box(nil)
    
    
    internal func handleError<T>(data: ApiError<T>?, errorObserver: Box<T?>, expireObserver: Box<T?>, statusCodeObserver: Box<Int?>) {
        switch data {
        case .forbidden(let error, let statusCode):
            print("Forbidden error with status code: \(String(describing: statusCode))")
            errorObserver.value = error
            statusCodeObserver.value = statusCode
        case .badRequest(let error, let statusCode):
            print("Bad request error with status code: \(String(describing: statusCode))")
            errorObserver.value = error
            statusCodeObserver.value = statusCode
        case .unAuthorized(let error, let statusCode):
            print("Unauthorized error with status code: \(String(describing: statusCode))")
            expireObserver.value = error
            statusCodeObserver.value = statusCode
        case .paymentIssue(let error, let statusCode):
            print("Payment issue error with status code: \(String(describing: statusCode))")
            errorObserver.value = error
            statusCodeObserver.value = statusCode
        case .notFound(let error, let statusCode):
            print("Not found error with status code: \(String(describing: statusCode))")
            errorObserver.value = error
            statusCodeObserver.value = statusCode
        case .notAllowed(let error, let statusCode):
            print("Not allowed error with status code: \(String(describing: statusCode))")
            errorObserver.value = error
            statusCodeObserver.value = statusCode
        case .unProcessEntity(let error, let statusCode):
            print("Unprocessable entity error with status code: \(String(describing: statusCode))")
            errorObserver.value = error
            statusCodeObserver.value = statusCode
        case .internalServerError(let error, let statusCode):
            print("Internal server error with status code: \(String(describing: statusCode))")
            errorObserver.value = error
            statusCodeObserver.value = statusCode
        case .onSuccess(let error, let statusCode):
            print("Success with status code: \(String(describing: statusCode))")
            errorObserver.value = error
            statusCodeObserver.value = statusCode
        case .defaultError(let error, let statusCode):
            print("Default error with status code: \(String(describing: statusCode))")
            errorObserver.value = error
            statusCodeObserver.value = statusCode
        case .apiKeyIncorrect(let error, let statusCode):
            print("Default error with status code: \(String(describing: statusCode))")
            errorObserver.value = error
            statusCodeObserver.value = statusCode
        case .none:
            errorObserver.value = nil
      
        }
    }
    
    
}
