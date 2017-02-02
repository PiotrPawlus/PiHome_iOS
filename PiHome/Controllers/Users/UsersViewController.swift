//
//  UsersViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 06/01/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

private let UserTableViewCellIdentifier = "UserTableViewCellIdentifier"

class UsersViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    private var fetchedResultsController: NSFetchedResultsController<User>!
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUsers()
        setupMenuGestureRecognizer()
        setupFetchedResultsController()
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func menuBarButtonItemTapped(_ sender: UIBarButtonItem) {
        AppContainerViewController.presentMenuViewController()
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    private func fetchUsers() {
        
        SVProgressHUD.show()
        
        NetworkAssistant.shared.users { error in
            
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
            
            if error == nil {
                self.updateView()
            }
        }
    }
    
    private func setupFetchedResultsController() {
        
        let context = NSManagedObjectContext.mr_default()
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        let identifierDescriptor = NSSortDescriptor(key: "identifier", ascending: true)
        
        fetchRequest.predicate = NSPredicate(value: true)
        fetchRequest.sortDescriptors = [identifierDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        try! fetchedResultsController.performFetch()
        tableView.reloadData()
    }
    
    private func updateView() {
        tableView.reloadData()
    }
    
    //MARK: - Overridden
    
    //MARK: - NSFetchedResultsControllerDelegate
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
            
        case .delete:
            
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        case .update:
            
            if let indexPath = indexPath {
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
            
        case .move:
            
            if let indexPath = indexPath, let newIndexPath = newIndexPath {
                
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
        updateView()
    }
    
    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = fetchedResultsController.object(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCellIdentifier, for: indexPath) as! UserTableViewCell
        
        cell.configure(with: user)
        
        return cell
    }
}
