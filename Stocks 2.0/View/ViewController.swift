//
//  ViewController.swift
//  Stocks 2.0
//
//  Created by Алексей Мотин on 06.10.2021.
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let viewModel: StocksViewModel
    let tableView = UITableView()
    
    init(viewModel: StocksViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAddress()
        bindViewModelEvent()
    }
    
    private func fetchAddress() {
        viewModel.fetchAddress()
    }
    
    private func bindViewModelEvent() {
        viewModel.onFetchDataSucceed = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.onFetchDataFailure = { error in
        }
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.rowHeight = 120
//        tableView.register(PaymentCell.self, forCellReuseIdentifier: String(describing: PaymentCell.self))
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StockCell.self), for: indexPath) as? StockCell else {
            return .init()
        }
        let stock = viewModel.stocks[indexPath.row]
        cell.bindViewWith(
            viewModel: StockCellVM(
            stockModel: stock
            )
        )
        return cell
    }
}
