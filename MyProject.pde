// Class: CS 3451
// Semester: Fall 2020
// Project number: 1
// Project title: Playing with Points and Vectors
// Student(s): Kaushi Chandraratna

//======================= My global variables
PImage PictureOfMyFace; // picture of author's face, should be: data/pic.jpg in sketch folder
PImage PictureOfBanner; // picture of banner, should be: data/pic.jpg in sketch folder

boolean lerp=true, spiral=true; // toggles to display vector interpoations
float b=0, c=0.5, d=1; // initial knots
int partShown = 1;
//String [] PartTitle = new String[10];
String [] PartTitle = {"?","?","?","?","?","?","?","?","?","?"};


int numberOfParts = PartTitle.length;
PNTS DrawnPoints = new PNTS(); // class containing array of points, used to standardize GUI
PNTS SmoothenedPoints = new PNTS(); // class containing array of points, used to standardize GUI
DUCKS DucksRow = new DUCKS(20);

//**************************** My text  ****************************
String title ="Class: 3451, Year: 2020, Project 1",            
       name ="Kaushi CHANDRARATNA";
String subtitle = "points and vectors";    
String guide="MyProject keys: '0' through '9' to select project parts, 'a' to start/stop animation "; // help info

//======================= my setup, executed once at the beginning 
void mySetup()
  {
  DrawnPoints.declare(); // declares all ControlPoints. MUST BE DONE BEFORE ADDING POINTS 
  SmoothenedPoints.declare(); // declares all ControlPoints. MUST BE DONE BEFORE ADDING POINTS 
  DrawnPoints.empty(); // reset pont list P
  SmoothenedPoints.empty(); // reset pont list P
  //initDucklings(); // creates Ducling[] points
  }

//======================= called in main() and executed at each frame to redraw the canvas
void showMyProject(PNT A, PNT B, PNT C, PNT D) // four points used to define 3 vectors
  {
  if(0<=partShown && partShown<numberOfParts)
    {
    switch(partShown) 
      {
      case 0: showPart0(A,B,C,D); break;
      case 1: showPart1(A,B,C,D); break;
      case 2: showPart2(A,B,C,D); break;
      case 3: showPart3(A,B,C,D); break;
      case 4: showPart4(A,B,C,D); break;
      case 5: showPart5(A,B,C,D); break;
      case 6: showPart6(A,B,C,D); break;
      case 7: showPart7(A,B,C,D); break;
      case 8: showPart8(A,B,C,D); break;
      case 9: showPart9(A,B,C,D); break;
      }
    }
  }

//====================================================================== PART 0
void showPart0(PNT A, PNT B, PNT C, PNT D) //
  {
  PartTitle[0] = "Experimenting sandbox";
  //cwf(red,4,green); 
  //VCT V = V(A,B);
  //show(A,V,dgreen,"V");
  //VCT R = R(V);
  //show(A,R,blue,"R(V)");
  //VCT W = R(V,PI/6);
  //show(A,W,dred,"R(V,π/6)");
  
  //VCT U = V(A,B);
  //VCT V = V(A,C);
  //show(A,U,dgreen,"U");
  //float w = angle(U,V);
  //float m = n(V)/n(U);
  //show(A,V,dred,"V("+nf(m,1,2)+",R(U,"+nf(w/PI,1,2)+"*PI))");
  //VCT W = V(m,R(U,w));
  //show(A,V,blue);
 
  //guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }

//====================================================================== PART 1
boolean showX=true, showY=false, showZ = false;
void showPart1(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[1] =   "X,Y,Z Completions of the Parellogram "; // https://en.wikipedia.org/wiki/Parallelogram

  cwfo(dred,5,pink,70); showLoop(A,B,C);
  if(showX){
    VCT AB = V(A,B);
    //The fourth corner, X, of the parallegram is C + AB 
    PNT X = P(C, AB);
    cwfo(dgreen,5,lime,70);
    showLoop(C,B,X);
    X.circledLabel("X");
  }
  if(showY){
    VCT BC = V(B,C);
    //The fourth corner, Y, of the parallegram is A + BC
    PNT Y = P(A, BC);
    cwfo(blue,5,cyan,70);
    showLoop(A,C,Y);
    Y.circledLabel("Y");
  }
  if(showZ){
    VCT AC = V(C,A);
    //The fourth corner, Z, of the parallegram is B + CA
    PNT Z = P(B, AC);
    cwfo(brown, 5, orange, 70);
    showLoop(B,A,Z);
    Z.circledLabel("Z");
  }
  guide = "X/Y/Z:show/hide solutions";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); // D.circledLabel("D");
  }

