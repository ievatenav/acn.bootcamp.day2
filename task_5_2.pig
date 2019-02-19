A = load 'data/tw.txt';
B = group A by $0;
C = foreach B generate group, COUNT(A);
outliers = filter C by $1 > 2;
dump outliers;
