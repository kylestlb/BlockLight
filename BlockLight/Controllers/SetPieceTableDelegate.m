//
//  SetPieceTableDelegate.m
//  BlockLight
//
//  Created by Barrett Ames on 9/17/12.
//  Copyright (c) 2012 BlockLight. All rights reserved.
//

#import "SetPieceTableDelegate.h"


@implementation SetPieceTableDelegate

-(id)initWithViewController:(MainViewController*)mainViewController{
  self = [super init];
  
  if(self == nil){
    return nil;
  }
  
  _mainViewController = mainViewController; 
  
  
  return self;
  
}
  
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  NSInteger row = [indexPath row];
  NSInteger section = [indexPath section];
 
 UITableViewCell* cell ;
  
  // Table containing options for altering the set of the stage
    cell =   [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuse"];
    
    switch (section) {
      case 0:
      {
        cell.textLabel.text = @"Spike Tape";
        UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
        [switchview addTarget:self action:@selector(spikeTape) forControlEvents:UIControlEventValueChanged];
        [switchview setOn:[_mainViewController contentView].spikeTape animated:NO];
        
        cell.accessoryView = switchview;
      }
        break;
        
      case 1:{
        
        switch (row) {
          case 0:
            cell.textLabel.text = @"Save Current Layout";
            break;
            
          case 1:
            cell.textLabel.text = @"Layout Presets";
            _layoutPresetFrame = cell.frame;
            break;
            
          default:
            break;
        }
      }
        break;
        
      case 2:{
        cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = [UIColor grayColor];
        switch(row){
          case 0:
            cell.textLabel.text = @"All";
            break;
            
          case 1:
            cell.textLabel.text = @"Plants";
            break;
            
          case 2:
            cell.textLabel.text = @"Stairs";
            break;
            
          case 3:
            cell.textLabel.text = @"Platforms";
            break;
            
          case 4:
            cell.textLabel.text = @"Risers";
            break;
            
          case 5:
            cell.textLabel.text = @"Uncategorized";
            break;
            
          default:
            break;
        }
      }
        break;
        
      default:
        break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  switch (indexPath.section) {
    case 1:
    {
      switch (indexPath.row) {
        case 0:{
          // Save current Layout as a preset, present alert to ask for name of layout.
          UIAlertView* saveAlert =  [[UIAlertView alloc ]initWithTitle:@"Save Layout"
                                                               message:@"Please enter a name for the layout"
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                     otherButtonTitles:@"Save",nil];
          saveAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
          [saveAlert show];
          saveAlert.delegate = self;
        }
          break;
          
        case 1:{
          UIViewController* layoutViewController = [[UIViewController alloc] init];
          
          _layoutSelector = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
          UIView* wrapper = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320,216)];
          [wrapper addSubview:_layoutSelector];
          layoutViewController.view = wrapper;
          _layoutSelector.dataSource = self;
          _layoutSelector.delegate   = self;
          _layoutSelector.showsSelectionIndicator = YES;
          
          _layoutPopover = [[UIPopoverController alloc] initWithContentViewController:layoutViewController];
          [_layoutPopover setPopoverContentSize:CGSizeMake(320,216)];
          [_layoutPopover presentPopoverFromRect:_layoutPresetFrame
                                          inView:_mainViewController.setPopover.contentViewController.view
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
          
        }
          break;
          
        default:
          break;
      }
    }
      break;
      
    default:
      break;
  }
  
}
// Set height for tables
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  CGFloat height = 50.0;
  return height;
}

// Determines the number of sections for a table
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  NSInteger sections = 3;

  return sections;
}

// Determines the number of rows in a section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  NSInteger rows =0;
  switch (section) {
    case 0:
      rows =1;
      break;
      
    case 1:
      rows =2;
      break;
      
    case 2:
      rows = 6;
      break;
      
    default:
      break;
  }

  
  return rows;
}
// Sets the titles for sections in the table
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  NSString* title = @"";
  if (section == 2) {
    title = @"Set Pieces";
  }
  return title;
}

//UIPickerViewDelegate Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
  
  return 1;
}

// Switches the spikeTape on and off 
-(void)spikeTape{
  if([_mainViewController contentView].spikeTape)
    [_mainViewController contentView].spikeTape = NO;
  else
    [_mainViewController contentView].spikeTape = YES;
  
  [[_mainViewController contentView] setNeedsDisplay];
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
  NSArray* keys = [_mainViewController.production.layouts allKeys];
  
  return [keys count];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
  return 25.0;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
  return 275.0;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  NSArray* keys = [_mainViewController.production.layouts allKeys];
  return [keys objectAtIndex:row];
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
  NSArray* keys = [_mainViewController.production.layouts allKeys];
  NSString* key = [keys objectAtIndex:row];
  
  [_mainViewController contentView].myPath = [_mainViewController.production.layouts objectForKey:key];
  
  [[_mainViewController contentView] setNeedsDisplay];
  
}




@end
