#include <string>
#include <iostream>
#include <nbind>

struct Main {
  static void newCode() {
    
  }, 

  static void getData(std::string code) {
    
  },

  static void installPlugin() {
    
  },

  static void build() {
    
  },
};

 
NBIND_CLASS(Main) {
  method(sayHello);
}
