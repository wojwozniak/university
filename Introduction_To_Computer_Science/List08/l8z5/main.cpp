#include <iostream>

using namespace std;

char minimax(string a) {
    if(a.length()==1) {
        return a[0];
    } else {
        char b = minimax(a.substr(0, a.length()/2));
        char c = minimax(a.substr(a.length()/2, a.length()));
        if(b < c) {
            return b;
        } else return c;
    }
}

int main() {
    string a = "89747657657879";
    cout << minimax(a);
}
