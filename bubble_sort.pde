import java.util.*;

Line lines[];
int i=0;
final color green = color(10,240,10);

void setup(){
   size(800,400);
   lines = new Line[width/2];
   inOrderGenerate(lines);
   background(200);
}

void draw(){
  if(i<lines.length){
    background(240);
    for(int j=0; j<lines.length-1-i;j++){
      if(lines[j].h > lines[j+1].h){
        Line temp = lines[j+1];
        lines[j+1] = lines[j];
        lines[j] = temp;
      }
    }
    delay(10);
    update();
    i++;
    } else noLoop();
    
    lines[(lines.length)-i].c = green;
}

void generate(Line[] array){
  for(int i=0; i<lines.length; i++){
    int random = (int)random(1,height);
    array[i]=new Line(random);
  }
}
void inOrderGenerate(Line[] array){
  for(int i=0; i<lines.length; i++){
      array[i]=new Line(i);
  }
Collections.shuffle(Arrays.asList(array));
}
void update(){
  int i=0;
  int sps=2;
  Line line;
    while(i<lines.length){
        line = lines[i];
          strokeWeight(1.5);
        stroke(line.c);
        line(i*sps, height,i*sps,height-line.h);
        i++;
    }
  }
  void buble(Line[] arr){
  for(int i=0; i<arr.length-1;i++){
    for(int j=0; j<arr.length-1-i;j++){
      if(arr[j].h > arr[j+1].h){
        Line temp = arr[j+1];
        arr[j+1] = arr[j];
        arr[j] = temp;
      }
    }
  }
}
