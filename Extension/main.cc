#include <string>
#include <iostream>
#include "nbind/nbind.h"
#include <fstream>
using namespace std;

static string createFile(std::string where, std::string name, std::string data){
  ofstream NewFile(name.append(".lua"));
  NewFile << data;
  NewFile.close();
  return "";
}
static int writeFile(std::string file, std::string newData){
  ofstream writer(file);
  if (! writer){
    cout << "Error writing .lua files" << endl;
    return -1;
  }
  writer << newData << endl;
  writer.close();
}
struct Main {
  static void newCode() {
    return;
  };

  static void getData(std::string code) {
    
  };

  static void installPlugin() {
    
  };

  static void build() {
    
  };
};

 
NBIND_CLASS(Main) {
  method(newCode);
  method(build);
  method(installPlugin);
  method(getData);
}
