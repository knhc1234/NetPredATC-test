Sd_path = 'chemical_similarity_matrix.txt';

Sd = importdata(Sd_path);
%Sd_normalized = (Sd - min(Sd(:))) / (max(Sd(:)) - min(Sd(:)));


Adj_path = './level1_drug_ATC_mxn.txt';

Adj = importdata(Adj_path);

%Sim_path = './level4/level4_ATC_similarity_matrix.txt';

%S_ATC = importdata(Sim_path);

S_ATC = eye(14);

[prdY,Yr] = crossvalK_drugATC(Adj, Sd_normalized, S_ATC, 10);

fileID = fopen('level1_NetPred_label.txt', 'w'); % 파일 열기
fprintf(fileID, '%f\n', Yr'); % 데이터 쓰기
fclose(fileID); % 파일 닫기

fileID = fopen('level1_NetPred_pred.txt', 'w'); % 파일 열기
fprintf(fileID, '%f\n', prdY'); % 데이터 쓰기
fclose(fileID); % 파일 닫기