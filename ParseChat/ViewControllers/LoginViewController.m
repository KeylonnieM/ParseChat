//
//  LoginViewController.m
//  ParseChat
//
//  Created by Keylonnie Miller on 7/9/18.
//  Copyright © 2018 Keylonnie Miller. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkTextFieldsAlert {
    //initialize alert
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Problem"
        message:@"Either username or password is empty"
        preferredStyle:(UIAlertControllerStyleAlert)];
    
    // create an OK action button for alert
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * _Nonnull action) {
        // handle response here.
                                                     }];
    // add the OK action to the alert controller
    [alert addAction:okAction];
    
    //Show the view controller
    [self presentViewController:alert animated:YES completion:^{
    }];
}

- (void)errorWithLogin {
    //initialize alert
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Error"
    message:@"There was a problem logging in. Please try again."
    preferredStyle:(UIAlertControllerStyleAlert)];
    
    // create an OK action button for alert
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * _Nonnull action) {
    // handle response here.
                                                     }];
    // add the OK action to the alert controller
    [alert addAction:okAction];
    
    //Show the view controller
    [self presentViewController:alert animated:YES completion:^{
    }];
}

- (void)errorWithSignUp {
    //initialize alert
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sign Up Error"
    message:@"There was a problem signing up. Please try again."
    preferredStyle:(UIAlertControllerStyleAlert)];
    
    // create an OK action button for alert
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * _Nonnull action) {
    // handle response here.
                                                     }];
    // add the OK action to the alert controller
    [alert addAction:okAction];
    
    //Show the view controller
    [self presentViewController:alert animated:YES completion:^{
    }];
}

- (void)registerUser {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameText.text;
    //newUser.email = self.emailField.text;
    newUser.password = self.passwordText.text;
    
    if ([self.usernameText.text isEqualToString: @""] || [self.passwordText.text isEqualToString: @""]) {
        [self checkTextFieldsAlert];
    }
    else {
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            [self errorWithSignUp];
        } else {
            NSLog(@"User registered successfully");
            
            //////// manually segue to logged in view
        }
       }];
    }
}

- (void)loginUser {
    NSString *username = self.usernameText.text;
    NSString *password = self.passwordText.text;
    
    if ([self.usernameText.text isEqualToString:@""] || [self.passwordText.text isEqualToString:@""]) {
        [self checkTextFieldsAlert];
    }
    else {
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
            [self errorWithLogin];
        } else {
            NSLog(@"User logged in successfully");
            
            // display view controller that needs to shown after successful login
        }
      }];
    }
}

- (IBAction)tappedSignUp:(UIButton *)sender {
    [self registerUser];
}

- (IBAction)tappedLogin:(id)sender {
    [self loginUser];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)usernameTextField:(id)sender {
}

- (IBAction)passwordTextField:(UITextField *)sender {
}
@end
