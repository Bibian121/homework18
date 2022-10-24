//
//  ViewController.swift
//  15MDz
//
//  Created by Matilda Davydov on 06.07.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let cellLabelTwoAndImage = "cellLabelTwoAndImage"
    let service = Service()
    let cellas = CellLabelTwoAndImage()
    private var timer: Timer?
    
    var searchRespone: SearchRespone? = nil
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
   let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CellLabelTwoAndImage.self, forCellReuseIdentifier: "cellLabelTwoAndImage")
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
        setupConstraints()
        setupSearchBar()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints{ make in
            make.leading.equalTo(view.snp.leading).inset(0)
            make.top.equalTo(view.snp.top).inset(90)
            make.right.equalTo(view.snp.right).inset(0)
            make.bottom.equalTo(view.snp.bottom).inset(0)
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchRespone?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellLabelTwoAndImage) as? CellLabelTwoAndImage
        let film = searchRespone?.results[indexPath.row]
        cell?.configure(film!)
        guard let apiURL = URL(string: (searchRespone?.results[indexPath.row].image!)!) else { return cell! }
            URLSession.shared.dataTask(with: apiURL) { data, _, _ in
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    cell?.image.image = UIImage(data: data)
                }
            } .resume()
        return cell ?? UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let urlString = "https://imdb-api.com/en/API/Search/k_il0e4iky/star\(searchText)"
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.service.request(urlString: urlString) { [weak self] (result) in
                switch result {
                case .success(let searchRespone):
                    self?.searchRespone = searchRespone
                    self?.tableView.reloadData()
                case .failure(let error):
                    print( error )
                }
            }
        })
    }
}


