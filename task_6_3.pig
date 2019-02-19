A = load 'data/words.txt' as (line);
clean = foreach A generate REPLACE(line, '([^a-zA-Z0-9\\s]+)', ' ') as column;
words = foreach clean generate flatten(TOKENIZE(column)) as word;
substr  = foreach words generate SUBSTRING(word, 0, 1) as letter;
word_group = group substr by letter;
word_count = foreach word_group generate group, COUNT(substr);
dump word_count;