//====================================================================== PART 2
boolean showFermat=false;
void showPart2(PNT A, PNT B, PNT C, PNT D) //   
  {
  PartTitle[2] = "Napoleon Theorem & Fermat Point"; // https://en.wikipedia.org/wiki/Napoleon%27s_theorem
  cwf(black,3,yellow);  showLoop(A,B,C);  
  //VECTORS AB, AC, BC
  VCT AB = V(A,B); VCT AC = V(A,C); VCT BC = V(B,C);
  float w = angle(AB, AC);
  if (w > 0){
    //Triangle A'BC
    VCT AV = V(R(BC, 5*PI/3)); PNT AP = P(B, AV); cwfo(red,5, red, 70); showLoop(B,C,AP);
    //Triangle AB'C
    VCT BV = V(R(AC, PI/3)); PNT BP = P(A, BV); cwfo(dgreen,5,lime,70); showLoop(A, C, BP);
    //Triangle ABC'
    VCT CV = V(R(AB, 5*PI/3)); PNT CP = P(A, CV); cwfo(blue,5,cyan,70); showLoop(A, B, CP);;    //CONCURRENT LINES AA', BB', CC'
    if (showFermat){ cwf(black,4,black);
      if (degrees(angle(AB,V(B,BP))) < 120){ show(A,B);} 
      else if (degrees(angle(AC, V(C,CP))) > -120){ show(A,C);}
      else { show(A,AP);}
      if (degrees(angle(AB,AC)) > 120){ show(B,A);} 
      else if (degrees(angle(V(B,C), V(C,CP))) < 120){ show(B,C);}
      else {show(B,BP);}
      if (degrees(angle(V(C,A), V(A,AP)))< 120){show(C,A);} 
      else if(degrees(angle(V(C,B), V(B,BP))) > -120){ show(C,B);} 
      else { show(C,CP);}  
    } else{
      //centroid CBA
      VCT AZ = V(C,AP); VCT MM = V(1/sqrt(3), R(AZ, 11*PI/6)); PNT M = P(C,MM);   
      //centroid ACB
      VCT BX = V(A,BP); VCT NN = V(1/sqrt(3), R(BX, 11*PI/6)); PNT N = P(A,NN);
      //centroid BAC
      VCT CY = V(B,CP); VCT LL = V(1/sqrt(3), R(CY, 11*PI/6)); PNT L = P(B,LL);
      //Triangle using Centroid Points
      cwF(black, 4); showLoop(M,N,L);
      //label for centroid
      M.circledLabel("CBA");  N.circledLabel("ACB"); L.circledLabel("BAC");
    }
    //labelling
    AP.circledLabel("A'"); BP.circledLabel("B'"); CP.circledLabel("C'");
  } else{
    VCT AV = M(V(R(BC, 4*PI/3))); PNT AP = P(B, AV); cwfo(red,5, red, 70); showLoop(B,C,AP);
    VCT BV = V(R(AC, 5*PI/3)); PNT BP = P(A, BV); cwfo(dgreen,5,lime,70); showLoop(A, C, BP); 
    VCT CV = V(R(AB, PI/3)); PNT CP = P(A, CV); cwfo(blue,5,cyan,70); showLoop(A, B, CP);
    if (showFermat){cwf(black,4,black);
      if (degrees(angle(AB,V(B,BP))) > -120){ show(A,B); } 
      else if (degrees(angle(AC, V(C,CP))) < 120){ show(A,C); }
      else {show(A,AP); }
      if (degrees(angle(AB,AC)) < -120){ show(B,A); } 
      else if (degrees(angle(V(B,C), V(C,CP))) > -120){show(B,C);}
      else { show(B,BP); }
      if (degrees(angle(V(C,A), V(A,AP))) > -120){  show(C,A); } 
      else if(degrees(angle(V(C,B), V(B,BP))) < 120){ show(C,B); } 
      else { show(C,CP); }
    } else{
        //centroid CBA
        VCT AZ = V(C,AP); VCT MM = V(1/sqrt(3), R(AZ, PI/6)); PNT M = P(C,MM);      
        //centroid ACB
        VCT BX = V(A,BP); VCT NN = V(1/sqrt(3), R(BX, PI/6)); PNT N = P(A,NN);
        //centroid BAC
        VCT CY = V(B,CP); VCT LL = V(1/sqrt(3), R(CY, PI/6)); PNT L = P(B,LL);
        //Triangle using Centroid Points
        cwF(black, 4); showLoop(M,N,L);
        //label for centroid2
        M.circledLabel("CBA"); N.circledLabel("ACB"); L.circledLabel("BAC"); } 
    AP.circledLabel("A'"); BP.circledLabel("B'"); CP.circledLabel("C'");
  }
  guide="F:show/hide Napoleon/Fermat solutions, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); // D.circledLabel("D");
  }


