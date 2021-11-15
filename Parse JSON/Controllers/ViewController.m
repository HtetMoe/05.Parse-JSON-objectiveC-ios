//
//  ViewController.m
//  API Call
//
//  Created by Htet Moe Phyu on 15/11/2021.


#import "ViewController.h"
#import "Course.h"
#import "TableViewCell.h"

@interface ViewController (){
    NSMutableArray *courses;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    courses = [NSMutableArray alloc];
    [self processAPICall];
    
    
}

-(void) processAPICall {
    
    NSLog(@"Fetching data");
    
    NSString *urlString = @"https://api.letsbuildthatapp.com/jsondecodable/courses";
    NSURL *url = [NSURL URLWithString: urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //        NSString *dummyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"Dummy String : %@",dummyString);
        
        NSError *err;
        NSArray *coursesJSON =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if(err){
            NSLog(@"Failed to serialize into JSON: %@",err);
            return;
        }
        
        NSMutableArray<Course *> *courses = NSMutableArray.new;
        for(NSDictionary *courseDictionary in coursesJSON){
            
            NSString *name = courseDictionary[@"name"];
            NSNumber *numberOfLessons = courseDictionary[@"numberOfLessons"];
            
            Course *course = Course.new;
            course.name = name;
            course.numberOfLessons = numberOfLessons;
            
            [courses addObject: course];
        }
        
        //NSLog(@"Courses : %@",courses);
        self->courses = courses;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
        
    }] resume];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell){
        [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    }
    
    //set up data
    Course *course = courses[indexPath.row];
    
    cell.courseName.text    = course.name;
    NSInteger number = indexPath.row + 1;
    cell.searialNumber.text = [@(number) stringValue];
    
    return  cell;
}

@end
