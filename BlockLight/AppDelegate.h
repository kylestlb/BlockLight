//
//  AppDelegate.h
//  BlockLight
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "userData.h"
#import "Production.h" 
#import "homeMasterViewController.h"
#import "homeDetailViewController.h"
#import "DummyMainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
  UINavigationController* _navController;
  UINavigationController* _navControllerEdit;
  DummyMainViewController* _dummymainViewController;
	MainViewController* _mainViewController;
  userData* _userData;

}

-(void)toggleSplitViewWithProduction:(Production*)production andGroup:(Group*)group;
-(void)toggleEditViewWithGroup:(Group*)group;
-(void)toggleSandboxView;

@property (strong) UINavigationController* navController;
@property (strong, nonatomic) UIWindow *window;
@property (strong) UISplitViewController *splitViewController;
@property (strong) userData* userData; 


@end
