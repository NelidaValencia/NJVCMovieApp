//
//  NJVCListOfMovieView.swift
//  NJVCMovieApp
//
//  Created by Slacker on 13/07/23.
//



import Foundation
import UIKit

class NJVCListOfMovieView : UIViewController {
    /// 3. Llamamos a la funcion onViewAppear del presenter desde View
    private let presenter: NJVCListOfMoviePresentable
    /// 7. creamos TableView
    private var moviesTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(NJVCMovieCellView.self, forCellReuseIdentifier: "NJVCMovieCellView")
        return tableView
    }()
    
    init(presenter : NJVCListOfMoviePresentable){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        setUpTableView()
        presenter.onViewAppear()
    }
    
    private func setUpTableView() {
        view.addSubview(moviesTableView)
        NSLayoutConstraint.activate([
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
}
 /// 4. implementamos protocol NJVCListOfMovieUI y obtener las movies
extension NJVCListOfMovieView : NJVCListOfMovieUI{
    func update(movies: [ViewModel]) {
        print("Datos recibidos \(movies)")
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
}

extension NJVCListOfMovieView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NJVCMovieCellView", for: indexPath) as! NJVCMovieCellView
        //cell.backgroundColor = .red
        let model = presenter.viewModels[indexPath.row]
        cell.configure(model: model)
        
        return cell
    }
}

extension NJVCListOfMovieView : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}
