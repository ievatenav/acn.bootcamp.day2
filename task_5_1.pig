A = load 'data/tw.txt';
B = group A by $0;
C = foreach B generate group, COUNT(A);
dump C;
