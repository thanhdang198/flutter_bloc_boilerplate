library regex;

RegExp phoneRegex = RegExp(r'^(84|0[3|5|7|8|9])+([0-9]{8,9})\b$');
RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
