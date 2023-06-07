//
//  MessageController.swift
//  MessagesIOS5
//
//  Created by Colton Brenneman on 6/7/23.
//

import Foundation

class MessageController {
    
    // MARK: - Properties
    static let sharedInstance = MessageController()
    var messages: [Message] = []
    
    // MARK: - CRUD Functions
    func createMessage(text: String) {
        let message = Message(text: text)
        messages.append(message)
        save()
    }
    
    func deleteMessage(message: Message) {
        guard let index = messages.firstIndex(of: message) else { return }
        messages.remove(at: index)
        save()
    }
    
    func toggleIsRead(message: Message) {
        message.isRead.toggle()
        save()
    }
    
    // MARK: - Persistence
    func save() {
        guard let url = fileURL else { return }
        do {
            let data = try JSONEncoder().encode(messages)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func load() {
        guard let url = fileURL else { return }
        do {
            let data = try Data(contentsOf: url)
            let messages = try JSONDecoder().decode([Message].self, from: data)
            self.messages = messages
        } catch {
            print(error)
        }
    }
    
    private var fileURL: URL? {
        guard let documentsDirector = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let url = documentsDirector.appendingPathComponent("messages.json")
        return url
    }
} //End of class
