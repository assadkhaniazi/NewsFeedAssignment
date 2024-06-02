//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation
enum ApiError<T: Codable>: Error {
    case onSuccess(error: T, statusCode: Int?)           // Status code 200
    case badRequest(error: T, statusCode: Int?)          // Status code 400
    case unAuthorized(error: T, statusCode: Int?)        // Status code 401
    case paymentIssue(error: T, statusCode: Int?)        // Status code 402
    case forbidden(error: T, statusCode: Int?)           // Status code 403
    case notFound(error: T, statusCode: Int?)            // Status code 404
    case notAllowed(error: T, statusCode: Int?)          // Status code 405
    case unProcessEntity(error: T, statusCode: Int?)     // Status code 422
    case internalServerError(error: T, statusCode: Int?) // Status code 500
    case defaultError(error: T, statusCode: Int?)
    case apiKeyIncorrect(error: T, statusCode: Int?) // Status code 401
    
}
