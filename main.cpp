//Author: Drashti Mehta
//Date: 09/05/2023
//Program name: 240 Section 03 Assignment 01 - Las Vegas

#include <iostream>

using namespace std;

extern "C" {
    void calc_totalTime(double *totalTime);
}

int main() {
 	
    double totalTime = 0;
    
    cout << "\nWelcome to Trip Advisor by Drashti Mehta." << endl;
    cout << "We help you plan your trip.\n" << endl;

    calc_totalTime(&totalTime);
   
    cout << "\nThe main module received this number " << totalTime << " and will keep it for a while." << endl;
    cout << "A zero will be sent to your operating system." << endl;
    cout << "Good-bye. Have a great trip.\n" << endl;

    return 0;
}

