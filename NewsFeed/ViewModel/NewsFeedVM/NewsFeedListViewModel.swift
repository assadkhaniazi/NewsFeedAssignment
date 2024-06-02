//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation


class NewsFeedListViewModel:BaseViewModel{
    
    //Controller Variables
    var resutlsArray:[Result]? = []
    var isAlreadyInstalled = false
    
    //Bindings Variables
    var responseNewsFeed: Box<Response?> = Box(nil)
    var responseNewsFeedError: Box<ErrorModel?> = Box(nil)
    var responseNewsFeedExpiryObserver: Box<ErrorModel?> = Box(nil)
    
    // MARK: - API Calls
    func getNewsFeedApi(getNewsFeed: GetNewsFeed) {
        mDataManager.getNewsFeed(getNewsFeed: getNewsFeed,erreModel: ErrorModel.self)
            .subscribe(onNext: { responseMain in
                self.responseNewsFeed.value = responseMain
            }, onError: { error in
                
                if let errorResponse = error as? ApiError<ErrorModel> {
                    self.handleError(data: errorResponse, errorObserver: self.responseNewsFeedError, expireObserver: self.responseNewsFeedExpiryObserver, statusCodeObserver: self.errorStatusCode)
                }else if let errorResponse = error as? ApiError<Response>{
                    self.handleError(data: errorResponse, errorObserver: Box(nil), expireObserver: Box(nil), statusCodeObserver: self.errorStatusCode)
                }
                else {
                    let unknownError = ErrorModel(fault: ErrorRespose(faultstring: "Unknown error", detail: Detail(errorcode: error.localizedDescription)),progress: nil)
                    self.responseNewsFeedError.value = unknownError
                    self.errorStatusCode.value = -1
                }
            }, onCompleted: {
                //you create any model type for complete binding
                self.completeResponse.value = -1
            }).disposed(by: disposeBag)
    }
    
    //MARK: - DataBase Calls
    func insertNewsFeedIntoDb()->Bool{
       return mDataManager.insertNewsFeedIntoDb(results: self.resutlsArray)
    }
    func getNewsFeedFromDb(){
        if (mDataManager.getNewsFeedFromDb()?.count ?? 0) > 0 {
            self.resutlsArray = mDataManager.getNewsFeedFromDb()
        }
        
    }
}


