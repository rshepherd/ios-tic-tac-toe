//
//  GameSetupViewController.h
//  TicTacToe
//
//  Created by Randy Shepherd on 6/22/12.
//

#import <UIKit/UIKit.h>

@interface GameSetupViewController : UIViewController<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *playerX;
@property (weak, nonatomic) IBOutlet UITextField *playerO;

-(void)playerX:(NSString *)x playerXWins:(NSInteger)xWins playerO:(NSString *)o playerOWins:(NSInteger)oWins;

-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)backgroundTap:(id)sender;
-(IBAction)back;

@end
