//
//  UIView+TJCommon.swift
//  TJCommonKit
//
//  Created by tao on 2018/10/19.
//  Copyright © 2018年 tao. All rights reserved.
//

import UIKit

extension UIView {
    open func createLabelWith(Frame frame:CGRect ,Text text:String?, TextColor textColor:UIColor?, Font font:CGFloat?, TextAligtment textAlightment:NSTextAlignment?) -> UILabel{
        let label = UILabel(frame: frame)
        if textColor != nil {
            label.textColor = textColor
        }
        if text != nil {
            label.text = text
        }
        if font != nil {
            label.font = UIFont.systemFont(ofSize: font!)
        }
        if textAlightment != nil {
            label.textAlignment = textAlightment!
        }
        return label
    }
    
    open func createButtonWith(Frame frame:CGRect, Type btnType:UIButton.ButtonType, Title title:String?, TitleColor titleColor:UIColor?, Font font:CGFloat?, BackgroundColor backgroundColor:UIColor?, Target target:Any?, Action action:Selector?, TextAligtment textAlightment:NSTextAlignment?) -> UIButton{
        let button = UIButton(type: btnType)
        button.frame  = frame
        if title != nil {
            button.setTitle(title, for: .normal)
        }
        if backgroundColor != nil {
            button.backgroundColor = backgroundColor
        }
        if titleColor != nil {
            button.setTitleColor(titleColor, for: .normal)
        }
        if font != nil {
            button.titleLabel?.font = UIFont.systemFont(ofSize: font!)
        }
        if target != nil && action != nil {
            button.addTarget(target, action: action!, for: .touchUpInside)
        }
        if textAlightment != nil {
            button.titleLabel?.textAlignment = textAlightment!
        }
        return button
    }
    
    open func createTextFieldWith(Frame frame:CGRect, BoardStyle boardStyle:UITextField.BorderStyle, PlaceHolder placeHolder:String?, BackgroundColor backgroundColor:UIColor?, TintColor tintColor:UIColor?, IsPWD isPwd:Bool) -> UITextField{
        let textField = UITextField(frame: frame)
        textField.borderStyle = boardStyle
        if placeHolder != nil {
            textField.placeholder = placeHolder
        }
        if backgroundColor != nil {
            textField.backgroundColor = backgroundColor
        }
        if tintColor != nil {
            textField.tintColor = tintColor
        }
        textField.clearButtonMode = .always
        if isPwd {
            textField.isSecureTextEntry = true
        }
        return textField
    }
    
    open func createImageViewWith(Frame frame:CGRect, ImageName imageName:String, CornarRadius radius:Float) -> UIImageView{
        let imageView = UIImageView(frame:frame)
        imageView.image = UIImage(named:imageName)
        imageView.layer.cornerRadius = CGFloat(radius)
        return imageView
    }
    
    open func createViewWith(Frame frame:CGRect, BackgroundColor backgroundColor:UIColor?) -> UIView{
        let view = UIView(frame:frame)
        if backgroundColor != nil {
            view.backgroundColor = backgroundColor
        }
        return view
    }
}
