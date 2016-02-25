Resolution = <Resolution>;
Point(1) = {0, 0, 0, Resolution};
Point(2) = {0, 80000, 0, Resolution};
Point(3) = {640000, 80000, 0, Resolution};
Point(4) = {640000, 0, 0, Resolution};
Point(5) = {400000, 0, 0, 100.0};
Point(6) = {400000, 80000, 0, 100.0};
Point(7) = {500000, 80000, 0, 100.0};
Point(8) = {500000, 0000, 0, 100.0};
Line(1) = {1, 4};
Line(2) = {4, 3};
Line(3) = {3, 2};
Line(4) = {2, 1};
Line(5) = {1, 5};
Line(6) = {5, 6};
Line(7) = {6, 2};
Line(8) = {5, 8};
Line(9) = {8, 7};
Line(10) = {7, 6};
Line(11) = {6, 5};
Line(12) = {8, 4};
Line(13) = {3, 7};
Line(14) = {7, 8};
Line Loop(15) = {3, 4, 1, 2};
Plane Surface(16) = {15};
Physical Surface(1) = {16};

Physical Line(1) = {1};
Physical Line(2) = {2};
Physical Line(3) = {3};
Physical Line(4) = {4};

Transfinite Line {8,9,10,11}=50;
Transfinite Surface {16};