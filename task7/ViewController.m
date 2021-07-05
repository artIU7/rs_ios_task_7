//
//  ViewController.m
//  task7
//
//  Created by Артем Стратиенко on 05.07.2021.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (nonatomic, strong) UILabel *RSSchoolLabel;
@property (nonatomic, strong) UITextField *RSSchoolLogin;
@property (nonatomic, strong) UITextField *RSSchoolPassword;
@property (nonatomic, strong) UIButton *RSSchoolAuthorize;
@property (nonatomic, strong) UIView *RSSchoolSecure;
@property (nonatomic, strong) UILabel *RSSchoolSecureResult;
@property (nonatomic, strong) UIButton *RSSchoolSecureOneTouch;
@property (nonatomic, strong) UIButton *RSSchoolSecureTwoTouch;
@property (nonatomic, strong) UIButton *RSSchoolSecureTreeTouch;
@property (nonatomic, strong) UIAlertController *RSSchoolWelcome;
@end

// category keyboard
@interface ViewController (KeyBoardHandling)
- ( void ) hideWhenTabbed;
@end
// =================

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // call :: addRSSchoolLabel
    [ self hideWhenTabbed ];
    [ self addRSSchoolLabel ];
    [ self addRSSchoolLogin ];
    self.RSSchoolLogin.delegate = self;
    [ self addRSSchoolRSSchoolPassword ];
    [ self addRSSchoolAuthorize ];
    [ self addRSSchoolSecure ];
    [ self.RSSchoolSecure setHidden:true ];
}
- ( void ) addRSSchoolLabel  {
    CGRect labelFrame = CGRectMake(0.0f,
                                   0.0f,
                                   160,
                                   36.0f);
    self.RSSchoolLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.RSSchoolLabel.text = @"RSSchool";
    self.RSSchoolLabel.numberOfLines = 1;
    self.RSSchoolLabel.font = [UIFont boldSystemFontOfSize:36.0f ] ;
    // add SF pro
    self.RSSchoolLabel.center = CGPointMake(self.view.center.x,  80 + self.RSSchoolLabel.frame.size.height/2);
    self.RSSchoolLabel.textColor = UIColor.blackColor;
    [self.view addSubview:self.RSSchoolLabel];
}
- ( void ) addRSSchoolLogin {
    CGRect textFieldFrame = CGRectMake(0.0f,
                                       0.0f,
                                       self.view.frame.size.width - 2*36,
                                       40.0f);
    self.RSSchoolLogin = [[UITextField alloc]
                        initWithFrame:textFieldFrame];
    self.RSSchoolLogin.borderStyle = UITextBorderStyleRoundedRect;
    self.RSSchoolLogin.contentVerticalAlignment =
    UIControlContentVerticalAlignmentCenter;
    self.RSSchoolLogin.textAlignment = NSTextAlignmentLeft;
    self.RSSchoolLogin.placeholder = @"Login";
    self.RSSchoolLogin.layer.cornerRadius = 5.0;
    self.RSSchoolLogin.layer.borderColor = UIColor.blackColor.CGColor;
    self.RSSchoolLogin.layer.borderWidth = 1.5;
    self.RSSchoolLogin.center = CGPointMake(self.view.center.x, self.RSSchoolLabel.center.y + self.RSSchoolLabel.frame.size.height/2 + self.RSSchoolLabel.frame.size.height/2 + 60);
    [self.view addSubview:self.RSSchoolLogin];
    }
- ( void ) addRSSchoolRSSchoolPassword {
    CGRect textFieldFrame = CGRectMake(0.0f,
                                       0.0f,
                                       self.view.frame.size.width - 2*36,
                                       40.0f);
    self.RSSchoolPassword = [[UITextField alloc]
                        initWithFrame:textFieldFrame];
    self.RSSchoolPassword.borderStyle = UITextBorderStyleRoundedRect;
    self.RSSchoolPassword.contentVerticalAlignment =
    UIControlContentVerticalAlignmentCenter;
    self.RSSchoolPassword.textAlignment = NSTextAlignmentLeft;
    self.RSSchoolPassword.placeholder = @"Password";
    self.RSSchoolPassword.secureTextEntry = true;
    self.RSSchoolPassword.layer.cornerRadius = 5.0;
    self.RSSchoolPassword.layer.borderColor = UIColor.blackColor.CGColor;
    self.RSSchoolPassword.layer.borderWidth = 1.5;
    self.RSSchoolPassword.center = CGPointMake(self.view.center.x, self.RSSchoolLogin.center.y + self.RSSchoolLogin.frame.size.height/2 + self.RSSchoolPassword.frame.size.height/2 + 30);
    [self.view addSubview:self.RSSchoolPassword];
    }
