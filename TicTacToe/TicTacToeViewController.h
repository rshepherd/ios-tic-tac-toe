//
//  TicTacToeViewController.h
//  TicTacToe
//
//  Created by Randy Shepherd on 6/22/12.
//

#import <UIKit/UIKit.h>

@interface TicTacToeViewController : UIViewController

// Player and board state
@property (weak, nonatomic) IBOutlet UILabel* playerTurnLabel;
@property (weak, nonatomic) UIImage* playerImage;
@property (weak, nonatomic) NSString* currentPlayer;
@property (weak, nonatomic) NSString* playerX;
@property (weak, nonatomic) NSString* playerO;
@property NSInteger playerXWinCnt;
@property NSInteger playerOWinCnt;
@property NSInteger playersTurnCount;
@property (weak, nonatomic) IBOutlet UIButton* reset;
@property BOOL boardDisabled;

// Board components
@property (weak, nonatomic) IBOutlet UIImage* oImage;
@property (weak, nonatomic) IBOutlet UIImage* xImage;
@property (weak, nonatomic) IBOutlet UIImage* board;
@property (weak, nonatomic) IBOutlet UIImageView* r1c1;
@property (weak, nonatomic) IBOutlet UIImageView* r1c2;
@property (weak, nonatomic) IBOutlet UIImageView* r1c3;
@property (weak, nonatomic) IBOutlet UIImageView* r2c1;
@property (weak, nonatomic) IBOutlet UIImageView* r2c2;
@property (weak, nonatomic) IBOutlet UIImageView* r2c3;
@property (weak, nonatomic) IBOutlet UIImageView* r3c1;
@property (weak, nonatomic) IBOutlet UIImageView* r3c2;
@property (weak, nonatomic) IBOutlet UIImageView* r3c3;

-(void)setPlayerX:(NSString *)x setPlayerO:(NSString *)o;

-(BOOL)isGameComplete;
-(BOOL)isThereAWinner;
-(void)nextTurn;
-(void)incWinCnt:(NSString *)player; 
-(IBAction)resetBoard;

@end
