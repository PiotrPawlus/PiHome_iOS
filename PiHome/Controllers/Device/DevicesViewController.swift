//
//  DevicesViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 27/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

private let DeviceButtonTableViewCellIdentifier = "DeviceButtonTableViewCellIdentifier"
private let DeviceSwitchTableViewCellIdentifier = "DeviceSwitchTableViewCellIdentifier"
private let DetailDeviceSegueIdentifier = "DetailDeviceSegueIdentifier"

class DevicesViewController: UIViewController, NSFetchedResultsControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var createDeviceBarButtonItem: AttributedBarButtonItem!
    
    private var fetchedResultsController: NSFetchedResultsController<Device>!
    private var refreshControl = UIRefreshControl()

    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        fetchDevices()
        setupFetchedResultsController()
        
        refreshControl.attributedTitle = NSAttributedString(string: "pull_to_refresh".localized)
        refreshControl.addTarget(self, action: #selector(refreshDevices), for: .valueChanged)
        
        tableView.addSubview(refreshControl)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        createDeviceBarButtonItem.isHidden = !Settings.shared.currentUser!.administrator
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    @IBAction func menuBarButtonItemTapped(_ sender: UIBarButtonItem ) {
        AppContainerViewController.shared.presentMenuViewController()
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func refreshDevices() {
        
        fetchDevices {
            self.refreshControl.endRefreshing()
        }
    }
    
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
    
    private func fetchDevices(completion: (()->())? = nil) {
        
        SVProgressHUD.show()
        
        NetworkAssistant.shared.devices { error in
            
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
            
            if error == nil {
                
                self.updateView()
                completion?()
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
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let device = fetchedResultsController.object(at: indexPath)
        
        if device.type == "button" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DeviceButtonTableViewCellIdentifier, for: indexPath) as! DeviceButtonTableViewCell
            cell.configure(with: device)
            
            return cell
            
        } else if device.type == "switch" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DeviceSwitchTableViewCellIdentifier, for: indexPath) as! DeviceSwitchTableViewCell
            cell.configure(with: device)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        if let user = Settings.shared.currentUser {
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
