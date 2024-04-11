//
//  BaraProviders.swift
//  Cafebara-iOS
//
//  Created by 방민지 on 4/11/24.
//

import Foundation

import Moya

struct BaraProviders {
    static let authProvider = MoyaProvider<AuthTarget>(withAuth: true)
}

extension MoyaProvider {
    convenience init(withAuth: Bool) {
        if withAuth {
            self.init(session: Session(interceptor: BaraInterceptor.shared),
                      plugins: [NetworkLoggerPlugin(verbose: true)])
        } else {
            self.init()
        }
    }
}
