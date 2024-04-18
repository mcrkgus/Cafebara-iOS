//
//  LoginTarget.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 4/11/24.
//

import Foundation

import Moya

enum AuthTarget {
    case login(token: String, provider: String)
    case getNewToken
}

extension AuthTarget: BaseTargetType {
    var headers: [String : String]? {
        switch self {
        case .login(token: let token, provider: let provider):
            return .none
        case .getNewToken:
            return .none
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        case .getNewToken:
            return "/getNewToken"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .getNewToken:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .login(let token, let provider):
            return .requestParameters(parameters: ["token": token, "provider": provider], encoding: JSONEncoding.default)
        case .getNewToken:
            return .requestPlain
        }
    }
}
