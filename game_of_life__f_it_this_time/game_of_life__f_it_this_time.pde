int c = 235;  //<>//
int r = 100;
int godX=10;
int godY=10;
int [] [] aliveCell= new int [c] [r];
int [] [] aliveCellB= new int [c] [r];
int cell=5;

void setup () {
  size(1300, 600);
  background(#3D9BE9);
  for (int i = 0; i<c; i+=1) {
    for (int ii = 0; ii<r; ii+=1) {
      aliveCell[i][ii]=-1;
      fill(255);
      noStroke();
      rect (10+i*10, 10+ii*10, 9, 9);
    }
  }
}
void draw () {
  background(#3D9BE9);
  for (int i = 0; i<c; i+=1) {
    for (int ii = 0; ii<r; ii+=1) {
      if (aliveCell[i][ii]==-1) {
        fill(255);
      } else {
        fill(0);
      }
      noStroke();
      rect (10+i*cell, 10+ii*cell, cell, cell);
    }
  }
  stroke(#B705FF);
  noFill();
  rect (godX, godY, cell-1, cell-1);
  if ((keyPressed == true) && (key == 'w')) {
    for (int i = 0; i<c; i+=1) {
      for (int ii = 0; ii<r; ii+=1) {
        aliveCell[i][ii]=-1;
      }
    }
    delay(200);
  }
  if ((keyPressed == true) && (key == 'b')) {
    for (int i = 0; i<c; i+=1) {
      for (int ii = 0; ii<r; ii+=1) {
        aliveCell[i][ii]=1;
      }
    }
    delay(200);
  }
  if ((keyPressed == true) && (key == 'r')) {
    for (int i = 0; i<c; i+=1) {
      for (int ii = 0; ii<r; ii+=1) {
        aliveCell[i][ii]*=-1;
      }
    }
    delay(200);
  }
  if ((keyPressed == true) && (key == 'f')) {
    for (int i = 0; i<c; i+=1) {
      for (int ii = 0; ii<r; ii+=1) {
        if ((int) random(1, 3)<1.5) {
          aliveCell[i][ii]=1;
        } else {
          aliveCell[i][ii]=-1;
        }
      }
    }
    delay(200);
  }
  if ((keyPressed == true) && (key == 'z') && (godY>10)) {
    godY-=cell;
    delay(200);
  }
  if ((keyPressed == true) && (key == 's') && (godY<(r*cell+10))) {
    godY+=cell;
    delay(200);
  }
  if ((keyPressed == true) && (key == 'q') && (godX>10)) {
    godX-=cell;
    delay(200);
  }
  if ((keyPressed == true) && (key == 'd') && (godX<(c*cell+10))) {
    godX+=cell;
    delay(200);
  }
  if ((keyPressed == true) && (key == 'a')) {
    aliveCell[(godX-10)/cell][(godY-10)/cell]*=-1;
    delay(200);
  }
  if ((keyPressed == true) && (key == 'c')) {
    for (int i=0; i<r; i++) {
      aliveCell[(godX-10)/cell][i]*=-1;
    }
    delay(200);
  }
  if ((keyPressed == true) && (key == 't')) {
    for (int i=0; i<c; i++) {
      aliveCell[i][(godY-10)/cell]*=-1;
    }
    delay(200);
  }
  if ((keyPressed == true) && (key == 'e')) {
    for (int i = 0; i<c; i+=1) {
      for (int ii = 0; ii<r; ii+=1) {
        aliveCellB[i][ii]=cycleLife(aliveCell[i][ii], i, ii);
      }
    }
    for (int i = 0; i<c; i+=1) {
      for (int ii = 0; ii<r; ii+=1) {
        aliveCell[i][ii]=aliveCellB[i][ii];
      }
    }
    delay(0);
  }
  if ((keyPressed == true) && (key == 'x')) {
    for (int j=0; j<10; j++) {
      for (int i = 0; i<c; i+=1) {
        for (int ii = 0; ii<r; ii+=1) {
          aliveCellB[i][ii]=cycleLife(aliveCell[i][ii], i, ii);
        }
      }

      for (int i = 0; i<c; i+=1) {
        for (int ii = 0; ii<r; ii+=1) {
          aliveCell[i][ii]=aliveCellB[i][ii];
        }
      }
    }
  }
}
int cycleLife (int state, int wc, int wr) {
  int counter=0;
  int x[] = new int[8];
  x[0]=wc;
  x[4]=wc;
  if (wc==0) {
    x[5]=c-1;
    x[6]=c-1;
    x[7]=c-1;
  } else if (wc!=0) {
    x[5]=wc-1;
    x[6]=wc-1;
    x[7]=wc-1;
  }
  if (wc==c-1) {
    x[1]=0;
    x[2]=0;
    x[3]=0;
  } else if (wc!=c) {
    x[1]=wc+1;
    x[2]=wc+1;
    x[3]=wc+1;
  }
  int y[] = new int[8];
  y[2]=wr;
  y[6]=wr;
  if (wr==0) {
    y[0]=r-1;
    y[1]=r-1;
    y[7]=r-1;
  } else if (wr!=0) {
    y[0]=wr-1;
    y[1]=wr-1;
    y[7]=wr-1;
  }
  if (wr==r-1) {
    y[5]=0;
    y[4]=0;
    y[3]=0;
  } else if (wr!=r) {
    y[5]=wr+1;
    y[4]=wr+1;
    y[3]=wr+1;
  }
  for (int i=0; i!=8; i++) {
    if (aliveCell[x[i]][y[i]]==1) {
      counter+=1;
    }
  }
  if (state==1) {
    if (counter==1 || counter==0) {
      state=-1;
    } else if (counter==2 ||counter == 3) {
      state=1;
    } else if (counter>3) {
      state*=-1;
    }
  } else if (state==-1) {
    if (counter==3) {
      state*=-1;
    }
  }
  return (state);
}
