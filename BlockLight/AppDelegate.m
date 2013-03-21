//
//  AppDelegate.m
//  BlockLight
//
//  Created by Barrett Ames on 7/26/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

homeMasterViewController* _masterViewController;
homeDetailViewController* _detailViewController;

@synthesize navController = _navController;
@synthesize userData = _userData; 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  // Override point for customization after application launch.
  UIImage* bg = [UIImage imageNamed:@"bg-main"];
  self.window.backgroundColor = [UIColor colorWithPatternImage:bg];
  
	// setup data control
	_userData = [[ userData alloc] init];

	//load user data - **hard coded right now**
    //got from AddGroupViewController
    Group* group1 = [[Group alloc] init];
    group1.name = @"Group 1";
    group1.type = @"Some type";
    group1.uniqueID = _userData.nextUniqueGroupID;
    //got from AddPerformanceViewController
    Production* prod1_1 = [[Production alloc] init];
    prod1_1.name = @"Group 1's first production";
    prod1_1.date = @"--/--/--";
    prod1_1.location = @"...";
    prod1_1.stageManager = @"...";
    //got from Add MemberViewController
    Performer* performer1_1 = [[Performer alloc] init];
    performer1_1.name = @"Somebody";
    performer1_1.voice = @"SOPRANO"; //there is an enum for this in defaults.h, not sure why it isn't used
    performer1_1.role = @"---";
    performer1_1.gender = @"FEMALE"; //there is an enum for this in defaults.h, not sure why it isn't used
    performer1_1.stagePresence = @"---";
    performer1_1.notes = @"---";
    performer1_1.phoneNumber = @"000000000";
    performer1_1.email = @"----";
    performer1_1.height = @"---"; //there is an enum in defaults.h, don't understand how it can be used 
    performer1_1.uniqueID = _userData.nextUniquePerformerID;
    
    [group1.performers addObject:performer1_1];
    [group1.productions addObject:prod1_1];

    [_userData.groups addObject:group1];
    
    Group* group2 = [[Group alloc] init];
    group2.name = @"Group 2";
    group2.type = @"Some type";
    group2.uniqueID = _userData.nextUniqueGroupID;
    [_userData.groups addObject:group2];  
  
  //Split View Controller setup below 
  
  _detailViewController = [[homeDetailViewController alloc] init];
  _masterViewController = [[homeMasterViewController alloc] init];
  
  _navController = [[UINavigationController alloc] initWithRootViewController:_detailViewController];
  [_navController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
  
  _splitViewController = [[UISplitViewController alloc] init];
  _splitViewController.delegate =  _detailViewController;
  _splitViewController.viewControllers = @[_masterViewController, _navController];
  _splitViewController.view.backgroundColor = [UIColor clearColor];

  self.window.rootViewController = self.splitViewController;
  
  
  
  [self.window makeKeyAndVisible];
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

-(void)toggleSplitViewWithProduction:(Production*)production andGroup:(Group*)group{
  
  [self.splitViewController.view removeFromSuperview];
  
  // Add the view controller's view to the window and display.
  _mainViewController = [[MainViewController alloc] initWithProduction:production andGroup:group] ;
  _mainViewController.view.frame = self.window.bounds;
  
  //Nav Controller setup
  _navControllerEdit = [[UINavigationController alloc] initWithRootViewController:_mainViewController];
  [_navControllerEdit.navigationBar setTintColor:[UIColor blackColor]];
  _navControllerEdit.toolbar.barStyle = UIBarStyleBlack;
  [self.window addSubview:_navControllerEdit.view];
  self.window.rootViewController = _navControllerEdit;
}

-(void)toggleEditViewWithGroup:(Group*)group{
  
  [_navControllerEdit.view removeFromSuperview];

  
  _navController = [[UINavigationController alloc] initWithRootViewController:_detailViewController];
  [_navController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
  
  _splitViewController.viewControllers = @[_masterViewController, _navController];
  
  self.window.rootViewController = self.splitViewController;

  GroupViewController * groupViewController = [[GroupViewController alloc] initWithGroup:group ];
  [_navController pushViewController:groupViewController animated:NO];
}


@end
