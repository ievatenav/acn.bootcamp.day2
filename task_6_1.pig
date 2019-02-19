A = load 'data/words.txt' as (line);
clean = foreach A generate REPLACE(line, '([^a-zA-Z0-9\\s]+)', ' ') as column;
words = foreach clean generate flatten(TOKENIZE(column)) as word;
words_unique = distinct words;
sort_asc = order words_unique by word asc;
sort_desc = order words_unique by word desc;
dump sort_asc;
dump sort_desc;
