abstract class Subject {
  void register(Observer observer);
  void unregister(Observer observer);
  void notifyObserver();
}

abstract class Observer {
  void update(double imbPrice, double aaplePrice, double googPrice);
}

class StockGrabber implements Subject {
  List<Observer> _observers;
  double _imbPrice = 0.0;
  double _aaplePrice = 0.0;
  double _googPrice = 0.0;

  StockGrabber() {
    _observers = new List<Observer>();
  }

  @override
  void register(Observer observerToRegister) {
    _observers.add(observerToRegister);
  }

  @override
  void unregister(Observer observerToDelete) {
    final int ObserverIndex = _observers.indexOf(observerToDelete);
    _observers.removeAt(ObserverIndex);
  }

  @override
  void notifyObserver() {
    for (Observer observer in _observers) {
      observer.update(_imbPrice, _aaplePrice, _googPrice);
    }
  }

  set ibmPrice(double newPrice) {
    this._imbPrice = newPrice;
    notifyObserver();
  }

  set applPrice(double newPrice) {
    this._aaplePrice = newPrice;
    notifyObserver();
  }

  set googPrice(double newPrice) {
    this._googPrice = newPrice;
    notifyObserver();
  }
}

class StockObserver implements Observer {
  double _ibmPrice;
  double _aaplPrice;
  double _googlPrice;
  static int _observerIdTracker = 0;
  int _observerId;
  Subject _stockGrabber;

  StockObserver(Subject stockGrabber) {
    _stockGrabber = stockGrabber;
    _observerId = ++_observerIdTracker;
    stockGrabber.register(this);
  }
  @override
  void update(double imbPrice, double aaplePrice, double googPrice) {
    _ibmPrice = imbPrice;
    _aaplPrice = aaplePrice;
    _googlPrice = googPrice;

    printPrices();
  }

  void printPrices() {
    print(
        '$_observerId  \nIbm: $_ibmPrice\n Apple $_aaplPrice \n Google $_googlPrice');
  }
}

void main() {
  StockGrabber stockGrabber = new StockGrabber();
  StockObserver observer1 = new StockObserver(stockGrabber);
  stockGrabber.applPrice = 19.0;
  stockGrabber.ibmPrice = 189.0;
  stockGrabber.googPrice = 894.0;
}
