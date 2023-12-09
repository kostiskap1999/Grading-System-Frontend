INSERT INTO `credentials` VALUES (1,'admin','123'),(2,'professor','456'),(3,'student','789'),(4,'student2','000');
INSERT INTO `users` VALUES (1,'admin', 'Admin','Admin', 0, 1),(2, 'professor', 'The','Professor', 1, 2),(3, 'student', 'Student','No1', 2, 3),(4, 'student2', 'Student','No2', 2, 4);
INSERT INTO `subjects` VALUES (1,'JavaScript Basics','The best programming language',5,2),(2,'JavaScript for Experts','The best programming language, but now with a little more pain and caffeine overdose.',7,2);
INSERT INTO `projects` VALUES (20,'Palindrome','Create a function that takes a word as an input and checks if it is a palindrome or not. If it is a palindrome, it must return true, otherwise false. Your function must be named \'isPalindrome\'.','2023-12-17',1),(21,'Number is Prime','Create a function that checks if a number is prime or not. It must return true or false. Your main function should be named \'isPrime\'.','2023-12-14',1),(22,'Combine with Separator','Create a function that takes three string parameters. The first two must be concatenated into a single string and the third must be an optional separator. For example, the words \"Hello\" and \"World\" without an optional separator must output \"Hello World\" and if they have \"-\" as an optional separator \"Hello-World\". Your function must be named \'combineWithSeparator\'.','2023-12-22',1);
INSERT INTO `user_subject` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,3,1),(6,4,2);
INSERT INTO `submissions` VALUES (1,'function isPalindrome(word) {\r\n    var lowercasedWord = word.toLowerCase();\r\n    var cleanWord = lowercasedWord.replace(/[^a-z0-9]/g, \'\');\r\n    var reversedWord = cleanWord.split(\'\').reverse().join(\'\');\r\n    return cleanWord === reversedWord;\r\n}\r\n','2023-12-08',NULL,'',1,20),(2,'function isPalindrome(word) {\r\n    var cleanWord = word.replace(/[^a-z0-9]/g, \'\');\r\n    var reversedWord = cleanWord.split(\'\').reverse().join(\'\');\r\n    return cleanWord === reversedWord;\r\n}\r\n','2023-12-08',NULL,'',2,20),(3,'function main(word) {\r\n    var lowercasedWord = word.toLowerCase();\r\n    var cleanWord = lowercasedWord.replace(/[^a-z0-9]/g, \'\');\r\n    var reversedWord = cleanWord.split(\'\').reverse().join(\'\');\r\n    return cleanWord === reversedWord;\r\n}\r\n','2023-12-08',NULL,'',3,20),(4,'// Helper function 1: Check if a number is even\r\nfunction isEven(number) {\r\n    return number % 2 === 0;\r\n}\r\n\r\n// Helper function 2: Check if a number is divisible by any other number\r\nfunction isDivisibleByAny(number, divisors) {\r\n    for (var i = 0; i < divisors.length; i++)\r\n        if (number % divisors[i] === 0)\r\n            return true;\r\n\r\n    return false;\r\n}\r\n\r\n// Main function: Check if a number is a prime number\r\nfunction isPrime(number) {\r\n    if (typeof number != \'number\')\r\n        return false;\r\n    else if (number < 2)\r\n        return false;\r\n    else if (number === 2)\r\n        return true;\r\n    else if (isEven(number))\r\n        return false;\r\n\r\n\r\n    for (var i = 3; i <= Math.sqrt(number); i += 2)\r\n        if (isDivisibleByAny(number, i))\r\n            return false;\r\n\r\n    return true;\r\n}','2023-12-08',NULL,'',3,21),(5,'function isPrime(number) {\r\n    if (number % 2 === 0 || number === 2)\r\n        return false;\r\n    else\r\n        for (var i = 1; i <= number; i += 2)\r\n            if (number % i === 0)\r\n                return false;\r\n    \r\n    return true;\r\n}\r\n','2023-12-08',NULL,'',2,21),(6,'function combineWithSeparator(string1, string2, separator = undefined) {\r\n    if (!separator)\r\n        var sep = \" \"\r\n    else\r\n        var sep = separator\r\n\r\n    var result = string1 + sep + string2;\r\n\r\n    return result;\r\n}\r\n','2023-12-08',NULL,'',2,22),(7,'function combineWithSeparator(string1, string2, separator) {\r\n    if (typeof string1 !== \'string\' || typeof string2 !== \'string\')\r\n        return \"Invalid input: Both inputs must be strings.\";\r\n\r\n    var result = string1 + separator + string2;\r\n\r\n    return result;\r\n}\r\n','2023-12-08',NULL,'',3,22),(8,'function combineWithSeparator(separator = \" \", string1, string2) {\r\n    if (typeof string1 !== \'string\' || typeof string2 !== \'string\')\r\n        return \"Invalid input: Both inputs must be strings.\";\r\n\r\n    var result = string1 + separator + string2;\r\n\r\n    return result;\r\n}\r\n','2023-12-08',NULL,'',1,22);
INSERT INTO `tests` VALUES (10,'isPalindrome',20,NULL),(11,'isPalindrome',20,NULL),(12,'isPrime',21,NULL),(13,'isPrime',21,NULL),(14,'isPrime',21,NULL),(15,'combineWithSeparator',22,NULL),(16,'combineWithSeparator',22,NULL),(17,'combineWithSeparator',22,NULL);
INSERT INTO `inputs` VALUES (25,'hello',0,10),(26,'rAdar',0,11),(27,'17',0,12),(28,'4',0,13),(29,'blue',0,14),(30,'World',0,15),(31,'Hello',0,15),(32,'Hi',0,16),(33,'Everyone',0,16),(34,'.',0,16),(35,'3',0,17),(36,'false',0,17),(37,'-',0,17);
INSERT INTO `outputs` VALUES (9,'false',10),(10,'true',11),(11,'true',12),(12,'false',13),(13,'false',14),(14,'World Hello',15),(15,'Hi.Everyone',16),(16,'3.false',17);