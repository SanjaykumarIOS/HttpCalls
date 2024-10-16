//
//  User.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 06/02/23.
//

import Foundation
import SwiftUI

struct UserModel: Identifiable {
    
    var id: String = UUID().uuidString
    var firstname: String
    var lastname: String
    var age: String
    var mobileNo: String
    var place: String
}
