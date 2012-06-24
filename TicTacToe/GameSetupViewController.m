//
//  GameSetupViewController.m
//  TicTacToe
//
//  Created by Randy Shepherd on 6/22/12.
//

#import "GameSetupViewController.h"
#import "TicTacToeViewController.h"

@implementation GameSetupViewController
@synthesize playerX;
@synthesize playerO;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [playerX.text isEqualToString:playerO.text]){
        playerX.text =  [playerX.text stringByAppendingString:@"1"];
    }
    [segue.destinationViewController setPlayerX:self.playerX.text setPlayerO:self.playerO.text];
}

-(void)playerX:(NSString *)x playerXWins:(NSInteger)xWins playerO:(NSString *)o playerOWins:(NSInteger)oWins 
{
    NSString* msg = [NSString stringWithFormat:@"%@ won %i times and %@ won %i times.", x, xWins, o, oWins];
    UIAlertView* alert = [[UIAlertView alloc]
                          initWithTitle:@"Results" 
                          message: msg  
                          delegate: self 
                          cancelButtonTitle:@"OK" 
                          otherButtonTitles:nil];
    [alert show];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setPlayerX:nil];
    [self setPlayerO:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)textFieldDoneEditing:(id)sender 
{
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender
{
    [playerX resignFirstResponder]; 
    [playerO resignFirstResponder];
}

-(IBAction)back
{
    [self dismissModalViewControllerAnimated:NO];
}

@end
