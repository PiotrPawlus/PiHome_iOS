//
//  DevicesViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 27/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

private let DeviceTableViewCellIdentifier = "DeviceTableViewCellIdentifier"
private let DetailDeviceSegueIdentifier = "DetailDeviceSegueIdentifier"

class DevicesViewController: UIViewController, NSFetchedResultsControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var createDeviceBarButtonItem: AttributedBarButtonItem!
    
    private var fetchedResultsController: NSFetchedResultsController<Device>!
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        fetchDevices()
        setupFetchedResultsController()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        createDeviceBarButtonItem.isHidden = !Settings.currentUser!.administrator
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func menuBarButtonItemTapped(_ sender: UIBarButtonItem ) {
        AppContainerViewController.presentMenuViewController()
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    private func delete(device: Device) {
        
        SVProgressHUD.show()
        
        NetworkAssistant.shared.remove(device: device) { error in
            
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
            
            if error == nil {
                self.updateView()
            }
        }
    }
    
    private func fetchDevices() {
        
        SVProgressHUD.show()
        
        NetworkAssistant.shared.devices { error in
            
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
            
            if error == nil {
                self.updateView()
            }
        }
    }
    
    private func setupFetchedResultsController() {
        
        let context = NSManagedObjectContext.mr_default()
        let fetchRequest = NSFetchRequest<Device>(entityName: "Device")
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let device = fetchedResultsController.object(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: DeviceTableViewCellIdentifier, for: indexPath) as! DeviceTableViewCell
        
        cell.configure(with: device)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        if let user = Settings.currentUser {
            return user.administrator
        }
        
        return false
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
            delete(device: fetchedResultsController.object(at: indexPath))
        }
    }
}