//====================================================================== PART 3
int branches = 8;
VCT line;
float v;
void showPart3(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[3] = "Fractal Tree"; // https://en.wikipedia.org/wiki/Fermat_point
  line = V(1,0);
  //VCT AB = V(A,B);
  //VCT AC = V(A,C);
  //float w = angle(AC,AB);
  //show(A, AB, brown, nf(w/PI*180));
  VCT BA = V(B,A);
  VCT BC = V(B,C);
  float w = angle(BA, BC);
  show(B, BC, brown, nf(w/-PI*180));
  showLoop(A,B,C);
  tree(C, w, -PI/2, 200,10,branches);
  
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); //E.circledLabel("D"); //E.circledLabel("E");
}
  void tree(PNT A, float w, float a, float l, int c,  int branches) {
    if (branches==0){
      return;
    }
    VCT r = R(line, a); //rotate line by angle a
    VCT s = V(l,r); //scale line by length l
    PNT E = P(A,s);
    color c1 =c;
    stroke(c1,60,150);
    strokeWeight((branches*5)*0.3); //alter strokeweight of each branch
    show(A,E); 
    
    //flip tree when angle is negative
    if (w < 0){
      a -= -1;
    } 
    tree(E,w,a-(w*currentTime*(PI/2)), l*0.5, c + 20, branches-1); //left branch
    tree(E,w,a+(w*currentTime*(PI/2)), l*0.5, c + 20, branches-1); //right branch
    tree(E,w,a+(1.33*currentTime*0), l*0.5, c + 20, branches-1); //middle branch

  }

//====================================================================== PART 4
void showPart4(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[4] =   "Log-spiral pattern"; // https://pin.it/7wgYDeq 
  cwF(red,3); show(A,B,C);
  cwF(blue,3);
  drawSpiral(A,B,C,60);
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); //D.writeLabel("D");
  }
void drawSpiral(PNT A, PNT B, PNT C, int recursionCount)
  {
  if(recursionCount==0) return;
  PNT D = extrapolateLogSpiral(A,B,C);

 
  }
PNT extrapolateLogSpiral(PNT A, PNT B, PNT C)
  {
  VCT AB = V(A,B);
  VCT BC = V(B,C);
  
  return P(   );
  }

//====================================================================== PART 5
void showPart5(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[5] =   "Michell truss";
  int k=11, r=11;
  PNT[][] T = new PNT[r][k];
  PNT O = ScreenCenter();
  VCT V = V(O,A);
  for(int i=0; i<k; i++) T[0][i]=P(O,R(V,TWO_PI*i/k));
  cw(green,2);
  
  
  // six lines of code
  
  
 
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
  
//====================================================================== PART 6
int recursionDepth=9;  
void showPart6(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[6] =   "Recursive tree growth";
  PNT E = P(A,V(B,C));
  if(showIDs)
    {
    E.circledLabel("E");
    A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
    }
  guide="I:display IDs, ,/.:recursion depth";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }

  
  
//====================================================================== PART 7
void showPart7(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[7] =   "Cubic interpolating motion";
  cwF(cyan,5); show(A,B,C,D);
  cwF(red,3); drawNeville(A,B,C,D);
 
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
void drawNeville(PNT A, PNT B, PNT C, PNT D)
  {
  beginShape();
  
  
  endShape();
  }

  
//====================================================================== PART 8
void showPart8(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[8] =   "Polyline smoothing";
  cwF(black,3); ControlPoints.drawPolyline(); // draws polyline joining control points
  ControlPoints.drawAllVerticesInColor(3,red); // draw dots at vertices
  //if(showIDs) {cwF(blue,1); ControlPoints.writeIDsInEmptyDisks(); }
  if(showIDs) showArrowIDs();
  cwF(red,1); ControlPoints.showPickedPoint(25);
  int n = ControlPoints.pointCount();
  if(keyPressed && key=='f' && n>4)
    {
 
    }
  guide="f:iterate smoothing, I:show/hide IDs";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
    
//====================================================================== PART 9
void showPart9(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[9] =   "Smoothing while I draw";
  guide="Place. Press RMB to erase&start. Hold LMB & drag. Wait till all ducks arrive. Release.";
  PNT SmoothP = DucksRow.move(Mouse());
  if(mousePressed && (mouseButton == RIGHT))
    {
    DrawnPoints.empty(); 
    SmoothenedPoints.empty(); 
    DucksRow.init(Mouse());
    }
  if(mousePressed && (mouseButton == LEFT))
    {
    DrawnPoints.addPoint(Mouse()); 
    SmoothenedPoints.addPoint(SmoothP); 
    }
  cwF(orange,3); DrawnPoints.drawCurve();
  cwF(blue,5); SmoothenedPoints.drawCurve(); 
  DucksRow.showRow();
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
  
  


    
//======================= called when a key is pressed
void myKeyPressed()
  {
  //int k = int(key); if(47<k && k<58) partShown=int(key)-48;
  if(key=='<') {DucksRow.decrementCount(); }
  if(key=='>') {DucksRow.incrementCount(); }
  }
  
//======================= called when the mouse is dragged
void myMouseDragged()
  {
  if (keyPressed) 
    {
    //if (key=='b') b+=2.*float(mouseX-pmouseX)/width;  // adjust knot value b    
    //if (key=='c') c+=2.*float(mouseX-pmouseX)/width;  // adjust knot value c    
    //if (key=='d') d+=2.*float(mouseX-pmouseX)/width;  // adjust knot value a 
    }
  }

//======================= called when the mouse is pressed 
void myMousePressed()
  {
  if (!keyPressed) 
    {
    if(partShown==2 || partShown==3)
      {
      }
    }
  }
  
