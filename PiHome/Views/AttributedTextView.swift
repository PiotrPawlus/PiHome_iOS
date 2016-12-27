//
//  AttributedTextView.swift
//  PiHome
//
//  Created by Piotr Pawluś on 27/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

@IBDesignable class AttributedTextView: UITextView {
    
    @IBOutlet private var textViewHeightLayoutConstraint: NSLayoutConstraint?
    
    private let placeholderLabel = UILabel()
    
    @IBInspectable var cornerRadius: CGFloat = 3 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var placeholder: String = "" {
        
        didSet {
            
            setupPlaceholderLabelIfNeeded()
            textViewDidChange()
        }
    }
    
    override var text: String! {
        
        didSet {
            textViewDidChange()
        }
    }
    
    //MARK: - Class Methods
    
    //MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupPlaceholderLabelIfNeeded()
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidChange), name: .UITextViewTextDidChange, object: nil)
    }
    
    //MARK: - Deinitialization
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Actions
    
    //MARK: - Open
    
    //MARK: - Internal
    
    func textViewDidChange() {
        
        placeholderLabel.isHidden = !text.isEmpty
        textViewHeightLayoutConstraint?.constant = min(contentSize.height, 100)
        
        layoutIfNeeded()
    }
    
    //MARK: - Private
    
    private func setupPlaceholderLabelIfNeeded() {
        
        placeholderLabel.removeFromSuperview()
        placeholderLabel.frame = CGRect(x: 8, y: 8, width: frame.size.width, height: 15)
        placeholderLabel.text = placeholder
        placeholderLabel.font = UIFont.helveticaRegular(withSize: 17)
        placeholderLabel.textColor = UIColor.frenchGray
        
        insertSubview(placeholderLabel, at: 0)
    }
    
    //MARK: - Overridden
}
