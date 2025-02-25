//
//  SwitchProtocal.swift
//  OnlySwitch
//
//  Created by Jacklandrin on 2021/11/30.
//

import Foundation
import Combine


/// protocol for every switch
protocol SwitchProvider:AnyObject {
    var type:SwitchType {get set}
    var delegate:SwitchDelegate? {get set}
    func currentStatus() -> Bool
    func currentInfo() -> String
    func operationSwitch(isOn:Bool) async -> Bool
    func isVisable() -> Bool
}


protocol SwitchDelegate:AnyObject {
    
    /// switch need to update itself for UI
    func shouldRefreshIfNeed(aSwitch:SwitchProvider)
}

/// for async operations
extension SwitchProvider {
    func currentStatusAsync() async -> Bool {
        return currentStatus()
    }
    
    func currentInfoAsync() async -> String {
        return currentInfo()
    }
}
