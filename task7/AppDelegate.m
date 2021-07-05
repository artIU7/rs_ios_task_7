//
//  AppDelegate.m
//  task7
//
//  Created by Артем Стратиенко on 05.07.2021.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) ViewController *viewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.viewController = [ [ViewController alloc ] initWithNibName:nil bundle:nil ];
    self.window = [ [ UIWindow alloc] initWithFrame: [ [ UIScreen mainScreen ] bounds ] ];
    self.window.rootViewController = self.viewController;
    self.window.backgroundColor = [ UIColor whiteColor ] ;
    [ self.window makeKeyAndVisible ];
    return YES;
}
@end
