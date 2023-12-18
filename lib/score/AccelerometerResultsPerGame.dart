

class AccelerometerResultsPerGame extends Iterable<ThreeDPoint>{

  List<ThreeDPoint> _accelerometerResultsPerGame = [];

  AccelerometerResultsPerGame(){;}
  AccelerometerResultsPerGame.init(List<ThreeDPoint> accelerometerResultsPerGame){
    _accelerometerResultsPerGame = accelerometerResultsPerGame;
  }

  void add(ThreeDPoint threeDPoint){
    _accelerometerResultsPerGame.add(threeDPoint);
  }

  void clear(){
    _accelerometerResultsPerGame.clear();
  }

  //iterator
  Iterator<ThreeDPoint> get iterator => _accelerometerResultsPerGame.iterator;

  //getters
  int get length => _accelerometerResultsPerGame.length;
  ThreeDPoint get first => _accelerometerResultsPerGame.first;
  ThreeDPoint get last => _accelerometerResultsPerGame.last;
  ThreeDPoint get single => _accelerometerResultsPerGame.single;
  ThreeDPoint elementAt(int index) => _accelerometerResultsPerGame.elementAt(index);
  bool get isEmpty => _accelerometerResultsPerGame.isEmpty;
  bool get isNotEmpty => _accelerometerResultsPerGame.isNotEmpty;


}

class ThreeDPoint{
  final double x;
  final double y;
  final double z;

  ThreeDPoint(this.x, this.y, this.z);
  ThreeDPoint.def(): x = 0, y = 0, z = 0;
}