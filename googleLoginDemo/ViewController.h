//
//  ViewController.h
//  googleLoginDemo
//
//  Created by James on 2014/7/14.
//  Copyright (c) 2014年 coretronic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GooglePlus/GooglePlus.h>
@class GPPSignInButton;
@interface ViewController : UIViewController<GPPSignInDelegate>
@property (retain, nonatomic) IBOutlet GPPSignInButton *signInButton;

@property (retain, nonatomic) IBOutlet UIButton *signOutButton;

- (IBAction)signOutBtn:(id)sender;

@end
