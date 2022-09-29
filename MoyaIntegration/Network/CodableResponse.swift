//
//  CodableResponse.swift
//  MoyaIntegration
//
//  Created by Viraj Padsala on 2022-09-23.
//

import Foundation

struct UserResponse<T: Codable>: Codable {
  let data: UserResults<T>
}

struct UserResults<T: Codable>: Codable {
  let user: [T]
}

struct ImgurResponse<T: Codable>: Codable {
  let data: T
}
