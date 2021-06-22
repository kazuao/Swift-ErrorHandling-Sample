import UIKit

enum CustomError: Error {
    case networkingError(message: String)
    case coreDataSaveError(message: String)
    case someOtherError
}

func someDangerousCode(throwError: Bool) throws -> String {
    
    let returnMessage = "Did this make if?"
    
//    if throwError {
//        throw CustomError.networkingError(message: "Networking Error")
//    }
    
    if throwError {
        throw CustomError.coreDataSaveError(message: "CoreData Save Error")
    }
    
//    if throwError {
//        throw CustomError.someOtherError
//    }
    
    return returnMessage
}

// try?は失敗時にnilが返る
let responseOne = try? someDangerousCode(throwError: true)
print("The responseOne is: \(String(describing: responseOne))")

// try!は失敗時にクラッシュする
let responseTwo = try? someDangerousCode(throwError: false)
print("The responseTwo is: \(String(describing: responseTwo))")

// tryはthrowが返るが、do - catchで囲う必要がある
do {
    let responseThree = try someDangerousCode(throwError: true)
    print("The responseThree is: \(String(describing: responseThree))")
    
} catch CustomError.networkingError(let errorMessage) {
    print("Receive Networking Error: \(errorMessage)")
    
} catch CustomError.coreDataSaveError(let errorMessage) {
    print("Receive CoreData Save Error: \(errorMessage)")

} catch {
    print("Receive Default Error: \(error.localizedDescription)")
}

