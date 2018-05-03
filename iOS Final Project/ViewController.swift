//
//  ViewController.swift
//  test
//
//  Created by Robert Li on 5/2/18.
//  Copyright © 2018 Robert Li. All rights reserved.
//

import UIKit
import DynamicButton

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SaveButtonDelegate {
    
    var dynamicButton: DynamicButton = DynamicButton ()
    var classList:[String] = []
    
    
    var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "CourseRecommender"
        view.backgroundColor = .white
        
        
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: "Background-2.jpg")
//        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
//        self.view.insertSubview(backgroundImage, at: 0)
//        
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background-2.jpg")!)
        
        
        
        classList.append("CS 3410")
        classList.append ("CS 3110")
        classList.append ("CS 4300")
        
        dynamicButton.setStyle(.arrowRight, animated: true)
        dynamicButton.lineWidth           = 3
        dynamicButton.strokeColor         = .red
        dynamicButton.highlightStokeColor = .gray
        dynamicButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        dynamicButton.translatesAutoresizingMaskIntoConstraints = false
        
        let addButton = UIBarButtonItem(title: "Add", style:.plain, target: self, action: #selector(addButtonPressed))
        self.navigationItem.rightBarButtonItem = addButton
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.bounces = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SearchClassTableViewCell.self, forCellReuseIdentifier: "classSearchCell")
//        tableView.backgroundColor = UIColor.clear
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        
        view.addSubview(dynamicButton)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupConstraints () {
        
        NSLayoutConstraint.activate([
            dynamicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dynamicButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            dynamicButton.heightAnchor.constraint(equalToConstant:44)
            ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: dynamicButton.topAnchor, constant: -16)
            ])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func addButtonPressed (sender:UIButton) {
        let navVC = NavViewController()
        navVC.delegate = self
        navigationController?.pushViewController(navVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Taken Classes at Cornell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classSearchCell") as! SearchClassTableViewCell
        let classTitle = classList[indexPath.row]
       
        cell.classLabel.text = classTitle
//        cell.contentView.backgroundColor = UIColor.clear
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         var cellColors = [UIColor(red:0.95, green:0.50, blue:0.27, alpha:1.0),UIColor(red:0.58, green:0.13, blue:0.59, alpha:1.0),UIColor(red:0.34, green:0.98, blue:0.73, alpha:1.0),UIColor(red:0.02, green:0.80, blue:0.91, alpha:1.0)]
        cell.contentView.backgroundColor = cellColors[indexPath.row % cellColors.count]
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//        let navVC = NavViewController()
//        navVC.delegate = self
//        navVC.songAtRow = songList[indexPath.row]
//        navigationController?.pushViewController(navVC, animated: true)
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func saveButtonPressed(withName name: String) {
        classList.append(name)
    }
    
    @objc func searchButtonPressed (sender:UIButton) {
        let navVC = ClassViewController()
        navigationController?.pushViewController(navVC, animated: true)
    }
    
    
}

    

