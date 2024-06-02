//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation
import RxSwift
import Alamofire

open class BaseApiClient {
    
    internal static func request<T: Codable, E: Codable>(urlConvertible: URLRequestConvertible, errorType: E.Type) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = AF.request(urlConvertible).responseDecodable(of: T.self) { response in
                let statusCode = response.response?.statusCode
                switch response.result {
                case .success(let value):
                    print("response code = \(String(describing: statusCode))")
                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                        print("Data: \(utf8Text)")
                    }
                    switch statusCode {
                    case 200, 201, 204:
                        observer.onNext(value)
                        observer.onCompleted()
                    case 400:
                        if let errorModel = try? JSONDecoder().decode(E.self, from: response.data!) {
                            observer.onError(ApiError.badRequest(error: errorModel, statusCode: statusCode))
                        } else {
                            observer.onError(ApiError.badRequest(error: value, statusCode: statusCode))
                        }
                    case 401:
                        if let errorModel = try? JSONDecoder().decode(E.self, from: response.data!) {
                            observer.onError(ApiError.apiKeyIncorrect(error: errorModel, statusCode: statusCode))
                        } else {
                            observer.onError(ApiError.unAuthorized(error: value, statusCode: statusCode))
                        }
                    case 402:
                        if let errorModel = try? JSONDecoder().decode(E.self, from: response.data!) {
                            observer.onError(ApiError.paymentIssue(error: errorModel, statusCode: statusCode))
                        } else {
                            observer.onError(ApiError.paymentIssue(error: value, statusCode: statusCode))
                        }
                    case 403:
                        if let errorModel = try? JSONDecoder().decode(E.self, from: response.data!) {
                            observer.onError(ApiError.forbidden(error: errorModel, statusCode: statusCode))
                        } else {
                            observer.onError(ApiError.forbidden(error: value, statusCode: statusCode))
                        }
                    case 404:
                        if let errorModel = try? JSONDecoder().decode(E.self, from: response.data!) {
                            observer.onError(ApiError.notFound(error: errorModel, statusCode: statusCode))
                        } else {
                            observer.onError(ApiError.notFound(error: value, statusCode: statusCode))
                        }
                    case 405:
                        if let errorModel = try? JSONDecoder().decode(E.self, from: response.data!) {
                            observer.onError(ApiError.notAllowed(error: errorModel, statusCode: statusCode))
                        } else {
                            observer.onError(ApiError.notAllowed(error: value, statusCode: statusCode))
                        }
                    case 422:
                        if let errorModel = try? JSONDecoder().decode(E.self, from: response.data!) {
                            observer.onError(ApiError.unProcessEntity(error: errorModel, statusCode: statusCode))
                        } else {
                            observer.onError(ApiError.unProcessEntity(error: value, statusCode: statusCode))
                        }
                    case 500:
                        if let errorModel = try? JSONDecoder().decode(E.self, from: response.data!) {
                            observer.onError(ApiError.internalServerError(error: errorModel, statusCode: statusCode))
                        } else {
                            observer.onError(ApiError.internalServerError(error: value, statusCode: statusCode))
                        }
                    default:
                        if let errorModel = try? JSONDecoder().decode(E.self, from: response.data!) {
                            observer.onError(ApiError.defaultError(error: errorModel, statusCode: statusCode))
                        } else {
                            observer.onError(ApiError.defaultError(error: value, statusCode: statusCode))
                        }
                    }
                case .failure(let error):
                    print("get failed response with description = \(error.localizedDescription)")
                    let progressUpdate = Response(failedError: error.localizedDescription, failedStatus: false)
                        switch statusCode {
                        case 204:
                            observer.onNext(progressUpdate as! T)
                            observer.onCompleted()
                        case 200:
                            observer.onError(ApiError.onSuccess(error: progressUpdate, statusCode: statusCode))
                        case 400:
                            observer.onError(ApiError.badRequest(error: progressUpdate, statusCode: statusCode))
                        case 401:
                            observer.onError(ApiError.unAuthorized(error: progressUpdate, statusCode: statusCode))
                        case 402:
                            observer.onError(ApiError.paymentIssue(error: progressUpdate, statusCode: statusCode))
                        case 403:
                            observer.onError(ApiError.forbidden(error: progressUpdate, statusCode: statusCode))
                        case 404:
                            observer.onError(ApiError.notFound(error: progressUpdate, statusCode: statusCode))
                        case 405:
                            observer.onError(ApiError.notAllowed(error: progressUpdate, statusCode: statusCode))
                        case 422:
                            observer.onError(ApiError.unProcessEntity(error: progressUpdate, statusCode: statusCode))
                        case 500:
                            observer.onError(ApiError.internalServerError(error: progressUpdate, statusCode: statusCode))
                        case nil:
                            //When status code is nil
                            observer.onError(ApiError.defaultError(error: progressUpdate, statusCode: 500))
                        default:
                            observer.onError(ApiError.defaultError(error: progressUpdate, statusCode: statusCode))
                        }
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
