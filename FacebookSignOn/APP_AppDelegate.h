//
//  APP_AppDelegate.h
//  FacebookSignOn
//
//  Created by Hackintosh 01 on 3/17/14.
//  Copyright (c) 2014 Hackintosh 01. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface APP_AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) FBSession *session;

@end
