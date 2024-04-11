//
//  BaraInterceptor.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 4/11/24.
//

import Foundation

import Alamofire
import Moya

final class BaraInterceptor: RequestInterceptor {
    
    static let shared = BaraInterceptor()
    
    private var limit = 3
    
    private init() {}
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard urlRequest.url?.absoluteString.hasPrefix(Config.baseURL) == true,
              let accessToken = UserManager.shared.accessToken,
              let refreshToken = UserManager.shared.refreshToken
        else {
            completion(.success(urlRequest))
            return
        }
        
        var urlRequest = urlRequest
        urlRequest.setValue(accessToken, forHTTPHeaderField: "accessToken")
        urlRequest.setValue(refreshToken, forHTTPHeaderField: "refreshToken")
        print("adator 적용 \(urlRequest.headers)")
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("🥒🥒🥒🥒retry 진입🥒🥒🥒🥒")
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401, request.retryCount < limit
        else {
            if request.retryCount > limit {
                print("🚨🚨🚨🚨재시도 횟수를 초과했습니다 🚨🚨🚨🚨")
            }
            completion(.doNotRetryWithError(error))
            return
        }
        
        AuthAPI.shared.getNewToken { result in
            switch result {
            case .success:
                print("🍏🍏🍏🍏토큰 재발급 성공🍏🍏🍏🍏")
                completion(.retry)
            case .failure(let error):
                print("🚨🚨🚨🚨토큰 재발급이 실패했습니다🚨🚨🚨🚨")
                completion(.doNotRetryWithError(error))
            }
        }
    }
}
