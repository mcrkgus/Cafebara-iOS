//
//  AuthAPI.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 4/11/24.
//

import Foundation

import Moya

class AuthAPI {
    static let shared = AuthAPI()
    private let authProvider = BaraProviders.authProvider
    
    private init() {}
    
    ///토큰 갱신 처리
    func getNewToken(completion: @escaping(Result<Bool, Error>) -> Void) {
        authProvider.request(.getNewToken) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                //TODO: 토큰 갱신 로직 구현
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
