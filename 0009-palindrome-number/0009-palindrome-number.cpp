class Solution {
public:
    bool isPalindrome(int x) {
    string  num= to_string(x);
      string rev;  
      for (int i= num.length()-1 ; i>=0 ; i--){
        rev+=num[i];
      }
      if (rev==num){
        return true ;
      }
      else {
        return false;
      }
    }
};