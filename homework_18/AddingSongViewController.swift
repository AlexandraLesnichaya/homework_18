//
//  AddingSongViewController.swift
//  homework_18
//
//  Created by Александра Лесничая on 3/17/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

class AddingSongViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var artistField: UITextField!
    @IBOutlet weak var songNameField: UITextField!
    @IBOutlet weak var albumField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var genreField: UITextField!
    @IBOutlet weak var albumImageView: UIImageView!

    var addSong: ((Song) -> Void)?

    let pickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
    }

    @IBAction func chooseAlbumImageButtonDidClick(_ sender: Any) {

        let alertController = UIAlertController(title: "Which picture to upload?",
                                                              message: nil,
                                                              preferredStyle: .actionSheet)

        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            #if targetEnvironment(simulator)
            return
            #endif
            self.pickerController.allowsEditing = true
            self.pickerController.sourceType = .camera
            self.present(self.pickerController, animated: true, completion: nil)
        }))

        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
            self.pickerController.allowsEditing = true
            self.pickerController.sourceType = .photoLibrary
            self.present(self.pickerController, animated: true, completion: nil)
        }))

        present(alertController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController,
                                didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            albumImageView.image = image
        }

        pickerController.dismiss(animated: true, completion: nil)
    }

    @IBAction func addSongButtonDidClick(_ sender: Any) {
        let artist = artistField.text!
        let songName = songNameField.text!
        let album = albumField.text!
        let year = yearField.text!
        let genre = genreField.text!
        let albumImage = albumImageView.image

        let songForArray = Song(artist: artist, songName: songName, album: album, year: year, genre: genre, albumImage: UIImageView(image: albumImage!))

        addSong?(songForArray)

        navigationController?.popViewController(animated: true)
    }
}
    

   

