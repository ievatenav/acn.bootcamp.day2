A = load 'data/NYSE_daily';
B = store A into 'task3_output' using PigStorage(',');
dump B;
