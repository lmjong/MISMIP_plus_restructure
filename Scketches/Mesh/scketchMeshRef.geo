// Gmsh project created on Thu Dec 10 10:14:52 2015

Resolution = <Resolution>;
Resolution2 = <Resolution2>;
Resolution3 = <Resolution3>;
boxposX=<boxposX>;
boxposLen=<boxposLen>;
boxposX2=(boxposX+boxposLen);
//Point(1) = {0, 0, 0, Resolution};
//Point(2) = {0, 80000, 0, Resolution};
//Point(3) = {640000, 80000, 0, Resolution};
//Point(4) = {640000, 0, 0, Resolution};
Point(1) = {0, 0, 0};
Point(2) = {0, 80000, 0};
Point(3) = {640000, 80000, 0};
Point(4) = {640000, 0, 0};

//Point(5) = {boxposX, 0, 0, Resolution2};
//Point(6) = {boxposX, 80000, 0, Resolution2};
//Point(7) = {boxposX2, 80000, 0, Resolution2};
//Point(8) = {boxposX2, 0000, 0, Resolution2};

Point(5) = {boxposX, 0, 0};
Point(6) = {boxposX, 80000, 0};
Point(7) = {boxposX2, 80000, 0};
Point(8) = {boxposX2, 0, 0};

// Surface left
Line(1) = {1, 5};
Line(2) = {5, 6};
Line(3) = {6, 2};
Line(4) = {2, 1};
Line Loop(1) = {1, 2, 3, 4};
Plane Surface(1) = {1};

//Surface central
Line(5) = {5, 8};
Line(6) = {8, 7};
Line(7) = {7, 6};
Line(8) = {6, 5};
Line Loop(2) = {5, 6, 7, 8};
Plane Surface(2) = {2};

//Surface right
Line(9) = {8, 4};
Line(10) = {4, 3};
Line(11) = {3, 7};
Line(12) = {7, 8};
Line Loop(3) = {9, 10, 11, 12};
Plane Surface(3) = {3};


Transfinite Line {6,12,8,2}=80000/Resolution2+1;
Transfinite Line {5}= boxposLen/Resolution2+1;
Transfinite Line {7}= boxposLen/Resolution2+1;
Transfinite Line {10}=80000/Resolution+1;
Transfinite Line {4}=80000/Resolution+1;
Transfinite Line {1}=boxposX/Resolution+1 Using Progression 0.98;
Transfinite Line {9}=(640000-boxposX2)/Resolution3+1 Using Progression 1/0.98;
Transfinite Line {3}=boxposX/Resolution+1 Using Progression 1/0.98;
Transfinite Line {11}=(640000-boxposX2)/Resolution3+1 Using Progression 0.98;
//Transfinite Line {1}= boxposX/Resolution+1;
//Transfinite Line {9}=(640000-boxposX2)/Resolution+1;
//Transfinite Line {3}= boxposX/Resolution+1;
//Transfinite Line {11}=(640000-boxposX2)/Resolution+1;
Transfinite Surface {2};

Physical Surface(1) = {1,2,3};

Physical Line(1) = {1,5,9};
Physical Line(2) = {10};
Physical Line(3) = {11,7,3};
Physical Line(4) = {4};
