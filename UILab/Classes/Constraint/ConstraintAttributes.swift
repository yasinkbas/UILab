//
//  ConstraintAttributes.swift
//  FBSnapshotTestCase
//
//  Created by Yasin Akbaş on 11.02.2020.
//

import Foundation

extension UIView {
    public var top:             YAxis       { return self.topAnchor }
    public var left:            XAxis       { return self.leftAnchor }
    public var leading:         XAxis       { return self.leadingAnchor }
    public var trailing:        XAxis       { return self.trailingAnchor }
    public var bottom:          YAxis       { return self.bottomAnchor }
    public var right:           XAxis       { return self.rightAnchor }
    public var width:           Dimension   { return self.widthAnchor}
    public var height:          Dimension   { return self.heightAnchor }
    
    public var superCenterY:    YAxis?      { return superview?.centerYAnchor }
    public var superCenterX:    XAxis?      { return superview!.centerXAnchor }
    public var superTop:        YAxis?      { return superview?.top }
    public var superLeft:       XAxis?      { return superview?.left }
    public var superLeading:    XAxis?      { return superview?.leading }
    public var superBottom:     YAxis?      { return superview?.bottomAnchor }
    public var superRight:      XAxis?      { return superview?.rightAnchor }
    public var superTrailing:   XAxis?      { return superview?.trailingAnchor }
}
