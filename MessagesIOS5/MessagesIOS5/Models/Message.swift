//
//  Message.swift
//  MessagesIOS5
//
//  Created by Colton Brenneman on 6/7/23.
//

import Foundation

class Message {
    
    let text: String
    let isRead: Bool
    let timeStamp: Date
    let uuid: UUID
    
    init(text: String, isRead: Bool = false, timeStamp: Date = Date(), uuid: UUID = UUID()) {
        self.text = text
        self.isRead = isRead
        self.timeStamp = timeStamp
        self.uuid = uuid
    }
} //End of class

// MARK: - Extensions
extension Message: Equatable {
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.uuid == rhs.uuid
    }
} //End of extension
