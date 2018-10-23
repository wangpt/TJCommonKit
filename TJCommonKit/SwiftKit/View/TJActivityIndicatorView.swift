//
//  TJActivityIndicatorView.swift
//  YingJi
//
//  Created by tao on 2018/10/23.
//  Copyright © 2018 wangpt. All rights reserved.
//

import UIKit
@objc(TJActivityIndicatorView)
class TJActivityIndicatorView: UIView {

    public static let sharedInstance = TJActivityIndicatorView()
    public var messageSpacing: CGFloat = 10
    public var animating: Bool { return isAnimating }
    
    fileprivate let waitingToStartGroup = DispatchGroup()
    private(set) public var isAnimating: Bool = false
    let tjrestorationIdentifier : String = "TJActivityIndicatorViewContainer"
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "请稍等..."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 60, height: 60))
        activityView.style = .whiteLarge
        activityView.color = .gray
        activityView.translatesAutoresizingMaskIntoConstraints = false
        return activityView
    }()
    
    
    //MARK: - public property

    public final func setMessage(_ message: String?) {
        waitingToStartGroup.notify(queue: DispatchQueue.main) {
            self.messageLabel.text = message
        }
    }
    
    public final func setTextColor(_ color: UIColor?) {
        waitingToStartGroup.notify(queue: DispatchQueue.main) {
            self.messageLabel.textColor = color
        }
    }
    
    public final func setIndicatorColor(_ color: UIColor?) {
        waitingToStartGroup.notify(queue: DispatchQueue.main) {
            self.activityIndicatorView.color = color
        }
    }
    
    /**
     Start animating.
     */
    public final func startAnimating(_ view:UIView? , message:String?) {
        isAnimating = true
        let containerView = UIView(frame: CGRect.zero)
        containerView.backgroundColor = UIColor.white
        containerView.restorationIdentifier = tjrestorationIdentifier
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        if view == nil {
            containerView.frame = UIScreen.main.bounds;
            guard let keyWindow = UIApplication.shared.keyWindow else { return }
            keyWindow.addSubview(containerView)
            let leadingConstraint = NSLayoutConstraint(item: keyWindow, attribute: .leading, relatedBy: .equal, toItem: containerView, attribute: .leading, multiplier: 1, constant: 0)
            let trailingConstraint = NSLayoutConstraint(item: keyWindow, attribute: .trailing, relatedBy: .equal, toItem: containerView, attribute: .trailing, multiplier: 1, constant: 0)
            let topConstraint = NSLayoutConstraint(item: keyWindow, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: keyWindow, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0)
            keyWindow.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        }else{
            containerView.frame = view!.frame;
            let keyWindow = view;
            view!.addSubview(containerView)
            let leadingConstraint = NSLayoutConstraint(item: keyWindow!, attribute: .leading, relatedBy: .equal, toItem: containerView, attribute: .leading, multiplier: 1, constant: 0)
            let trailingConstraint = NSLayoutConstraint(item: keyWindow!, attribute: .trailing, relatedBy: .equal, toItem: containerView, attribute: .trailing, multiplier: 1, constant: 0)
            let topConstraint = NSLayoutConstraint(item: keyWindow!, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: keyWindow!, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0)
            keyWindow!.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        }
        containerView.addSubview(activityIndicatorView)

        ({
            let xConstraint = NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: activityIndicatorView, attribute: .centerX, multiplier: 1, constant: 0)
            let yConstraint = NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: activityIndicatorView, attribute: .centerY, multiplier: 1, constant: 0)
            
            containerView.addConstraints([xConstraint, yConstraint])
            }())

        containerView.addSubview(messageLabel)
        messageLabel.isHidden = true

        ({
            let leadingConstraint = NSLayoutConstraint(item: containerView, attribute: .leading, relatedBy: .equal, toItem: messageLabel, attribute: .leading, multiplier: 1, constant: -8)
            let trailingConstraint = NSLayoutConstraint(item: containerView, attribute: .trailing, relatedBy: .equal, toItem: messageLabel, attribute: .trailing, multiplier: 1, constant: 8)
            
            containerView.addConstraints([leadingConstraint, trailingConstraint])
            }())
        
        ({
            let spacingConstraint = NSLayoutConstraint(item: messageLabel, attribute: .top, relatedBy: .equal, toItem: activityIndicatorView, attribute: .bottom, multiplier: 1, constant: messageSpacing)
            
            containerView.addConstraint(spacingConstraint)
            }())
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1)) {
            self.activityIndicatorView.startAnimating()
            self.messageLabel.isHidden = false
        }
        waitingToStartGroup.enter()
    }
    
    /**
     Stop animating.
     */
    public final func stopAnimating(_ view:UIView?) {
        if view == nil {
            for window in UIApplication.shared.windows {
                for item in window.subviews
                    where item.restorationIdentifier == tjrestorationIdentifier {
                        item.removeFromSuperview()
                }
            }
        }else{
            for item in view?.subviews ?? [UIView()]
                where item.restorationIdentifier == tjrestorationIdentifier {
                    item.removeFromSuperview()
            }
            
        }
        isAnimating = false
        waitingToStartGroup.leave()
    }

}
