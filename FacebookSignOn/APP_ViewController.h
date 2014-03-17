//
//  APP_ViewController.h
//  FacebookSignOn
//
//  Created by Hackintosh 01 on 3/17/14.
//  Copyright (c) 2014 Hackintosh 01. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface APP_ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UITextView *twStatus;

- (IBAction)clickLogin:(id)sender;

@end
