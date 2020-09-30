//
//  KeychainHelper.swift
//  Lesson 89
//
//  Created by Lucas Derraugh on 9/27/20.
//

import Foundation
import LocalAuthentication

class KeychainHelper {
    
    static func createEntry(key: String, data: Data) -> OSStatus {
        remove(key: key)
        
        let query = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrAccount : key,
            kSecAttrAccessControl : secAccessControl,
            kSecValueData : data
        ] as CFDictionary
        
        return SecItemAdd(query, nil)
    }
    
    static func remove(key: String) {
        let query = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrAccount : key
        ] as CFDictionary
        
        SecItemDelete(query)
    }
    
    static func load(key: String, context: LAContext) -> Data? {
        let query = [
            kSecClass                    : kSecClassGenericPassword,
            kSecAttrAccount              : key,
            kSecReturnData               : true,
            kSecMatchLimit               : kSecMatchLimitOne,
            kSecUseAuthenticationContext : context,
            kSecUseAuthenticationUI      : kSecUseAuthenticationUISkip
        ] as CFDictionary
        
        var dataTypeRef: AnyObject? = nil
        let status = SecItemCopyMatching(query, &dataTypeRef)
        
        if status == noErr {
            return dataTypeRef as? Data
        } else {
            return nil
        }
    }
    
    static var secAccessControl: SecAccessControl {
        return SecAccessControlCreateWithFlags(nil, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, .userPresence, nil)!
    }
}
