$fn=400;              // Smooth cylinders

height    =  60;
width     = 164.4;
thickness =   6;

z = 170; //166
h = 260/2;
w = h * 36/24;




difference()
{
union()
{
difference()
{
  union()
  {
    rotate_extrude(angle=360,convexity=10) polygon(points=[[(width-thickness)/2,10],[(width-thickness)/2,13],[-1.0+(width-thickness)/2,11.0],[(width-thickness)/2,10]]);
    braces();
    cylinder(r = width/2, h=10);
  }
  cylinder(r = (width-thickness)/2, h=10);
  clamp_holes();
  rotate([0,0,a148+a20]) 
  hull()
  {
    translate([-6,0, -2+15])rotate([90,0,0])cylinder(180,3,3,true);
    translate([-6,0,+13+15])rotate([90,0,0])cylinder(180,3,3,true);
    translate([+6,0, -2+15])rotate([90,0,0])cylinder(180,3,3,true);
    translate([+6,0,+13+15])rotate([90,0,0])cylinder(180,3,3,true);
  }
  rotate([0,0,-a148-a20]) 
  hull()
  {
    translate([-6,0, -2+15])rotate([90,0,0])cylinder(180,3,3,true);
    translate([-6,0,+13+15])rotate([90,0,0])cylinder(180,3,3,true);
    translate([+6,0, -2+15])rotate([90,0,0])cylinder(180,3,3,true);
    translate([+6,0,+13+15])rotate([90,0,0])cylinder(180,3,3,true);
  }
}
difference()
{
  union()
  { 
    cylinder(r = width/2, h=70);
  }
  cylinder(r = (width-thickness)/2, h=70);
  polyhedron(
    points=[ [w,h,z],[w,-h,z],[-w,-h,z],[-w,h,z], // the four points at base
             [0,0,-76]  ],                                 // the apex point 
    faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
            [1,0,3],[2,1,3] ]                         // two triangles for square base
    );
  rotate([0,0,a148+a20]) 
  hull()
  {
    translate([-6,0, -2+15])rotate([90,0,0])cylinder(180,3,3,true);
    translate([-6,0,+13+15])rotate([90,0,0])cylinder(180,3,3,true);
    translate([+6,0, -2+15])rotate([90,0,0])cylinder(180,3,3,true);
    translate([+6,0,+13+15])rotate([90,0,0])cylinder(180,3,3,true);
  }
  rotate([0,0,-a148-a20]) 
  hull()
  {
    translate([-6,0, -2+15])rotate([90,0,0])cylinder(180,3,3,true);
    translate([-6,0,+13+15])rotate([90,0,0])cylinder(180,3,3,true);
    translate([+6,0, -2+15])rotate([90,0,0])cylinder(180,3,3,true);
    translate([+6,0,+13+15])rotate([90,0,0])cylinder(180,3,3,true);
  }
  clamp_holes();
}
}
// The following line creates a sectioned view
// translate([-100,0,0])cube(size = [200,100,100], center = false);
}

//construction();


// create construction lines on the required geometry
// these will need to be removed from the final rendering

h2   = 0.2; r2 = width/2;
a30  =  28*360/(2*width*3.1415927);
a75  =  72*360/(2*width*3.1415927);
a148 = 144*360/(2*width*3.1415927);
a50 =   48*360/(2*width*3.1415927);
a20 =   18*360/(2*width*3.1415927);
a2  =    2*360/(2*width*3.1415927);

module braces()
{
rotate([0,0,a75+a20+a2]) brace();
rotate([0,0,-a75-a20-a2]) brace();
rotate([0,0,a75+a20+a2+180]) brace();
rotate([0,0,-a75-a20-a2+180]) brace();
}

module clamp_holes()
{
rotate([0,0,a75+a20+a2]) clamp_hole();
rotate([0,0,-a75-a20-a2]) clamp_hole();
rotate([0,0,a75+a20+a2+180]) clamp_hole();
rotate([0,0,-a75-a20-a2+180]) clamp_hole();
}  

module clamp_hole()
{
  translate([0,0,5])rotate([0,90,0])cylinder(r=1.25,h=width);
}


module brace ()
{
  step = 0.0001;
  brace_thickness = 2;
  hull()
  {
    rotate([0,0,-a30])rotate_extrude(angle=2*a30,convexity=10)polygon(points=[[r2+step,0],[r2+step,10],[r2,10],[r2,0]]);
    rotate([0,0,-a20])rotate_extrude(angle=2*a20,convexity=10)polygon(points=[[r2+brace_thickness,0],[r2+brace_thickness,10],[r2+brace_thickness-step,10],[r2+brace_thickness-step,0]]);
  }
}
//rotate([0,0,-a30+a75+a20+a2])rotate_extrude(angle=2*a30,convexity=10)polygon(points=[[r2+2,0],[r2+2,10],[r2,10],[r2,0]]);

module construction(){
difference() {translate([0,0,10])cylinder(r=r2+h2,h=h2);translate([0,0,10])cylinder(r=r2,h=h2);}  
difference() {translate([0,0,15])cylinder(r=r2+h2,h=h2);translate([0,0,15])cylinder(r=r2,h=h2);}  
difference() {translate([0,0,20])cylinder(r=r2+h2,h=h2);translate([0,0,20])cylinder(r=r2,h=h2);}  
difference() {translate([0,0,30])cylinder(r=r2+h2,h=h2);translate([0,0,30])cylinder(r=r2,h=h2);}  
difference() {translate([0,0,70])cylinder(r=r2+h2,h=h2);translate([0,0,70])cylinder(r=r2,h=h2);}  

rotate([0,0,-a30]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0, a30]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0,-a75]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0, a75]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0,-a30+180]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0, a30+180]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0,-a75+180]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0, a75+180]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0,-a148+90]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0, a148+90]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0,-a50 +90]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0, a50 +90]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0,-a148+270]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0, a148+270]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0,-a50 +270]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
rotate([0,0, a50 +270]) rotate_extrude(angle=h2,convexity=10) polygon(points=[[r2+h2,0],[r2+h2,70],[r2,70],[r2,0]]);
}