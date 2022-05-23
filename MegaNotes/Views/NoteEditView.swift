//
//  NoteEditView.swift
//  MegaNotes
//
//  Created by Максим on 12.04.2022.
//

import UIKit

class NoteEditView: UIView {
    @IBOutlet weak var textView: UITextView!
    
    public func configure(forNote note: TextNote) {
        textView.text = note.text
    }
}
