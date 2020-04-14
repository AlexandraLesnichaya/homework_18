//
//  InfoViewController.swift
//  homework_18
//
//  Created by Александра Лесничая on 3/17/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var infoAlbumImage: UIImageView!
    @IBOutlet weak var infoAlbumName: UILabel!
    @IBOutlet weak var infoArtist: UILabel!
    @IBOutlet weak var infoGenreAndYear: UILabel!

    var song: Song?

    static func createInfoViewController(song: Song) -> InfoViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let infoViewController = storyboard.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
        infoViewController.song = song
        return infoViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let song = song {
            infoAlbumImage.image = song.albumImage.image
            infoAlbumName.text = song.album
            infoArtist.text = song.artist
            infoGenreAndYear.text = "\(song.genre) \u{2022} \(song.year)"
        } else {
            infoGenreAndYear.text = "Error!"
            infoArtist.text = "Error!"
            infoGenreAndYear.text = "Error!"
        }
    }

    @IBAction func backButtonDidClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
