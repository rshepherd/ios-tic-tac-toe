//
//  TicTacToeViewController.m
//  TicTacToe
//
//  Created by Randy Shepherd on 6/22/12.
//

#import "TicTacToeViewController.h"
#import "GameSetupViewController.h"

@implementation TicTacToeViewController

@synthesize currentPlayer;
@synthesize playerTurnLabel;
@synthesize playerImage;
@synthesize playersTurnCount;
@synthesize playerXWinCnt;
@synthesize playerOWinCnt;
@synthesize reset;
@synthesize boardDisabled;

@synthesize playerX;
@synthesize playerO;

@synthesize oImage;
@synthesize xImage;
@synthesize board;
@synthesize r1c1;
@synthesize r1c2;
@synthesize r1c3;
@synthesize r2c1;
@synthesize r2c2;
@synthesize r2c3;
@synthesize r3c1;
@synthesize r3c2;
@synthesize r3c3;

// This code id prototype quality. Lots of whacky code duplication here.
// The purpose was to learn storyboards and interface builder, so the code is just a hack job.

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
    if(boardDisabled) 
    {
        return;
    }
    
    playerImage = [currentPlayer isEqualToString:playerX] ? xImage : oImage;
    
    UITouch* t = [[event allTouches] anyObject];
    BOOL slotUsed = YES;
    
    if (CGRectContainsPoint([r1c1 frame], [t locationInView:self.view]) && (r1c1.image == nil)) {
        r1c1.image = playerImage;
    }
    else if (CGRectContainsPoint([r1c2 frame], [t locationInView:self.view]) && (r1c2.image == nil)) {
        r1c2.image = playerImage;
    } 
    else if (CGRectContainsPoint([r1c3 frame], [t locationInView:self.view]) && (r1c3.image == nil)) {
        r1c3.image = playerImage; 
    } 
    else if (CGRectContainsPoint([r2c1 frame], [t locationInView:self.view]) && (r2c1.image == nil)) {
        r2c1.image = playerImage;
    } 
    else if (CGRectContainsPoint([r2c2 frame], [t locationInView:self.view]) && (r2c2.image == nil)) {
        r2c2.image = playerImage;
    } 
    else if (CGRectContainsPoint([r2c3 frame], [t locationInView:self.view]) && (r2c3.image == nil)) {
        r2c3.image = playerImage;
    } 
    else if (CGRectContainsPoint([r3c1 frame], [t locationInView:self.view]) && (r3c1.image == nil)) {
        r3c1.image = playerImage;
    } 
    else if (CGRectContainsPoint([r3c2 frame], [t locationInView:self.view]) && (r3c2.image == nil)) {
        r3c2.image = playerImage;
    } 
    else if (CGRectContainsPoint([r3c3 frame], [t locationInView:self.view]) && (r3c3.image == nil)) {
        r3c3.image = playerImage;
    } else {
        slotUsed = NO;
    }
    
    if(slotUsed && ![self isGameComplete]) {
        [self nextTurn];
    }
}

-(BOOL)isGameComplete
{
    if([self isThereAWinner]) 
    {
        NSString* msg = [NSString stringWithFormat:@"Player %@ wins!", currentPlayer];
        UIAlertView* alert = [[UIAlertView alloc]
                              initWithTitle:@"Game Over" 
                              message: msg 
                              delegate: self 
                              cancelButtonTitle:@"OK" 
                              otherButtonTitles:nil];
        
        [alert show];
        [self incWinCnt: currentPlayer];
        boardDisabled = YES;
        return YES;
    } 
    else if (![self isThereAWinner] && playersTurnCount == 9 ) 
    {
        NSString* msg = @"It's a draw!";
        UIAlertView* alert = [[UIAlertView alloc]
                              initWithTitle:@"Game Over" 
                              message: msg 
                              delegate: self 
                              cancelButtonTitle:@"OK" 
                              otherButtonTitles:nil];
        [alert show];
        boardDisabled = YES;
        return YES;
    }
    return NO;
}

-(void)nextTurn 
{
    playersTurnCount++;
    currentPlayer = [currentPlayer isEqualToString:playerX] ? playerO : playerX;
    playerTurnLabel.text = [NSString stringWithFormat:@"Player %@'s turn.", currentPlayer];
}

-(BOOL)isThereAWinner
{
    if( (r1c1.image != nil && r1c1.image == r1c2.image && r1c2.image == r1c3.image) || 
        (r2c1.image != nil && r2c1.image == r2c2.image && r2c2.image == r2c3.image) || 
        (r3c1.image != nil && r3c1.image == r3c2.image && r3c2.image == r3c3.image) || 
        (r1c1.image != nil && r1c1.image == r2c1.image && r2c1.image == r3c1.image) || 
        (r1c2.image != nil && r1c2.image == r2c2.image && r2c2.image == r3c2.image) || 
        (r1c3.image != nil && r1c3.image == r2c3.image && r2c3.image == r3c3.image) || 
        (r1c1.image != nil && r1c1.image == r2c2.image && r2c2.image == r3c3.image) || 
        (r3c1.image != nil && r3c1.image == r2c2.image && r2c2.image == r1c3.image) )
    {
        return YES;
    } 
    
    return NO;
}

-(IBAction)resetBoard 
{
    r1c1.image = nil;
    r1c2.image = nil;
    r1c3.image = nil;
    r2c1.image = nil;
    r2c2.image = nil;
    r2c3.image = nil;
    r3c1.image = nil;
    r3c2.image = nil;
    r3c3.image = nil;
    boardDisabled = NO;
    // Randomly select which player move first
    NSInteger rand = arc4random_uniform(120) % 2;
    if(rand == 0) {
        currentPlayer = playerX;
    } else {
        currentPlayer = playerO;
    }
    playersTurnCount = 0;
    playerTurnLabel.text = [NSString stringWithFormat:@"Player %@'s turn.", currentPlayer];
}

-(void)setPlayerX:(NSString *)x setPlayerO:(NSString *)o 
{
    self.playerO = o;
    self.playerX = x;
}

-(void)incWinCnt:(NSString *)player 
{ 
    if([player isEqualToString:playerX]) 
    {
        self.playerXWinCnt++;
    } 
    else 
    {
        self.playerOWinCnt++;
    }
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
	oImage = [UIImage imageNamed:@"letter_o.png"];
    xImage = [UIImage imageNamed:@"letter_x.png"];
    board = [UIImage imageNamed:@"board.png"];
    [self resetBoard];
    [reset setHidden:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    oImage = nil;
    oImage = nil;
    xImage = nil;
    playerImage = nil;
    playerTurnLabel = nil;
    r1c1 = nil;
    r1c2 = nil;
    r1c3 = nil;
    r2c1 = nil;
    r2c2 = nil;
    r2c3 = nil;
    r3c1 = nil;
    r3c2 = nil;
    r3c3 = nil;
    board = nil;
    reset = nil;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController playerX:self.playerX playerXWins:self.playerXWinCnt playerO:self.playerO playerOWins:self.playerOWinCnt];
    [self dismissModalViewControllerAnimated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end