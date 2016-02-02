# Indexer


## Mariam Tsilosani


######This is an indexing program that receives a set of files, parses through them and creates an inverted index, which maps each token found in the files to the subset of files that contain that token and also the frequency with which each token appears in each file.

######Here is an example of how indexer works:

| File Name     | File Content         |
| ------------- |:--------------------:|
| FileOne       | A dog name name Boo  |
| FileTwo       | A cat name baa       |

######After the indexer reads these files it produces the following inverted index in sorted order by words:

“a” → (“boo”, 1), (“baa”, 1)

“baa” → (“baa”, 1)

“boo” → (“boo”, 1)

“cat” → (“baa”, 1)

“dog” → (“boo”, 1)

“name” → (“boo”, 2), (“baa”, 1)

######Two names are provided by the user during the start of the program: index <inverted-index name> <directory or file name>, inverted-index name is the file where the stdout will be written. The program first checks the file permissions for all the files provided or parsed in recursion. If the result file doesnt have read and write permissions the program prints out an error message.

### Implimentation

######For storing the words there are three different structs used, one is a hash table that will hash the words (with helper functions) into appropriate locations and write them into nodes, the node struct is the one holding the words and pointers to fileNode stucts, fileNode structs hold the name of the file the word was found in and the number of times that word appeared in that file. The words hash to the appropriate locations so they are sorted in descending order right when they are hashed, the collated words in each spot of the hash table gets sorted every time a new node is added and the fileName nodes get sorted in ascending order every time each new fileName node is added. For example the first element of the linked list in row 'a' of the hash table could contain the word 'apple'. The corresponding linked list for the 'apple' node will have all of the filenames in which the word apple appears and an integer, wordCount that keeps track of the occurrences of the word in each file.

######After inserting all the found words into the one hashtable, main calls the input method that inputs all the data from the hash table into the resulting file, after the input method is done, the freeTable method is called that frees all the dynamically allocated memory (all the nodes, all the fileNodes and the hash table itself).

######The file names in the resulting file are listed as the full path names to avoid ambiguity of two files with the same name but different directories. The full path names are pretty large so each line with the file names contains only one name.

###Time Complexity:

######This program recursively loops through the directory provided, it then goes through each character
in each file (assuming that it has correct permissions). If n is the number of characters in all the files
combined The average case is O(n). The best and the worst cases of the program are also O(n) since
it has to go through every character each time the program runs.










