//
//  DateFormatter.swift
//  MessagesIOS5
//
//  Created by Colton Brenneman on 6/7/23.
//

import Foundation

extension DateFormatter {
    
    static func short() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .short
        return formatter
    }
} //End of extension
