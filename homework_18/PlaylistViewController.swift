//
//  ViewController.swift
//  homework_18
//
//  Created by Александра Лесничая on 3/17/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!

    var songInfo: [Song] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    @IBAction func addButtonDidClick(_ sender: Any) {
        guard let addingSongViewController = AddingSongViewController.createFromMainStoryboard() else { return }
        addingSongViewController.addSong = { songForArray in
            self.songInfo.append(songForArray)
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(addingSongViewController, animated: true)
    }
    
    @IBAction func editButtonDidClick(_ sender: Any) {
        var isEditing = tableView.isEditing
        isEditing.toggle()
        tableView.setEditing(isEditing, animated: true)
        if isEditing {
            editButton.title = "Done"
        } else {
            editButton.title = "Edit"
        }
    }
}

extension PlaylistViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistTableViewCell") as! PlaylistTableViewCell
        cell.accessoryType = .detailButton
        let imageAndSongName = songInfo[indexPath.row]
        cell.albumImage.image = imageAndSongName.albumImage.image
        cell.songName.text = imageAndSongName.songName
        cell.artist.text = imageAndSongName.artist
        return cell
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        songInfo.remove(at: indexPath.row)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            self.tableView.deleteRows(at: [indexPath], with: .right)
        }
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedSong = songInfo[sourceIndexPath.row]
        songInfo.remove(at: sourceIndexPath.row)
        songInfo.insert(movedSong, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let songForInfo = songInfo[indexPath.row]
//        guard let infoViewController = InfoViewController.createFromMainStoryboard() else { return }
//        navigationController?.pushViewController(infoViewController, animated: true)
        let infoViewController = InfoViewController.createInfoViewController(song: songForInfo)
        infoViewController.modalPresentationStyle = .fullScreen
        self.present(infoViewController, animated: true, completion: nil)
    }
}
