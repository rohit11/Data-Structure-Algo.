//
//  main.m
//  Fill_Paint
//
//  Created by Rohit Nisal on 2/29/16.
//  Copyright © 2016 Rohit Nisal. All rights reserved.
//

#import <Foundation/Foundation.h>

#define M 5
#define N 5

@class Fill_Paint;

void fillColorAlgo(int pixelArrayColor[][N], int x, int y,int pixelColor, int newColorToFill){
    
    // If x or y is is not on the screen
    if (x < 0 || x >= M || y < 0 || y >= N)
        return;
    
    //If color of pixelArrayColor[x][y] is not equal to pixelColor
    if (pixelArrayColor[x][y] != pixelColor)
        return;
    
    // replace the color at (x, y)
    pixelArrayColor[x][y] = newColorToFill;

    // call function for all four direction
    fillColorAlgo(pixelArrayColor, x+1, y, pixelColor, newColorToFill);
    fillColorAlgo(pixelArrayColor, x-1, y, pixelColor, newColorToFill);
    fillColorAlgo(pixelArrayColor, x, y+1, pixelColor, newColorToFill);
    fillColorAlgo(pixelArrayColor, x, y-1, pixelColor, newColorToFill);
    
}

void fillColor(int pixelArrayColor[][N], int x, int y, int newColorToFill){
    
    // Get pixel color which replaced by newColorToFill
    int pixelColor = pixelArrayColor[x][y];
    
    fillColorAlgo(pixelArrayColor,x,y,pixelColor,newColorToFill);
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        int pixelArrayColor [M][N] = {{2, 5, 5, 5, 5},
            {5, 2, 5, 5, 5},
            {5, 0, 0, 5, 5},
            {5, 2, 2, 2, 2},
            {5, 5, 5, 2, 2}
        };
        
        int x = 2 , y = 3 , colorToFill = 6;
        
        fillColor(pixelArrayColor,x,y,colorToFill);
        
        for (int i=0; i<M; i++)
        {
            for (int j=0; j<N; j++)
                printf("%d ",pixelArrayColor[i][j]);
            printf("\n");
        }
        
    }
    return 0;
}
