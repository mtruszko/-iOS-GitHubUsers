//
//  UsersListViewController.swift
//  GitHubExp
//
//  Created by Marek on 29/10/2018.
//  Copyright © 2018 MTruszko. All rights reserved.
//

import UIKit
import Moviper
import RxSwift
import RxCocoa

class UsersListViewController: BaseRxViewController, UsersListContractView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let disposeBag = DisposeBag()
    
    let refreshControl = UIRefreshControl()
    lazy var pullToRefreshObservable: Observable<()> = {
        return self.refreshControl.rx
            .controlEvent(.valueChanged)
            .map { [weak self] in
                self?.refreshControl.isRefreshing
            }
            .filter { $0 == true }
            .map { _ in }
    }()
    
    var users: Variable<[GitHubUser]> = Variable<[GitHubUser]>([])
    var selectedUser: PublishSubject<GitHubUser> = PublishSubject<GitHubUser>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GitHubUserTableViewCell.registerCellIn(tableView: tableView)
        
        tableView.refreshControl = refreshControl
        
        users
            .asObservable()
            .bind(to: tableView.rx.items) { [weak self] in
                self?.getCellFor($2, tableView: self?.tableView) ?? UITableViewCell()
        }
        .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                if let cell = self?.tableView.cellForRow(at: indexPath) as? GitHubUserTableViewCell,
                    let gitHubUser = cell.gitHubUser {
                    self?.selectedUser.onNext(gitHubUser)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func showLoading() {
        indicator.isHidden = false
    }
    
    func show(githubUsers: [GitHubUser]) {
        users.value = githubUsers
        hideLoading()
    }
    
    func show(error: Error) {
        let alert = UIAlertController(title: "Błąd",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert,
                animated: true) {
                    self.hideLoading()
        }
    }
    
    private func hideLoading() {
        refreshControl.endRefreshing()
        indicator.isHidden = true
    }
    
    func getCellFor(_ gitHubUser: GitHubUser, tableView: UITableView?) -> UITableViewCell? {
        let cell = tableView?
            .dequeueReusableCell(withIdentifier: GitHubUserTableViewCell.kCellIdentifier) as? GitHubUserTableViewCell
        cell?.bind(gitHubUser)
        return cell
    }
    
    override func createPresenters() -> [ViperRxPresenter] {
        return [UsersListPresenter<UsersListInteractor, UsersListRouting, UsersListViewController>()]
    }
}
