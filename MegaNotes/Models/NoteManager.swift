//
//  NoteManager.swift
//  MegaNotes
//
//  Created by Максим on 10.04.2022.
//

import Foundation
import CoreData

class NoteManager {
    
    private let container: NSPersistentContainer
    private var notes: [TextNote]?
    
    public init() {
        container = NSPersistentContainer(name: "NoteStorageModel")
        container.loadPersistentStores { (_, error) in // дескриптор стора и ошибка
            if error != nil { fatalError() }
        }
    }
    
    public var noteCount: Int {
        guard let count = try? container.viewContext.count(for: TextNote.fetchRequest()) else {
            return 0
        }
        return count
    }
    
    public func getNote(index: Int) -> TextNote? {
        return notes.map { $0[index] }
    }
    
    public func createNote() -> TextNote {
        let note = TextNote(context: container.viewContext)
        note.name = "Maxon"
        note.text = "hello maaan i'm your new note!!!!"
        return note
    }
    
    public func save() {
        do {
            try container.viewContext.save()
        } catch {
            print("couldn't save changes")
        }
    }
    
    public func removeNote(note: TextNote) {
        container.viewContext.delete(note)
    }
    
    public func fetchNotes() -> [TextNote] {
        let request = TextNote.fetchRequest()
        let notes = try? container.viewContext.fetch(request)
        print(notes ?? "nil note")
        return notes ?? []
    }
    
}

extension NoteManager: NoteEditingDelegate {
    func noteTextDidChanged(forId id: UInt, newText text: String) {
        print("сохраняем новый текст " + text)
    }
    
    func noteNameDidChanged(forId id: UInt, newName name: String) {
        print("сохраняем новое название " + name)
    }
}

public extension TextNote {
    override var description: String {
        "ID:\(self.objectID.uriRepresentation()); \nNAME: \(name ?? "unknowned"); \nTEXT:\(text ?? "")"
    }
}
