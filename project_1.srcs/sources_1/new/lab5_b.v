`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2025 06:10:18 PM
// Design Name: 
// Module Name: lab5_b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab5_b(

    input [3:0] SW,          // Switches
    output [2:0] LED,        // LED indicators (greater, equal, less)
    output LED16_R,          // RGB LED (Red)
    output LED16_G,          // RGB LED (Green)
    output LED16_B           // RGB LED (Blue)
);

    
    wire [1:0] A = SW[3:2];
    wire [1:0] B = SW[1:0];
    
    wire e; // equal
    wire f; // greater
    wire g; // less
    
    assign e = (A == B);
    assign f = (A[1] & ~B[1]) | ((A[1] ~^ B[1]) & (A[0] & ~B[0]));
    assign g = (~A[1] & B[1]) | ((A[1] ~^ B[1]) & (~A[0] & B[0]));
	
    assign LED[2] = f;   // A > B
    assign LED[1] = e;   // A == B
    assign LED[0] = g;   // A < B

    // RGB LED indicators (optional)
    assign LED16_R = g;  // Red when A < B
    assign LED16_G = e;  // Green when A == B
    assign LED16_B = f;  // Blue when A > B
    
endmodule