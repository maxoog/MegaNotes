//
//  ViewController.swift
//  MegaNotes
//
//  Created by Максим on 10.04.2022.
//

import UIKit

class NoteListController: UIViewController { 
    
    private let noteManager = NoteManager()
    private var notes: [TextNote]?
    
    private var noteListView: NoteListView! {
        guard isViewLoaded else { return nil }
        return (view as! NoteListView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        noteListView.configure()
        
        noteListView.noteCollection.delegate = self
        noteListView.noteCollection.dataSource = self
        let layout = noteListView.noteCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = CGSize(width: view.frame.width / 2 - 5, height: view.frame.width / 3 - 9)
        
        self.notes = noteManager.fetchNotes()
    }
    
    @IBAction func newNoteButtonAction(_ sender: Any) {
        print("создаём новую заметку")
        let newNote = noteManager.createNote()
        print(newNote)
        noteListView.updateList()
        noteManager.save()
    }
    
    @IBAction func deleteNoteAction(_ sender: Any) {
        print("begin")
        guard let view = sender as? NoteCellView else { return }
        print("end")
        view.note.map(noteManager.removeNote)
        noteListView.updateList()
    }

}

extension NoteListController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noteManager.noteCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noteCell", for: indexPath) as! NoteCellView
        let note = noteManager.getNote(index: indexPath.row)
        cell.note = note
        
        return cell
    }
}

extension NoteListController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! NoteCellView
        guard let note = cell.note else { return }
        openNoteEditing(forNote: note)
    }
    
    func openNoteEditing(forNote note: TextNote) {
        let editNoteController = EditNoteController(for: note)
        editNoteController.delegate = noteManager
        navigationController?.pushViewController(editNoteController, animated: true)
    }
}
