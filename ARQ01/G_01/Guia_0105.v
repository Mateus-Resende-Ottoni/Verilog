/* 
Guia_0105.v 
855842 - Mateus Resende Ottoni
*/ 

module Guia_0105; 

// define data 
integer   	x = 0	; 
reg [7:0] 	z	;
reg [0:23][8:0] word; // Char Array
reg [0:23][8:0] original;

// actions 
initial 
begin : main 
	$display ( "Guia_0105" );


// Letra a.) PUC-M.G.
	original = "PUC-M.G.";
	$display ( "a) %s", original ); 
	word[0] = "P";	word[1] = "U";	word[2] = "C";
	word[3] = "-";
	word[4] = "M";	word[5] = ".";	word[6] = "G";	word[7] = ".";	

	$display ( " %h %h %h %h %h %h %h %h ", word[0], word[1], word[2], word[3], word[4], word[5], word[6], word[7] );


// Letra b.) 2024-02
	original = "2024-02";
	$display ( "b) %s" , original ); 
	word[0] = "2";	word[1] = "0";	word[2] = "2";	word[3] = "4";
	word[4] = "-";
	word[5] = "0";	word[6] = "2";

	$display ( " %h %h %h %h %h %h %h ", word[0], word[1], word[2], word[3], word[4], word[5], word[6] );


// Letra c.) Belo Horizonte
	original = "Belo Horizonte";
	$display ( "c) %s" , original ); 
	word[0] = "B";	word[1] = "e";	word[2] = "l";	word[3] = "o";
	word[4] = " ";
	word[5] = "H";	word[6] = "o";	word[7] = "r";	word[8] = "i";	word[9] = "z";	word[10] = "o";	word[11] = "n";	word[12] = "t";	word[13] = "e";

	$display ( " %b %b %b %b %b %b %b %b %b %b %b %b %b %b ", word[0], word[1], word[2], word[3], word[4], word[5], word[6], word[7], word[8], word[9], word[10], word[11], word[12], word[13] );
	

// Letra d.) 156 157 151 164 145 (8) = 110 111 105 116 101
	original = "156 157 151 164 154 (8)";
	$display ( "d) %s"  , original ); 
	z = 0; z[2:0] = 6;  z[5:3] = 5; z[7:6] = 1;
	x = z;
	word[0] = "0"; word[1] = "1"; word[2] = "1"; word[3] = " ";
	z = 0; z[2:0] = 7;  z[5:3] = 5; z[7:6] = 1;
	x = z;
	word[4] = "1"; word[5] = "1"; word[6] = "1"; word[7] = " ";
	z = 0; z[2:0] = 1;  z[5:3] = 5; z[7:6] = 1;
	x = z;
	word[8] = "5"; word[9] = "0"; word[10] = "1"; word[11] = " ";
	z = 0; z[2:0] = 4;  z[5:3] = 6; z[7:6] = 1;
	x = z;
	word[12] = "6"; word[13] = "1"; word[14] = "1"; word[15] = " ";
	z = 0; z[2:0] = 4;  z[5:3] = 5; z[7:6] = 1;
	x = z;
	word[16] = "1"; word[17] = "0"; word[18] = "1"; word[19] = " ";

	$display ( " %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d ", word[0], word[1], word[2], word[3], word[4], word[5], word[6], word[7], word[8], word[9], word[10], word[11], word[12], word[13], word[14], word[15], word[16], word[17], word[18], word[19] );


// Letra e.) 4D 61 6E 68 61 (16) = 77 97 111 104 97
	original = "4D 61 6E 68 61 (16)";
	$display ( "d) %s"  , original ); 
	z = 0; z[3:0] = 13;  z[7:4] = 4;
	x = z;
	word[0] = "7"; word[1] = "7"; word[2] = " ";
	z = 0; z[3:0] = 1;  z[7:4] = 6;
	x = z;
	word[3] = "9"; word[4] = "7"; word[5] = " ";
	z = 0; z[3:0] = 14;  z[7:4] = 6;
	x = z;
	word[6] = "1"; word[7] = "1"; word[8] = "1"; word[9] = " ";
	z = 0; z[3:0] = 8;  z[7:4] = 6;
	x = z;
	word[10] = "1"; word[11] = "0"; word[12] = "4"; word[13] = " ";
	z = 0; z[3:0] = 1;  z[7:4] = 6;
	x = z;
	word[14] = "9"; word[15] = "7"; word[16] = " ";

	$display ( " %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d ", word[0], word[1], word[2], word[3], word[4], word[5], word[6], word[7], word[8], word[9], word[10], word[11], word[12], word[13], word[14], word[15], word[16]);




end // main 

endmodule // Guia_0105
