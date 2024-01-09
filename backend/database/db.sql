INSERT INTO `credentials` VALUES (1,'admin','$2b$10$uf81JcaGONOnlL2G5Hipie9Zq8vRi9IamHJhONh7po6AuSkYJuC/K'),(2,'professor','$2b$10$oiyWq6nSnVFjaCDFx5G7a.KCKFavxIP7glDvFXIX011Ueo8tAFJ8O'),(3,'student','$2b$10$papDZm/s1a15wY97Q8ujl.qt2/AJ338MmFRQzWjKUdK39ZCO8Bbm6'),(4,'student2','$2b$10$de0nCy6gh3KIUbPsJMrrheX2sV8ftIwPGqoV3uHeLcgdrpiz3SK62'),(5,'student3','$2b$10$FqNU3e6ixsrayiNpNapcPugB6nzSp1Wthm2PtEYTf3iSSbw4oXYuS'),(6,'student4','$2b$10$KxbHn1A0mikjPWrBfvw1Y.tWAjp/pAqkYm0VeAxT8UU1upQu5J71G'),(7,'student5','$2b$10$lR52fxKC2XRmDy8qzTlzVOSkX.XCiJzv0jS2hMOHOc7eiAVmoYna.');
INSERT INTO `users` VALUES (1,'admin','Konstantinos','Kapnias',0,1),(2,'professor','Dr. Taylor','Adams',1,2),(3,'student','Jordan','Lee',2,3),(4,'student2','Morgan','Patel',2,4),(5,'student3','Riley','Chen',2,5),(6,'student4','Casey','Rodriguez',2,6),(7,'student5','Jamie','Nguyen',2,7);
INSERT INTO `subjects` VALUES (1,'JavaScript Basics','The best programming language',5,2),(2,'JavaScript for Experts','The best programming language, but now with a little more pain and caffeine overdose.',7,2);
INSERT INTO `projects` VALUES (1,'Palindrome','Create a function that takes a word as an input and checks if it is a palindrome or not. If it is a palindrome, it must return true, otherwise false. Your function must be named \'isPalindrome\'.','2023-12-17',1),(2,'Number is Prime','Create a function that checks if a number is prime or not. It must return true or false. Your main function should be named \'isPrime\'.','2024-12-14',1),(3,'Combine with Separator','Create a function that takes three string parameters. The first two must be concatenated into a single string and the third must be an optional separator. For example, the words \"Hello\" and \"World\" without an optional separator must output \"Hello World\" and if they have \"-\" as an optional separator \"Hello-World\". Your function must be named \'combineWithSeparator\'.','2024-12-22',2);
INSERT INTO `user_subject` VALUES (1,3,1),(3,4,1),(4,4,2),(5,5,1),(6,6,2);
INSERT INTO `submissions` VALUES (1,'student1Palindrome.js','function isPalindrome(word) {\r\n    var lowercasedWord = word.toLowerCase();\r\n    var cleanWord = lowercasedWord.replace(/[^a-z0-9]/g, \'\');\r\n    var reversedWord = cleanWord.split(\'\').reverse().join(\'\');\r\n    return cleanWord === reversedWord;\r\n}\r\n','2023-12-08',10,'',3,1),(2,'student2Palindrome.js','function isPalindrome(word) {\r\n    var cleanWord = word.replace(/[^a-z0-9]/g, \'\');\r\n    var reversedWord = cleanWord.split(\'\').reverse().join(\'\');\r\n    return cleanWord === reversedWord;\r\n}\r\n','2023-12-08',5,'',4,1),(3,'student3Palindrome.js','function main(word) {\r\n    var lowercasedWord = word.toLowerCase();\r\n    var cleanWord = lowercasedWord.replace(/[^a-z0-9]/g, \'\');\r\n    var reversedWord = cleanWord.split(\'\').reverse().join(\'\');\r\n    return cleanWord === reversedWord;\r\n}\r\n','2023-12-08',0,'',5,1),(4,'student3Prime.js','// Helper function 1: Check if a number is even\r\nfunction isEven(number) {\r\n    return number % 2 === 0;\r\n}\r\n\r\n// Helper function 2: Check if a number is divisible by any other number\r\nfunction isDivisibleByAny(number, divisors) {\r\n    for (var i = 0; i < divisors.length; i++)\r\n        if (number % divisors[i] === 0)\r\n            return true;\r\n\r\n    return false;\r\n}\r\n\r\n// Main function: Check if a number is a prime number\r\nfunction isPrime(number) {\r\n    if (typeof number != \'number\')\r\n        return false;\r\n    else if (number < 2)\r\n        return false;\r\n    else if (number === 2)\r\n        return true;\r\n    else if (isEven(number))\r\n        return false;\r\n\r\n\r\n    for (var i = 3; i <= Math.sqrt(number); i += 2)\r\n        if (isDivisibleByAny(number, i))\r\n            return false;\r\n\r\n    return true;\r\n}','2023-12-08',10,'',5,2),(5,'student2Prime.js','function isPrime(number) {\r\n    if (number % 2 === 0 || number === 2)\r\n        return false;\r\n    else\r\n        for (var i = 1; i <= number; i += 2)\r\n            if (number % i === 0)\r\n                return false;\r\n    \r\n    return true;\r\n}\r\n','2023-12-08',4,'',4,2),(6,'student2Combine.js','function combineWithSeparator(string1, string2, separator = undefined) {\r\n    if (!separator)\r\n        var sep = \" \"\r\n    else\r\n        var sep = separator\r\n\r\n    var result = string1 + sep + string2;\r\n\r\n    return result;\r\n}\r\n','2023-12-08',7,'',4,3),(7,'student3Combine.js','function combineWithSeparator(string1, string2, separator) {\r\n    if (typeof string1 !== \'string\' || typeof string2 !== \'string\')\r\n        return \"Invalid input: Both inputs must be strings.\";\r\n\r\n    var result = string1 + separator + string2;\r\n\r\n    return result;\r\n}\r\n','2023-12-08',NULL,'',5,3),(8,'student1Combine.js','function combineWithSeparator(separator = \" \", string1, string2) {\r\n    if (typeof string1 !== \'string\' || typeof string2 !== \'string\')\r\n        return \"Invalid input: Both inputs must be strings.\";\r\n\r\n    var result = string1 + separator + string2;\r\n\r\n    return result;\r\n}\r\n','2023-12-08',0,'',3,3);
INSERT INTO `tests` VALUES (1,'isPalindrome',1,NULL),(2,'isPalindrome',1,NULL),(3,'isPrime',2,NULL),(4,'isPrime',2,NULL),(5,'isPrime',2,NULL),(6,'combineWithSeparator',3,NULL),(7,'combineWithSeparator',3,NULL),(8,'combineWithSeparator',3,NULL);
INSERT INTO `inputs` VALUES (1,'hello',0,1),(2,'rAdar',0,2),(3,'17',0,3),(4,'4',0,4),(5,'blue',0,5),(6,'World',0,6),(7,'Hello',0,6),(8,'Hi',0,7),(9,'Everyone',0,7),(10,'.',0,7),(11,'3',0,8),(12,'false',0,8),(13,'-',0,8);
INSERT INTO `outputs` VALUES (1,'false',1),(2,'true',2),(3,'true',3),(4,'false',4),(5,'false',5),(6,'World Hello',6),(7,'Hi.Everyone',7),(8,'3.false',8);