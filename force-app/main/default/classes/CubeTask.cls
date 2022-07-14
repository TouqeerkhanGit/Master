public class CubeTask {
    //Get the sum of the half diagonals of the two cubes, and see if it is greater than the distance between the center of the cubes.
    //Length of Diagonal of Cube = √3 lengthOfEdge
    //The overlap of two non-rotated cubes is still a 'box'. If two corner points of box A are (x,y,z) 
    //and (x',y',z') (x'>x,y'>y,z'>z) and two corner points of box B are (a,b,c) and (a',b',c') (a'>a,b'>b,c'>c) 
    //then the volume of the overlap is
    //max(min(a',x')-max(a,x),0)
    // max(min(b',y')-max(b,y),0)
    // max(min(c',z')-max(c,z),0)
    public class cube{
        public double lengthOfEdge;
        public double x {get;set;}
        public double y {get;set;}
        public double z {get;set;}
    }
    
    public static void function(){
        cube firstCube = new cube();
        cube firstCubetemp = new cube();
        firstCube.lengthOfEdge=5; firstCube.x=10; firstCube.y = 10; firstCube.z= 0;
        firstCubetemp.lengthOfEdge=5;  firstCubetemp.x=14; firstCubetemp.y = 12; firstCubetemp.z= 1;
        cube secondCube = new cube();
        cube secondCubeTemp = new cube();
        secondCube.lengthOfEdge=2; secondCube.x=9; secondCube.y =9; secondCube.z= 0;
        secondCubeTemp.lengthOfEdge=2; secondCubeTemp.x=15; secondCubeTemp.y =15; secondCubeTemp.z= 8;
        system.debug('The first cube is: '+ firstCube);
        system.debug('The second cube is: '+ secondCube);
        double distanceBetweenCubes = Math.sqrt(Math.pow((firstCube.x-secondCube.x),2)+Math.pow((firstCube.y-secondCube.y),2)+Math.pow((firstCube.z-secondCube.z),2));
        double halfDiagonalFirstCube= (Math.sqrt(3)*firstCube.lengthOfEdge)/2;
        double halfDiagonalSecondCube= (Math.sqrt(3)*secondCube.lengthOfEdge)/2;
        double sumOfHalfDiagonalOfCubes = (halfDiagonalFirstCube +halfDiagonalSecondCube);
        
        system.debug('distanceBetweenCubes   '+distanceBetweenCubes);
        system.debug('sumOfHalfDiagonalOfCubes   '+sumOfHalfDiagonalOfCubes);
        if(distanceBetweenCubes<sumOfHalfDiagonalOfCubes){
            system.debug('The cubes are intersecting!!!');
            
            //Volume
            double firstCheck= math.max(math.min(secondCubeTemp.x, firstCubetemp.x)-math.max(secondCube.x,firstCube.x), 0);		//max(min(a',x')-max(a,x),0)
            double secondCheck= math.max(math.min(secondCubeTemp.y, firstCubetemp.y)-math.max(secondCube.y, firstCube.y), 0);   //// max(min(b',y')-max(b,y),0)
            double thirdCheck = math.max(math.min(secondCubeTemp.z, firstCubetemp.z)-math.max(secondCube.z, firstCube.z), 0);  //max(min(c',z')-max(c,z),0)
            system.debug('The firstCheck '+ firstCheck);
            system.debug('The secondCheck'+ secondCheck);
            system.debug('The thirdCheck'+ thirdCheck);
            
            double sharedVolume = firstCheck*secondCheck*thirdCheck;
            
            system.debug('The shared volume of overlaped cubes is : '+ sharedVolume +'m3');
        }else{
            system.debug('The cubes are not intersecting!!!');
        }
        
    }
}