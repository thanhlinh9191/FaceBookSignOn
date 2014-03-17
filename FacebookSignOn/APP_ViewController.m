//
//  APP_ViewController.m
//  FacebookSignOn
//
//  Created by Hackintosh 01 on 3/17/14.
//  Copyright (c) 2014 Hackintosh 01. All rights reserved.
//

#import "APP_ViewController.h"
#import "APP_AppDelegate.h"

@interface APP_ViewController ()

@end

@implementation APP_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self updateView];
        
        APP_AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        if (!appDelegate.session.isOpen) {
            // tao doi tuong session moi
            appDelegate.session = [[FBSession alloc] init];
           
            if (appDelegate.session.state == FBSessionStateCreatedTokenLoaded)
            {
                // even though we had a cached token, we need to login to make the session usable
                [appDelegate.session openWithCompletionHandler:^(FBSession *session,
                                                                 FBSessionState status,
                                                                 NSError *error) {
                    // we recurse here, in order to update buttons and labels
                    [self updateView];
                }];
            }
        }
}
-(void) updateView {
    // get the app delegate, so that we can reference the session property
    APP_AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    if (appDelegate.session.isOpen) {
        // valid account UI is shown whenever the session is open
        [self.btnLogin setTitle:@"Log out FaceBook" forState:UIControlStateNormal];
        [self.twStatus setText:[NSString stringWithFormat:@"https://graph.facebook.com/me/friends?access_token=%@",
                                      appDelegate.session.accessTokenData.accessToken]];
    } else {
        // login-needed account UI is shown whenever the session is closed
        [self.btnLogin setTitle:@"Log in With FaceBook" forState:UIControlStateNormal];
        [self.twStatus setText:@"Login to create a link to fetch account data"];
    }

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickLogin:(id)sender {
    // get delegate cua app de tiep can doi tuong session
    APP_AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    // button la flip-flop, open-close
    if (appDelegate.session.isOpen) {
        //xoa session
        [appDelegate.session closeAndClearTokenInformation];
        
    } else {
        if (appDelegate.session.state != FBSessionStateCreated) {
            // tao session moi
            appDelegate.session = [[FBSession alloc] init];
        }
        
        //  moi UI login
        [appDelegate.session openWithCompletionHandler:^(FBSession *session,
                                                         FBSessionState status,
                                                         NSError *error) {
            // cap nhat lại view
            [self updateView];
        }];
    }

}
@end
