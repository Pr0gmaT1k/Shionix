//
//  LoaderView.swift
//  COMMON-UTILS
//
//  Copyright (C) 2019 by Pr0g
//  Permission to use, copy, modify, and/or distribute this software for any
//  purpose with or without fee is hereby granted.
//  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
//  REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
//  FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
//  INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
//  OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
//  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
//  THIS SOFTWARE.

import UIKit

/// A simple loader view. Integrated in UIViewController with showNPLoader: & hideNPLoader:
final class LoaderView: UIView {
    override init(frame: CGRect) {
        let center = CGPoint(x: frame.size.width  / 2,
        y: frame.size.height / 2)
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(origin: center, size: CGSize(width: 30, height: 30)))
        activityIndicator.style = .large
        activityIndicator.color = .white
        super.init(frame: frame)
        self.backgroundColor = UIColor.systemGray.withAlphaComponent(0.5)
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        self.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// Fade in
    func show() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 1.0
        })
    }
    
    /// Fade out
    func hide() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0.0
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
}

// MARK:- Add default management to UIVC
extension UIViewController {
    
    /// Fade in
    func showLoader() {
        let loader = LoaderView(frame: self.view.frame)
        self.view.addSubview(loader)
        loader.show()
    }
    
    /// Fade out
    func hideLoader() {
        let loaderViews = self.view.subviews.filter { $0 is LoaderView }
        _ = loaderViews.map { ($0 as? LoaderView)?.hide() }
    }
}
