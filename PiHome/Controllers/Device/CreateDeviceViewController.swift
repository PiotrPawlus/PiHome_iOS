//
//  CreateDeviceViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 03/02/2017.
//  Copyright © 2017 Piotr Pawluś. All rights reserved.
//

private let GPIOPins = [
    
    "SDA": 2,
    "SCL": 3,
    "GPIO04": 4,
    "GPIO17": 17,
    "GPIO27": 27,
    "GPIO22": 22,
    "GPIO10": 10,
    "GPIO09": 9,
    "GPIO11": 11,
    "GPIO05": 5,
    "GPIO06": 6,
    "GPIO13": 13,
    "GPIO19": 19,
    "GPIO26": 26,
    "GPIO14": 14,
    "GPIO15": 15,
    "GPIO18": 18,
    "GPIO23": 23,
    "GPIO24": 24,
    "GPIO25": 25,
    "GPIO08": 8,
    "GPIO07": 7,
    "GPIO12": 12,
    "GPIO16": 16,
    "GPIO20": 20,
    "GPIO21": 21
]

class CreateDeviceViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet private var bottomLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet private var deviceNameTextField: UITextField!
    @IBOutlet private var deviceDescriptionTextView: UITextView!
    @IBOutlet private var pinsPickerView: UIPickerView!
    
    private let GPIOPinsKeys = Array(GPIOPins.keys)
    
    private var selectedPin: Int?
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        
        selectedPin = GPIOPins[GPIOPinsKeys[0]]!
    }
    
    //MARK: - Deinitialization
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Actions
    
    @IBAction func addNewDevice(_ sender: AttributedButton) {
    
        do {
            try createNewDevice()
        } catch {
            UIAlertController.show(from: error as! Error.Name)
        }
    }
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardHeight = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height {
            updateConstraints(with: keyboardHeight)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        updateConstraints()
    }
    
    //MARK: - Private
    
    private func createNewDevice() throws {
        
        guard !deviceNameTextField.text!.isEmpty, let name = deviceNameTextField.text else {
            throw Error.Name.cannotBeEmpty("Device name")
        }
        
        guard let pin = selectedPin else {
            throw Error.Name.cannotBeEmpty("Device pin")
        }
        
        let parameters: [AnyHashable: Any] = [
            
            "name": name,
            "description": deviceDescriptionTextView.text ?? "",
            "pin": pin
        ]
        
        SVProgressHUD.show()
        
        NetworkAssistant.shared.createDevice(with: parameters) { error in
        
            SVProgressHUD.dismiss()
            UIAlertController.show(from: error)
            
            if error == nil {
                _ = self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    private func updateConstraints(with height: CGFloat = 0) {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            
            self.bottomLayoutConstraint.constant = max(height, 0)
            self.view.layoutIfNeeded()
        })
    }
    
    //MARK: - Overridden
    
    //MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return GPIOPins.count
    }
    
    //MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return GPIOPinsKeys[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPin = GPIOPins[GPIOPinsKeys[row]]
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}
