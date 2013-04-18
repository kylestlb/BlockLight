// code taken from:
// http://starterstep.wordpress.com/2009/03/05/changing-a-uinavigationcontroller%E2%80%99s-root-view-controller/

//// Header file

@interface TVNavigationController : UINavigationController {
    UIViewController *fakeRootViewController;
}

@property(nonatomic, retain) UIViewController *fakeRootViewController;

-(void)setRootViewController:(UIViewController *)rootViewController;

@end