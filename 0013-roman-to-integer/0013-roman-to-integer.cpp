class Solution {
public:
    int romanToInt(string s) {
        map<char, int> symbols;
        symbols['I'] = 1;
        symbols['V'] = 5;
        symbols['X'] = 10;
        symbols['L'] = 50;
        symbols['C'] = 100;
        symbols['D'] = 500;
        symbols['M'] = 1000;

        int sum = 0;
        for (int i = 0; i < s.length(); i++) {
            if (i + 1 < s.length() && symbols[s[i]] < symbols[s[i + 1]]) {
                sum -= symbols[s[i]];
            } else {
                sum += symbols[s[i]];
            }
        }
        return sum;
    }
};