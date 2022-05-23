//
//  NoteListView.swift
//  MegaNotes
//
//  Created by Максим on 12.04.2022.
//

import UIKit

class NoteListView: UIView {
    @IBOutlet weak var newNoteButton: UIButton!
    @IBOutlet weak var noteCollection: UICollectionView!
    
    override func awakeFromNib() {
        print("note list view awake from nib")
    }
    
    func configure() {
        noteCollection.register(NoteCellView.self, forCellWithReuseIdentifier: "noteCell")
        configureNewNoteButton()
        
    }
    
    func updateList() {
        self.noteCollection.reloadData()
    }
    
    func configureNewNoteButton() {
        newNoteButton.layer.cornerRadius = newNoteButton.frame.width / 2
    }
}
