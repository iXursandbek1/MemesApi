//
//  ViewController.swift
//  MemesApi
//
//  Created by Xursandbek Qambaraliyev on 02/03/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let textLabel = UILabel()
    
    private let mainTableView = UITableView()
    
    private let vm = MemesViewModel()
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        vm.getMemes { data in
            self.count = data.data.memes.count
        } onError: { err in
            self.textLabel.text = err
        }
    }
}


extension ViewController {
    private func setupView() {
        
       
        
        view.addSubview(mainTableView)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.backgroundColor = .orange
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        vm.getMemes { data in
            cell.textLabel?.text = "\(data.data.memes[indexPath.row].name)"
        } onError: { err in
            self.textLabel.text = err
        }
        
        return cell
    }
    
    
}
