A = load 'data/words.txt' as (line);
clean = foreach A generate REPLACE(line, '([^a-zA-Z0-9\\s]+)', ' ') as column;
words = foreach clean generate flatten(TOKENIZE(column)) as word;
grpd = group words by word;
wordcount = foreach grpd generate group, COUNT(words);
wordpairs = group wordcount by $1;
dump wordpairs;
