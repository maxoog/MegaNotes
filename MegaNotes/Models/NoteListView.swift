//
//  NoteListView.swift
//  MegaNotes
//
//  Created by Максим on 12.04.2022.
//

import UIKit

class NoteListView: UIView {
    
    private let data: [Note] = [Note(name: "Big Note", text: "text"),
                                Note(name: "Your Mum", text: "hello guys i'm note"),
                                Note(name: "low poly note", text: "some string in some note")]
    
    public var noteCount: Int {
        data.count
    }
    
    public func getNote(index: Int) -> Note {
        return data[index]
    }
    
    func configure() {
        
    }
    
}
