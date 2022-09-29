//
//  UserAPI.swift
//  MoyaIntegration
//
//  Created by Viraj Padsala on 2022-09-23.
//

import Foundation
import Moya

public enum RandomUserAPI {
    case basic
  case results
}

extension RandomUserAPI:TargetType{
    // 1
      public var baseURL: URL {
        return URL(string: "https://api.randomuser.me/?results=5")!
      }

      // 2
      public var path: String {
        switch self {
        case.basic: return ""
        case .results: return "/?results=10"
        }
      }

      // 3
      public var method: Moya.Method {
        switch self {
        case.basic: return .get
        case .results: return .get
        }
      }

      // 4
      public var sampleData: Data {
        return Data()
      }

      // 5
      public var task: Task {
        return .requestPlain // TODO
      }

      // 6
      public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
      }

      // 7
      public var validationType: ValidationType {
        return .successCodes
      }
}