- ( void ) addRSSchoolAuthorize {
        self.RSSchoolAuthorize = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.RSSchoolAuthorize.frame = CGRectMake(0.0f,
                                       0.0f,
                                       156.f,
                                       44.0f);
        [self.RSSchoolAuthorize setTitle:@"Authorize"
                     forState:UIControlStateNormal];
        self.RSSchoolAuthorize.titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
        self.RSSchoolAuthorize.layer.borderWidth = 1.5;
        self.RSSchoolAuthorize.layer.borderColor = [ UIColor colorNamed:@"littleBoyBlue"].CGColor;//UIColor.redColor.CGColor;
        self.RSSchoolAuthorize.layer.cornerRadius = 5.0;
        [self.RSSchoolAuthorize setTitle:@"I'm Pressed"
                     forState:UIControlStateHighlighted];
        self.RSSchoolAuthorize.center = CGPointMake(self.view.center.x, self.RSSchoolPassword.center.y + self.RSSchoolPassword.frame.size.height/2 + self.RSSchoolAuthorize.frame.size.height/2 + 60);
        [self.RSSchoolAuthorize addTarget:self
                        action:@selector(buttonIsTapped:)
              forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.RSSchoolAuthorize];
}

- (void) buttonIsTapped:(UIButton *)paramSender{
    if ( [ self.RSSchoolLogin.text isEqualToString:@"username"] ) {
        self.RSSchoolLogin.layer.borderColor = [ UIColor colorNamed:@"turquoiseGreen"].CGColor;
        [ self.RSSchoolLogin setEnabled: false ];
    } else {
        self.RSSchoolLogin.layer.borderColor = [ UIColor colorNamed:@"venetianRed"].CGColor;
    }
    if ( [ self.RSSchoolPassword.text isEqualToString:@"password"] ) {
        self.RSSchoolPassword.layer.borderColor = [ UIColor colorNamed:@"turquoiseGreen"].CGColor;
        [ self.RSSchoolPassword setEnabled: false ];
    } else {
        self.RSSchoolPassword.layer.borderColor = [ UIColor colorNamed:@"venetianRed"].CGColor;
    }
    if (( self.RSSchoolLogin.isEnabled == false ) && ( self.RSSchoolPassword.isEnabled == false ) ) {
        [ self.RSSchoolSecure setHidden:false ];
        [ self.RSSchoolAuthorize setEnabled: false ];
    }
}
- ( void ) addRSSchoolSecure {
        self.RSSchoolSecure = [[UIView alloc] initWithFrame:
                         CGRectMake(0.0f,
                                    0.0f,
                                    236.0f,
                                    110.0f)];
        self.RSSchoolSecure.backgroundColor = [UIColor clearColor];
        self.RSSchoolSecure.layer.borderWidth = 2.0;
        self.RSSchoolSecure.layer.cornerRadius = 10.0;
        self.RSSchoolSecure.layer.borderColor = [ UIColor colorNamed:@"turquoiseGreen"].CGColor;
    
        // one touch
        self.RSSchoolSecureOneTouch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.RSSchoolSecureOneTouch.frame = CGRectMake(0.0f,
                                   0.0f,
                                   50.0f,
                                   50.0f);
        [self.RSSchoolSecureOneTouch setTitle:@"1"
                 forState:UIControlStateNormal];
        self.RSSchoolSecureOneTouch.titleLabel.font = [UIFont boldSystemFontOfSize:24.0f];
        self.RSSchoolSecureOneTouch.layer.borderWidth = 1.4;
        self.RSSchoolSecureOneTouch.layer.borderColor = [ UIColor colorNamed:@"littleBoyBlue"].CGColor;//UIColor.redColor.CGColor;
        self.RSSchoolSecureOneTouch.layer.cornerRadius = 25.0;
        self.RSSchoolSecureOneTouch.center = CGPointMake(self.RSSchoolSecure.frame.size.width - (self.RSSchoolSecure.frame.size.width - 23) + self.RSSchoolSecureOneTouch.frame.size.height/2, self.RSSchoolSecure.frame.size.height - 15 - self.RSSchoolSecureOneTouch.frame.size.height/2);
        [ self.RSSchoolSecure addSubview: self.RSSchoolSecureOneTouch ];
        // end add one touch
    
    // two touch
    self.RSSchoolSecureTwoTouch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.RSSchoolSecureTwoTouch.frame = CGRectMake(0.0f,
                               0.0f,
                               50.0f,
                               50.0f);
    [self.RSSchoolSecureTwoTouch setTitle:@"2"
             forState:UIControlStateNormal];
    self.RSSchoolSecureTwoTouch.titleLabel.font = [UIFont boldSystemFontOfSize:24.0f];
    self.RSSchoolSecureTwoTouch.layer.borderWidth = 1.4;
    self.RSSchoolSecureTwoTouch.layer.borderColor = [ UIColor colorNamed:@"littleBoyBlue"].CGColor;//UIColor.redColor.CGColor;
    self.RSSchoolSecureTwoTouch.layer.cornerRadius = 25.0;
    self.RSSchoolSecureTwoTouch.center = CGPointMake((self.RSSchoolSecureOneTouch.center.x + 20) + self.RSSchoolSecureOneTouch.frame.size.height/2 + self.RSSchoolSecureTwoTouch.frame.size.height/2, self.RSSchoolSecure.frame.size.height - 15 - self.RSSchoolSecureTwoTouch.frame.size.height/2);
    [ self.RSSchoolSecure addSubview: self.RSSchoolSecureTwoTouch ];
    // end add one touch
    
    // tree touch
    self.RSSchoolSecureTreeTouch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.RSSchoolSecureTreeTouch.frame = CGRectMake(0.0f,
                               0.0f,
                               50.0f,
                               50.0f);
    [self.RSSchoolSecureTreeTouch setTitle:@"3"
             forState:UIControlStateNormal];
    self.RSSchoolSecureTreeTouch.titleLabel.font = [UIFont boldSystemFontOfSize:24.0f];
    self.RSSchoolSecureTreeTouch.layer.borderWidth = 1.4;
    self.RSSchoolSecureTreeTouch.layer.borderColor = [ UIColor colorNamed:@"littleBoyBlue"].CGColor;//UIColor.redColor.CGColor;
    self.RSSchoolSecureTreeTouch.layer.cornerRadius = 25.0;
    self.RSSchoolSecureTreeTouch.center = CGPointMake((self.RSSchoolSecureTwoTouch.center.x + 20) + self.RSSchoolSecureTwoTouch.frame.size.height/2 + self.RSSchoolSecureTreeTouch.frame.size.height/2, self.RSSchoolSecure.frame.size.height - 15 - self.RSSchoolSecureTwoTouch.frame.size.height/2);
    [ self.RSSchoolSecure addSubview: self.RSSchoolSecureTreeTouch ];
    // end add one touch
    
    
        self.RSSchoolSecure.center = CGPointMake(self.view.center.x, self.RSSchoolAuthorize.center.y + self.RSSchoolAuthorize.frame.size.height/2 + self.RSSchoolSecure.frame.size.height/2 + 67);
        [self.view addSubview:self.RSSchoolSecure];
}
// 190 + 23 * 2
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    return  [self.RSSchoolPassword becomeFirstResponder];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ( [ self.RSSchoolLogin.text isEqualToString:@"username"] ) {
        self.RSSchoolLogin.layer.borderColor = [ UIColor colorNamed:@"turquoiseGreen"].CGColor;
    } else {
        self.RSSchoolLogin.layer.borderColor = [ UIColor colorNamed:@"venetianRed"].CGColor;
    }
    if ( [ self.RSSchoolPassword.text isEqualToString:@"password"] ) {
        self.RSSchoolPassword.layer.borderColor = [ UIColor colorNamed:@"turquoiseGreen"].CGColor;
    } else {
        self.RSSchoolPassword.layer.borderColor = [ UIColor colorNamed:@"venetianRed"].CGColor;
    }
}

@end

@implementation ViewController (KeyBoardHandling)

- ( void ) hideWhenTabbed {
    UITapGestureRecognizer *gesture = [ [UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [ self.view addGestureRecognizer: gesture ];
}
- ( void ) hide {
    [ self.view endEditing: true ];
}

@end

