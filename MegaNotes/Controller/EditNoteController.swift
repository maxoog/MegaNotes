//
//  EditNoteController.swift
//  MegaNotes
//
//  Created by Максим on 12.04.2022.
//
import Foundation
import UIKit

protocol NoteEditingDelegate: AnyObject {
    func noteTextDidChanged(forId: UInt, newText: String)
    func noteNameDidChanged(forId: UInt, newName: String)
}

class EditNoteController: UIViewController {
    private var note: TextNote
    var delegate: NoteEditingDelegate?
    
    private var noteEditView: NoteEditView! {
        guard isViewLoaded else { return nil }
        return (view as! NoteEditView)
    }
     
    init(for note: TextNote) {
        self.note = note
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable, renamed: "init(forNote:)")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        configureView()
    }
    
    private func configureView() {
        noteEditView.configure(forNote: note)
        noteEditView.textView.delegate = self
        navigationItem.title = note.name
    }
}

extension EditNoteController: UITextViewDelegate {
    
}
