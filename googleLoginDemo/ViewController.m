//
//  ViewController.m
//  googleLoginDemo
//
//  Created by James on 2014/7/14.
//  Copyright (c) 2014年 coretronic. All rights reserved.
//

#import "ViewController.h"
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <GooglePlus/GooglePlus.h>

@interface ViewController ()
{
    NSString *kClientId;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // **************************************************
    // *********here enter your client Id ***************
    // **please go to google console enable google+ api**
    // **************************************************
    kClientId = @"your client ID";
    
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    // You previously set kClientId in the "Initialize the Google+ client" step
    signIn.clientID = kClientId;
    signIn.scopes = [NSArray arrayWithObjects:
                     kGTLAuthScopePlusLogin, // defined in GTLPlusConstants.h
                     nil];
    signIn.delegate = self;
    
//    [signIn authenticate];
    [signIn trySilentAuthentication];
    [self refreshInterfaceBasedOnSignIn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error
{
    NSLog(@"Received error %@ and auth object %@",error, auth);
    if (error) {
        // Do some error handling here.
    } else {
        [self refreshInterfaceBasedOnSignIn];
    }
}

-(void)refreshInterfaceBasedOnSignIn
{
    if ([[GPPSignIn sharedInstance] authentication]) {
        NSLog(@"authentication YES");
        // The user is signed in.
        self.signInButton.hidden = YES;
        // Perform other actions here, such as showing a sign-out button
        self.signOutButton.hidden = NO;
        
    } else {
        NSLog(@"authentication NO");
        self.signInButton.hidden = NO;
        // Perform other actions here
        self.signOutButton.hidden = YES;
    }
}


- (void)signOut {
    [[GPPSignIn sharedInstance] signOut];
}

- (void)disconnect {
    [[GPPSignIn sharedInstance] disconnect];
}

- (void)didDisconnectWithError:(NSError *)error {
    if (error) {
        NSLog(@"Received error %@", error);
    } else {
        // The user is signed out and disconnected.
        // Clean up user data as specified by the Google+ terms.
    }
}

- (IBAction)signOutBtn:(id)sender {
    [self signOut];
    [self refreshInterfaceBasedOnSignIn];

}


@end
