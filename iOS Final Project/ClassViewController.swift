//
//  ClassViewController.swift
//  iOS Final Project
//
//  Created by Robert Li on 4/28/18.
//  Copyright © 2018 Robert Li. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    var returnedClasses: [Classes] = []
    
    let class1 = Classes(className: "CS 3410", professor: "A. Bracy", rating: 4.0, classDescription: "MIPS.")
    let class2 = Classes (className: "CS 3110", professor: "M. Clarkson", rating: 3.8, classDescription: "Functional Programming")

    override func viewDidLoad() {
        super.viewDidLoad()
         title = "Search Results"
        
        view.backgroundColor = .white
        
        returnedClasses.append(contentsOf: [class1, class2])
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.bounces = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ClassTableViewCell.self, forCellReuseIdentifier: "classCell")
        
        view.addSubview(tableView)
        
        setUpConstraints()

        // Do any additional setup after loading the view.
    }
    
    func setUpConstraints () {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Classes"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return returnedClasses.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classCell") as! ClassTableViewCell
        let classTitle = returnedClasses[indexPath.row].className
        let classProfessor = returnedClasses[indexPath.row].professor
        let classRating = returnedClasses[indexPath.row].rating
        let classDescription = returnedClasses[indexPath.row].classDescription
        
        
        cell.classLabel.text = classTitle
        cell.classProfessor.text = classProfessor
        cell.classRating.text = String(classRating)
        cell.classDescription.text = classDescription
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//        let navVC = NavViewController()
//        navVC.delegate = self
//        navVC.songAtRow = songList[indexPath.row]
//        navigationController?.pushViewController(navVC, animated: true)
//    }
    
//    func saveButtonPressed(song: String, artist: String, album: String, songAtRow: Song) {
//        songAtRow.songTitle = song
//        songAtRow.artistName = artist
//        songAtRow.albumName = album
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
