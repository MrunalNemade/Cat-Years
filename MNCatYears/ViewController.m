//
//  ViewController.m
//  MNCatYears
//
//  Created by Mrunalini on 19/09/16.
//  Copyright © 2016 Mrunalini Nemade. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    screenWidth =[[UIScreen mainScreen]bounds].size.width;
    screenHeight =[[UIScreen mainScreen]bounds].size.height;
    textFieldwidth = screenWidth -(2* KHorizontalPadding);
    
    buttonYCoordinate = 100+KverticalPadding +kAllElementHeight;
    
    labelYCoordinate = buttonYCoordinate + kAllElementHeight+
    (KverticalPadding);
    
    labelWidth = screenWidth-(2*KHorizontalPadding);
    
    buttonWidth = screenWidth -(8*KHorizontalPadding);
    
    self.view.backgroundColor=[UIColor grayColor];
    
    myTextField = [[UITextField alloc]initWithFrame:CGRectMake(KHorizontalPadding, 100, textFieldwidth, kAllElementHeight)];
    
    myTextField.backgroundColor = [UIColor whiteColor];
    //[myTextField setBorderStyle:UITextBorderStyleBezel];
    [myTextField setBorderStyle:(UITextBorderStyleLine)];
    myTextField.textAlignment = NSTextAlignmentCenter;
    myTextField.delegate = self;
    
    
    myTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.view addSubview:myTextField];
    
    
    UIButton *myButton =[[UIButton alloc]initWithFrame:CGRectMake((2*KHorizontalPadding), buttonYCoordinate, buttonWidth-(3*KHorizontalPadding), kAllElementHeight)];
    
    myButton.backgroundColor = [UIColor blackColor];
    myButton.tintColor=[UIColor whiteColor];
    
    myButton.layer.cornerRadius = 40;
    
    [myButton addTarget:self action:@selector(handleCat) forControlEvents:UIControlEventTouchUpInside];
    [myButton setTitle:@"Calculate Cat Year" forState:(UIControlStateNormal)];
    [self.view addSubview:myButton];
    
    
    UIButton *clearButton=[[UIButton alloc]initWithFrame:CGRectMake((2*KHorizontalPadding+buttonWidth), buttonYCoordinate, 60, kAllElementHeight)];
    clearButton.backgroundColor = [UIColor blackColor];
    clearButton.layer.cornerRadius = 50/2;
    [clearButton addTarget:self action:@selector(handleclear)forControlEvents:UIControlEventTouchUpInside];
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [self.view addSubview:clearButton];
    
    myLabel=[[UILabel alloc]initWithFrame:CGRectMake(KHorizontalPadding, labelYCoordinate, labelWidth, kAllElementHeight)];
    myLabel.backgroundColor =[UIColor blueColor];
    myLabel.textColor=[UIColor whiteColor];
    myLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:myLabel];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)handleCat{
    
    [self displayContent:myTextField.text];
    
    
}
- (void)handleclear{
    myTextField.text=@"";
}


-(void) displayContent:(NSString *)content
{
    int intAge = content.intValue;
    if(content)
    {
        if(intAge>0 && intAge<110) {
            NSString *currentValueString = myTextField.text;
            
            float currentValueInt = currentValueString.floatValue;
            
            currentValueInt = currentValueInt /7;
            
            NSString *newValueString = [NSString stringWithFormat:@"  Catyear is:%0.02f ",currentValueInt];
            
            myLabel.text = newValueString;
            
        }
        else {
            myLabel.text=@"Please enter the age between 1 to 110";
        }
        
    }
    else {
        myLabel.text=@"Please Enter the Age";
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)UITextField
{
    
    [myTextField resignFirstResponder];
    
    return YES;
}
//-(BOOL)clear:(UITextField *)textField
//{
//    [ myTextField.text=myTextField.resignFirstResponder ];
//    return NO;
//}

@end