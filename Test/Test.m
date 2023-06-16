% i = 몇 년치의 데이터를 만들 건지. j = 월 k = 일 l = 시
Month = []; %Month 0 by 0 행렬 만들기
Grid = [];
LT = []; %Load Time

Time = ["L" "M" "H"];
% Time(1) = "L";     %Light Load Time
% Time(2) = "M";  %Middle Load Time
% Time(3) = "H";    %Peak Load Time

y = 2021;   %시작 년도
i = 5;      %i 년치 데이터 만들기
i = i - 1;
for i = 0:i;
    for j = 1:12;
    % 1~7월 식
    if j <= 7;
        if mod(y+i,4) == 0;              %윤년 만드는 식
            if j == 2;
                for k = 1:29;
                    for l = 00:23;
                        time = datetime(y + i,j,k,l,00,00);
                        Day(l+1,1) = time;
                        if l<9;
                            lt(l+1,1) = Time(1);
                        elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            lt(l+1,1) = Time(2);
                        elseif (l>=10&l<12) | (l>=13&l<17);
                            lt(l+1,1) = Time(3);
                        elseif l>=23;
                            lt(l+1,1) = Time(1);
                        end
                    end
                    Day = flipud(Day);
                    Month = vertcat(Day,Month);
                    LT = vertcat(lt,LT);
                end
            %윤년의 1~7월 중 홀수 월
            elseif mod(j,2) == 1;
                % 봄
                if j/3>=1 & j/3<2
                    for k = 1:31;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            if l<9;
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&l<12) | (l>=13&l<17);
                                lt(l+1,1) = Time(3);
                            elseif l>=23;
                                lt(l+1,1) = Time(1);
                            end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        LT = vertcat(lt,LT);
                    end
                %여름
                elseif j/3>=2
                    for k = 1:31;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            if l<9;
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&l<12) | (l>=13&l<17);
                                lt(l+1,1) = Time(3);
                            elseif l>=23;
                                lt(l+1,1) = Time(1);
                            end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        LT = vertcat(lt,LT);
                    end
                %겨울
                else
                    for k = 1:31;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            if l<9;
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&l<12) | (l>=13&l<17);
                                lt(l+1,1) = Time(3);
                            elseif l>=23;
                                lt(l+1,1) = Time(1);
                            end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        LT = vertcat(lt,LT);
                    end
                end
            %윤년의 1~7월 중 짝수 월
            elseif mod(j,2) == 0;
                %봄 
                if j/3>=1 & j/3<2
                    for k = 1:30;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            if l<9;
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&l<12) | (l>=13&l<17);
                                lt(l+1,1) = Time(3);
                            elseif l>=23;
                                lt(l+1,1) = Time(1);
                            end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        LT = vertcat(lt,LT);
                    end
                %여름 
                elseif j/3>=2
                    for k = 1:30;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            if l<9;
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&l<12) | (l>=13&l<17);
                                lt(l+1,1) = Time(3);
                            elseif l>=23;
                                lt(l+1,1) = Time(1);
                            end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        LT = vertcat(lt,LT);
                    end
                end
            end
        else
        % 윤년이 아닌 해의 식----------------------------------------------
        if j == 2;       %2월
            for k = 1:28;
                for l = 00:23;
                    time = datetime(y + i,j,k,l,00,00);
                    Day(l+1,1) = time;                   %Day를 '일' 단위 행렬로 만듬
                    if l<9;
                        lt(l+1,1) = Time(1);
                    elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                        lt(l+1,1) = Time(2);
                    elseif (l>=10&l<12) | (l>=13&l<17);
                        lt(l+1,1) = Time(3);
                    elseif l>=23;
                        lt(l+1,1) = Time(1);
                    end
                end
                Day = flipud(Day);                       %Day행렬을 위아래 반대로 뒤집음
                Month = vertcat(Day, Month);             %Month를 '월' 단위 행렬로 만듬
                LT = vertcat(lt,LT);
            end
        %1~7월 중 홀수 월
        elseif mod(j,2) == 1;
            %봄
            if j/3>=1 & j/3<2
                for k = 1:31;
                    for l = 00:23;
                        time = datetime(y + i,j,k,l,00,00);
                        Day(l+1,1) = time;
                        if l<9;
                            lt(l+1,1) = Time(1);
                        elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            lt(l+1,1) = Time(2);
                        elseif (l>=10&l<12) | (l>=13&l<17);
                            lt(l+1,1) = Time(3);
                        elseif l>=23;
                            lt(l+1,1) = Time(1);
                        end
                    end
                    Day = flipud(Day);
                    Month = vertcat(Day, Month);
                    LT = vertcat(lt,LT);
                end
            %여름
            elseif j/3>=2
                for k = 1:31;
                    for l = 00:23;
                        time = datetime(y + i,j,k,l,00,00);
                        Day(l+1,1) = time;
                        if l<9;
                            lt(l+1,1) = Time(1);
                        elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            lt(l+1,1) = Time(2);
                        elseif (l>=10&l<12) | (l>=13&l<17);
                            lt(l+1,1) = Time(3);
                        elseif l>=23;
                            lt(l+1,1) = Time(1);
                        end
                    end
                    Day = flipud(Day);
                    Month = vertcat(Day, Month);
                    LT = vertcat(lt,LT);
                end
            %겨울
            else
                for k = 1:31;
                    for l = 00:23;
                        time = datetime(y + i,j,k,l,00,00);
                        Day(l+1,1) = time;
                        if l<9;
                            lt(l+1,1) = Time(1);
                        elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            lt(l+1,1) = Time(2);
                        elseif (l>=10&l<12) | (l>=13&l<17);
                            lt(l+1,1) = Time(3);
                        elseif l>=23;
                            lt(l+1,1) = Time(1);
                        end
                    end
                    Day = flipud(Day);
                    Month = vertcat(Day, Month);
                    LT = vertcat(lt,LT);
                end
            end
        %1~7월 중 짝수 월
        elseif mod(j,2) == 0;
            %봄
            if j/3>=1 & j/3<2
                for k = 1:30;
                    for l = 00:23;
                        time = datetime(y + i,j,k,l,00,00);
                        Day(l+1,1) = time;
                        if l<9;
                            lt(l+1,1) = Time(1);
                        elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            lt(l+1,1) = Time(2);
                        elseif (l>=10&l<12) | (l>=13&l<17);
                            lt(l+1,1) = Time(3);
                        elseif l>=23;
                            lt(l+1,1) = Time(1);
                        end
                    end
                    Day = flipud(Day);
                    Month = vertcat(Day, Month);
                    LT = vertcat(lt,LT);
                end
            %여름
            elseif j/3>=2
                for k = 1:30;
                    for l = 00:23;
                        time = datetime(y + i,j,k,l,00,00);
                        Day(l+1,1) = time;
                        if l<9;
                            lt(l+1,1) = Time(1);
                        elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            lt(l+1,1) = Time(2);
                        elseif (l>=10&l<12) | (l>=13&l<17);
                            lt(l+1,1) = Time(3);
                        elseif l>=23;
                            lt(l+1,1) = Time(1);
                        end
                    end
                    Day = flipud(Day);
                    Month = vertcat(Day, Month);
                    LT = vertcat(lt,LT);
                end
            end
        end
        end
    end
    % 8월 시작
    if j > 7;
        % 짝수 월(8,10,12)
        if mod(j,2) == 0;
            if j/4==2      %8월
                for k = 1:31;
                    for l = 00:23;
                        time = datetime(y + i,j,k,l,00,00);
                        Day(l+1,1) = time;
                        if l<9;
                            lt(l+1,1) = Time(1);
                        elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            lt(l+1,1) = Time(2);
                        elseif (l>=10&l<12) | (l>=13&l<17);
                            lt(l+1,1) = Time(3);
                        elseif l>=23;
                            lt(l+1,1) = Time(1);
                        end
                    end
                    Day = flipud(Day);
                    Month = vertcat(Day, Month);
                    LT = vertcat(lt,LT);
                end
            elseif j/4>2 & j/4<3      %10월
                for k = 1:31;
                    for l = 00:23;
                        time = datetime(y + i,j,k,l,00,00);
                        Day(l+1,1) = time;
                        if l<9;
                            lt(l+1,1) = Time(1);
                        elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            lt(l+1,1) = Time(2);
                        elseif (l>=10&l<12) | (l>=13&l<17);
                            lt(l+1,1) = Time(3);
                        elseif l>=23;
                            lt(l+1,1) = Time(1);
                        end
                    end
                    Day = flipud(Day);
                    Month = vertcat(Day, Month);
                    LT = vertcat(lt,LT);
                end
            elseif j/4==3     %12월
                for k = 1:31;
                    for l = 00:23;
                        time = datetime(y + i,j,k,l,00,00);
                        Day(l+1,1) = time;
                        if l<9;
                            lt(l+1,1) = Time(1);
                        elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            lt(l+1,1) = Time(2);
                        elseif (l>=10&l<12) | (l>=13&l<17);
                            lt(l+1,1) = Time(3);
                        elseif l>=23;
                            lt(l+1,1) = Time(1);
                        end
                    end
                    Day = flipud(Day);
                    Month = vertcat(Day, Month);
                    LT = vertcat(lt,LT);
                end
            end
        %홀수 월(9,11)
        elseif mod(j,2) ==1;
            if j/3==3      %9월
                for k = 1:30;
                    for l = 00:23;
                        time = datetime(y + i,j,k,l,00,00);
                        Day(l+1,1) = time;
                        if l<9;
                            lt(l+1,1) = Time(1);
                        elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            lt(l+1,1) = Time(2);
                        elseif (l>=10&l<12) | (l>=13&l<17);
                            lt(l+1,1) = Time(3);
                        elseif l>=23;
                            lt(l+1,1) = Time(1);
                        end
                    end
                    Day = flipud(Day);
                    Month = vertcat(Day, Month);
                    LT = vertcat(lt,LT);
                end
            elseif j/3>3
                for k = 1:30;
                    for l = 00:23;
                        time = datetime(y + i,j,k,l,00,00);
                        Day(l+1,1) = time;
                        if l<9;
                            lt(l+1,1) = Time(1);
                        elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            lt(l+1,1) = Time(2);
                        elseif (l>=10&l<12) | (l>=13&l<17);
                            lt(l+1,1) = Time(3);
                        elseif l>=23;
                            lt(l+1,1) = Time(1);
                        end
                    end
                    Day = flipud(Day);
                    Month = vertcat(Day, Month);
                    LT = vertcat(lt,LT);
                end
            end
        end
    end
    end
    if j == 12 & k == 31 & l == 23;           %다음 해 가는 식
        i = i + 1;
    end
end

Year = flipud(Month);

% 현재부하시간대 + 다음부하시간대 만드는 식---------------------------------
m = length(LT);

for m = 1:m-1
    if LT(m+1) == Time(1)   %L_LT
        Load_Time(m) = append(LT(m),LT(m+1));
    elseif LT(m+1) == Time(2)
        Load_Time(m) = append(LT(m),LT(m+1));
    elseif LT(m+1) == Time(3)
        Load_Time(m) = append(LT(m),LT(m+1));
    end
end

Load_Time(length(LT)) = LT(length(LT));

Load_Time = Load_Time';

% 가우시안 전력 만드는 식 -------------------------------------------------

m = length(Load_Time); % m 초기화

pattern1 = "L";
pattern2 = "M";
pattern3 = "H";

for i = 1:m
    if Load_Time(i).startsWith(pattern1) == 1
        Gaussian_Grid(i) = normrnd(50,25);
        if Gaussian_Grid(i) < 1 
            Gaussian_Grid(i) = 0;
        elseif Gaussian_Grid(i) > 300
            Gaussian_Grid(i) = 300;
        end
    elseif Load_Time(i).startsWith(pattern2) == 1
        Gaussian_Grid(i) = normrnd(150,25);
        if Gaussian_Grid(i) < 1 
            Gaussian_Grid(i) = 0;
        elseif Gaussian_Grid(i) > 300
            Gaussian_Grid(i) = 300;
        end
    elseif Load_Time(i).startsWith(pattern3) == 1
        Gaussian_Grid(i) = normrnd(250,25);
        if Gaussian_Grid(i) < 1 
            Gaussian_Grid(i) = 0;
        elseif Gaussian_Grid(i) > 300
            Gaussian_Grid(i) = 300;
        end
    end
end

Gaussian_Grid = Gaussian_Grid';

%가우시안 전력 추적
Tracking_Gaussian_Grid = reshape(Gaussian_Grid,24,m/24);

%Gausian_Grid의 추적(24 by m/24)
Tracking_Gaussian_Grid = Tracking_Gaussian_Grid'; 

%Gausian_Grid의 소수점 버림
Gaussian_Grid = fix(Gaussian_Grid); 

% Gausian_Grid의 Level화---------------------------------------------------
m = length(Gaussian_Grid);
Level = [];
State_Level = [];

for m = 1:m
    if Gaussian_Grid(m)<50
        Level(m) = "0";
    elseif Gaussian_Grid(m)>=50 && Gaussian_Grid(m)<100
        Level(m) = "1";
    elseif Gaussian_Grid(m)>=100 && Gaussian_Grid(m)<150
        Level(m) = "2";
    elseif Gaussian_Grid(m)>=150 && Gaussian_Grid(m)<200
        Level(m) = "3";
    elseif Gaussian_Grid(m)>=200 && Gaussian_Grid(m)<250
        Level(m) = "4";
    elseif Gaussian_Grid(m)>=250 && Gaussian_Grid(m)<=300
        Level(m) = "5";
    end
end

Level = Level';

for m = 1:m
    if Gaussian_Grid(m)<50
        State_Level(1) = "0";
    elseif Gaussian_Grid(m)>=50 && Gaussian_Grid(m)<100
        State_Level(2) = "1";
    elseif Gaussian_Grid(m)>=100 && Gaussian_Grid(m)<150
        State_Level(3) = "2";
    elseif Gaussian_Grid(m)>=150 && Gaussian_Grid(m)<200
        State_Level(4) = "3";
    elseif Gaussian_Grid(m)>=200 && Gaussian_Grid(m)<250
        State_Level(5) = "4";
    elseif Gaussian_Grid(m)>=250 && Gaussian_Grid(m)<=300
        State_Level(6) = "5";
    end
end

State_Level = State_Level';                 %State_Level = 0~5 레벨
State_Level = num2str(State_Level);

% Grid에 해당하는 State만들기----------------------------------------------


Level = num2str(Level); % Level을 double to string

for m = 1:m
    State(m) = append(Load_Time(m),Level(m));
end

State = State';


% Q_State 만들기 식--------------------------------------------------------
Time = Time';     %10번째 줄 Time의 전치 행렬

for n = 1:length(Time)
    for o = 1:length(Time)
        State_Time(n,o) = append(Time(n),Time(o));
%         for p = 1:length(State_Level)
%             Q_State(o,p) = append(State_Time(o),State_Level(p));
%         end
    end
end

State_Time = reshape(State_Time.' ,length(Time)*length(Time),1);

for p = 1:length(State_Time)
    for q = 1:length(State_Level)
        Q_State(p,q) = append(State_Time(p),State_Level(q));
    end
end

Q_State = reshape(Q_State.' , length(State_Time)*length(State_Level),1);
% Q_Action ----------------------------------------------------------------

Action_varTypes = {'double','double','double','double','double'};        %열 var의 type
Action_varNames = {'action 0', 'action 1', 'action 2', 'action 3', 'action 4'}; %열 이름
Action_sz = [length(Q_State) length(Action_varNames)];                 %21 by 4 행렬

% Q_Table -----------------------------------------------------------------

Q_Table = table('Size',Action_sz,'RowNames',Q_State,'VariableTypes',Action_varTypes,'VariableNames',Action_varNames);

% 전력 비용 ---------------------------------------------------------------

Vehicle_Cost = 170;

for i = 1:m
    if State(i).startsWith(pattern1) == 1
        State_Cost(i) = 80;
    elseif State(i).startsWith(pattern2) == 1
        State_Cost(i) = 130;
    elseif State(i).startsWith(pattern3) == 1
        State_Cost(i) = 200;
    end
end
State_Cost = State_Cost';

% LevelTable 만드는 식 ----------------------------------------------------

LevelTable = timetable(Year,Gaussian_Grid,State,State_Cost);

% -------------------------------------------------------------------------
alpha = 0.1;
gamma = 0.9;
epsilon = 0.1;

Q_Table.Properties.VariableNames(1) = {'0'};
Action_0 = cell2mat(Q_Table.Properties.VariableNames(1));
Action_0 = str2double(Action_0);
Q_Table.Properties.VariableNames(2) = {'1'};
Action_1 = cell2mat(Q_Table.Properties.VariableNames(2));
Action_1 = str2double(Action_1);
Q_Table.Properties.VariableNames(3) = {'2'};
Action_2 = cell2mat(Q_Table.Properties.VariableNames(3));
Action_2 = str2double(Action_2);
Q_Table.Properties.VariableNames(4) = {'3'};
Action_3 = cell2mat(Q_Table.Properties.VariableNames(4));
Action_3 = str2double(Action_3);
Q_Table.Properties.VariableNames(5) = {'4'};
Action_4 = cell2mat(Q_Table.Properties.VariableNames(5));
Action_4 = str2double(Action_4);

Action = [Action_0 Action_1 Action_2 Action_3 Action_4];

% Q_Table initializing-----------------------------------------------------

Init = 1000000;

for i = 1:length(Q_Table.Row)
    for j = 1:length(Q_Table.Properties.VariableNames)
        Q_Table(i,j) = num2cell(Init);
    end
end

% Q_Learning --------------------------------------------------------------

Random_Action = [1 2 3 4 5];

format long

Q_Table_3D = table2array(Q_Table);

for i = 1:length(Q_Table.Row)
    for j = 1:5 % j는 소켓 갯수 수(0~4)
        if startsWith(cell2mat(Q_Table.Row(i)),"L")
            if endsWith(cell2mat(Q_Table.Row(i)),"0")
                Init_Reward = max((25 - 50*(j-1)),0)*80 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"1")
                Init_Reward = max((75 - 50*(j-1)),0)*80 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"2")
                Init_Reward = max((125 - 50*(j-1)),0)*80 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"3")
                Init_Reward = max((175 - 50*(j-1)),0)*80 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"4")
                Init_Reward = max((225 - 50*(j-1)),0)*80 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"5")
                Init_Reward = max((275 - 50*(j-1)),0)*80 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            end
        elseif startsWith(cell2mat(Q_Table.Row(i)),"M")
            if endsWith(cell2mat(Q_Table.Row(i)),"0")
                Init_Reward = max((25 - 50*(j-1)),0)*130 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"1")
                Init_Reward = max((75 - 50*(j-1)),0)*130 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"2")
                Init_Reward = max((125 - 50*(j-1)),0)*130 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"3")
                Init_Reward = max((175 - 50*(j-1)),0)*130 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"4")
                Init_Reward = max((225 - 50*(j-1)),0)*130 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"5")
                Init_Reward = max((275 - 50*(j-1)),0)*130 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            end
        elseif startsWith(cell2mat(Q_Table.Row(i)),"H")
            if endsWith(cell2mat(Q_Table.Row(i)),"0")
                Init_Reward = max((25 - 50*(j-1)),0)*200 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+(alpha*(Init_Reward)));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"1")
                Init_Reward = max((75 - 50*(j-1)),0)*200 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+(alpha*(Init_Reward)));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"2")
                Init_Reward = max((125 - 50*(j-1)),0)*200 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"3")
                Init_Reward = max((175 - 50*(j-1)),0)*200 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"4")
                Init_Reward = max((225 - 50*(j-1)),0)*200 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            elseif endsWith(cell2mat(Q_Table.Row(i)),"5")
                Init_Reward = max((275 - 50*(j-1)),0)*200 + 50*(j-1)*Vehicle_Cost;
                Q_Table(i,j) = num2cell((1-alpha)*table2array(Q_Table(i,j))+alpha*(Init_Reward));
            end
        end
    end
end







for a = 1:1
    for i = 1:length(LevelTable.Gaussian_Grid) - 2
        for j = 1:length(Q_Table.Row)
            if LevelTable.State(i) == cell2mat(Q_Table.Row(j))
                % for l = 1:3
                    if rand < (1-epsilon) % 1-입실론 그리디에 의한 액션
                        Minus_Epsilon_Action = find(min(table2array(Q_Table(j,:))) == table2array(Q_Table(j,:)));
                        if length(Minus_Epsilon_Action) == 1 %현재 스테이트의 최솟값이 하나일 때
                            [J,K] = min(table2array(Q_Table(j,:)));
                            Reward = ((max((LevelTable.Gaussian_Grid(i)-(50*Action(K))),0)*LevelTable.State_Cost(i)) + ((50*Action(K))*Vehicle_Cost));
                            Immediately_Reward(i,1) = Reward;
                            Q_Table(j,K) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),K)))) + (alpha*(Reward + (gamma*(min(table2array(Q_Table(LevelTable.State(i+1),:))))))));                    
                            % disp("1min")
                            % disp(Q_Table(j,K))
                            Q_Table_3D(:,:,i+1) = 0;
                            if table2array(Q_Table(j,K)) ~= Q_Table_3D(j,K,i+1)
                                Q_Table_3D(j,K,i+1) = table2array(Q_Table(j,K));
                            end
                        else %현재 스테이트의 최솟값이 여러개일 때
                            Minus_Epsilon_Action_Random_Min = randi(length(Minus_Epsilon_Action),1);
                            K = Minus_Epsilon_Action(Minus_Epsilon_Action_Random_Min);
                            Reward = ((max((LevelTable.Gaussian_Grid(i)-(50*Action(K))),0)*LevelTable.State_Cost(i)) + ((50*Action(K))*Vehicle_Cost));
                            Immediately_Reward(i,1) = Reward;
                            Q_Table(j,K) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),K)))) + (alpha*(Reward + (gamma*(min(table2array(Q_Table(LevelTable.State(i+1),:))))))));                    
                            % disp("minsss")
                            % disp(Q_Table(j,K))
                            Q_Table_3D(:,:,i+1) = 0;
                            if table2array(Q_Table(j,K)) ~= Q_Table_3D(j,K,i+1)
                                Q_Table_3D(j,K,i+1) = table2array(Q_Table(j,K));
                            end
                        end
                    else %입실론 그리디에 의한 액션 --------------------------------
                        Epsilon_Random = randi(length(Action),1);
                        K = Random_Action(Epsilon_Random);
                        Reward = ((max((LevelTable.Gaussian_Grid(i)-(50*Action(K))),0)*LevelTable.State_Cost(i)) + ((50*Action(K))*Vehicle_Cost));
                        Immediately_Reward(i,1) = Reward;
                        Q_Table(j,K) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),K)))) + (alpha*(Reward + (gamma*(min(table2array(Q_Table(LevelTable.State(i+1),:))))))));
                        % disp("epsilon")
                        % disp(Q_Table(j,K))
                        Q_Table_3D(:,:,i+1) = 0;
                        if table2array(Q_Table(j,K)) ~= Q_Table_3D(j,K,i+1)
                            Q_Table_3D(j,K,i+1) = table2array(Q_Table(j,K));
                        end
                    end
                % end
            end
        end
    end
end
% for i = 1:length(LevelTable.Gaussian_Grid) - 2
%     for j = 1:length(Q_Table.Row)
%         if LevelTable.State(i) == cell2mat(Q_Table.Row(j))
%             if rand < (1-epsilon) %1-입실론 그리디에 의한 액션
%                 E = find(min(table2array(Q_Table(j,:))) == table2array(Q_Table(j,:)));
% %                 Next_E = find(min(table2array(Q_Table(LevelTable.State(i+1),:))) == table2array(Q_Table(LevelTable.State(i+1),:)));
%                 if length(E) == 1 %현재 스테이트의 최솟값이 하나일 때
%                     [J,K] = min(table2array(Q_Table(j,:)));
%                     Reward = ((max((LevelTable.Gaussian_Grid(i)-(50*Action(K))),0)*LevelTable.State_Cost(i)) + ((50*Action(K))*Vehicle_Cost));
%                     Immediately_Reward(i,1) = Reward;
% %                     if length(Next_E) == 1 %다음 스테이트의 액션 구하기(최솟값이 하나)
% %                         [Next_J,Next_K] = min(table2array(Q_Table(LevelTable.State(i+1),:)));
%                     Q_Table(j,K) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),K)))) + (alpha*(Reward + (gamma*min(table2array(Q_Table(LevelTable.State(i+1),:)))))));                    
%                     Q_Table_3D(:,:,i+1) = 0;
%                     if table2array(Q_Table(j,K)) ~= Q_Table_3D(j,K,i+1)
%                         Q_Table_3D(j,K,i+1) = table2array(Q_Table(j,K));
%                     end
% %                     else %다음 스테이트의 액션 구하기(최솟값이 여러개일 때 그 중 랜덤으로)
% %                         Next_random_min = randi(length(Next_E),1);
% %                         Next_K = Next_E(Next_random_min);
% %                         Q_Table(j,K) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),K)))) + (alpha*(Reward + (gamma*(table2array(Q_Table(LevelTable.State(i+1),Next_K)))))));                    
% %                         Q_Table_3D(:,:,i+1) = 0;
% %                         if table2array(Q_Table(j,K)) ~= Q_Table_3D(j,K,i+1)
% %                             Q_Table_3D(j,K,i+1) = table2array(Q_Table(j,K));
% %                         end
% %                     end
%                 else %현재 스테이트의 최솟값이 여러개일 때
%                     random_min = randi(length(E),1);
%                     K = E(random_min);
%                     Reward = ((max((LevelTable.Gaussian_Grid(i)-(50*Action(K))),0)*LevelTable.State_Cost(i)) + ((50*Action(K))*Vehicle_Cost));
%                     Immediately_Reward(i,1) = Reward;
%                     if length(Next_E) == 1
%                         [Next_J,Next_K] = min(table2array(Q_Table(LevelTable.State(i+1),:)));
%                         Q_Table(j,K) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),K)))) + (alpha*(Reward + (gamma*(table2array(Q_Table(LevelTable.State(i+1),Next_K)))))));                    
%                         Q_Table_3D(:,:,i+1) = 0;
%                         if table2array(Q_Table(j,K)) ~= Q_Table_3D(j,K,i+1)
%                             Q_Table_3D(j,K,i+1) = table2array(Q_Table(j,K));
%                         end
%                     else
%                         Next_random_min = randi(length(Next_E),1);
%                         Next_K = Next_E(Next_random_min);
%                         Q_Table(j,K) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),K)))) + (alpha*(Reward + (gamma*(table2array(Q_Table(LevelTable.State(i+1),Next_K)))))));                    
%                         Q_Table_3D(:,:,i+1) = 0;
%                         if table2array(Q_Table(j,K)) ~= Q_Table_3D(j,K,i+1)
%                             Q_Table_3D(j,K,i+1) = table2array(Q_Table(j,K));
%                         end
%                     end
%                 end
%             else %입실론 그리디에 의한 액션 -----------다음 스테이트도 입실론(0.1)의 확률(현재 액션과 같은)로 액션함 --> 랜덤으로만 움직임
%                 Epsilon_random = randi(length(Action),1);
%                 Epsilon_K = Random_Action(Epsilon_random);
%                 Next_Epsilon_random = randi(length(Action),1);
%                 Next_Epsilon_K = Random_Action(Next_Epsilon_random);
%                 Reward = ((max((LevelTable.Gaussian_Grid(i)-(50*Action(Epsilon_K))),0)*LevelTable.State_Cost(i)) + ((50*Action(Epsilon_K))*Vehicle_Cost));
%                 Immediately_Reward(i,1) = Reward;
%                 Q_Table(j,Epsilon_K) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),Epsilon_K)))) + (alpha*(Reward + (gamma*((table2array(Q_Table(LevelTable.State(i+1),Next_Epsilon_K))))))));
%                 Q_Table_3D(:,:,i+1) = 0;
%                 if table2array(Q_Table(j,Epsilon_K)) ~= Q_Table_3D(j,Epsilon_K,i+1)
%                     Q_Table_3D(j,Epsilon_K,i+1) = table2array(Q_Table(j,Epsilon_K));
%                 end
%             end
%         end
%     end
% end

% 하루치의 Reward값을 더한 변수, 마지막 하루는 포함X 
for i = 1:fix(length(Immediately_Reward)/24)-1
%     if mod(length(Immediately_Reward),24) ~= 0
        Year_Reward(i,1) = sum(Immediately_Reward(((24*(i-1))+1):(24*i)));
%         if i == fix(length(Immediately_Reward)/24)
%             Year_Reward((fix(length(Immediately_Reward)/24))+1,1) = sum(Immediately_Reward(24*(fix(length(Immediately_Reward))/24):length(Immediately_Reward)));
%         end
%     end
end

% Q값 추적 ----------------------------------------------------------------

LL0 = Q_Table_3D(1,:,:);
LL1 = Q_Table_3D(2,:,:);
LL2 = Q_Table_3D(3,:,:);
LL3 = Q_Table_3D(4,:,:);
LL4 = Q_Table_3D(5,:,:);
LL5 = Q_Table_3D(6,:,:);
LM0 = Q_Table_3D(7,:,:);
LM1 = Q_Table_3D(8,:,:);
LM2 = Q_Table_3D(9,:,:);
LM3 = Q_Table_3D(10,:,:);
LM4 = Q_Table_3D(11,:,:);
LM5 = Q_Table_3D(12,:,:);
LH0 = Q_Table_3D(13,:,:);
LH1 = Q_Table_3D(14,:,:);
LH2 = Q_Table_3D(15,:,:);
LH3 = Q_Table_3D(16,:,:);
LH4 = Q_Table_3D(17,:,:);
LH5 = Q_Table_3D(18,:,:);
ML0 = Q_Table_3D(19,:,:);
ML1 = Q_Table_3D(20,:,:);
ML2 = Q_Table_3D(21,:,:);
ML3 = Q_Table_3D(22,:,:);
ML4 = Q_Table_3D(23,:,:);
ML5 = Q_Table_3D(24,:,:);
MM0 = Q_Table_3D(25,:,:);
MM1 = Q_Table_3D(26,:,:);
MM2 = Q_Table_3D(27,:,:);
MM3 = Q_Table_3D(28,:,:);
MM4 = Q_Table_3D(29,:,:);
MM5 = Q_Table_3D(30,:,:);
MH0 = Q_Table_3D(31,:,:);
MH1 = Q_Table_3D(32,:,:);
MH2 = Q_Table_3D(33,:,:);
MH3 = Q_Table_3D(34,:,:);
MH4 = Q_Table_3D(35,:,:);
MH5 = Q_Table_3D(36,:,:);
HL0 = Q_Table_3D(37,:,:);
HL1 = Q_Table_3D(38,:,:);
HL2 = Q_Table_3D(39,:,:);
HL3 = Q_Table_3D(40,:,:);
HL4 = Q_Table_3D(41,:,:);
HL5 = Q_Table_3D(42,:,:);
HM0 = Q_Table_3D(43,:,:);
HM1 = Q_Table_3D(44,:,:);
HM2 = Q_Table_3D(45,:,:);
HM3 = Q_Table_3D(46,:,:);
HM4 = Q_Table_3D(47,:,:);
HM5 = Q_Table_3D(48,:,:);
HH0 = Q_Table_3D(49,:,:);
HH1 = Q_Table_3D(50,:,:);
HH2 = Q_Table_3D(51,:,:);
HH3 = Q_Table_3D(52,:,:);
HH4 = Q_Table_3D(53,:,:);
HH5 = Q_Table_3D(54,:,:);
% Random Q_Table만드는 코드 -----------------------------------------------
random_q_table = array2table(table2array(Q_Table));

for i = 1:length(LevelTable.Gaussian_Grid) - 2
    for j = 1:length(Q_Table.Row)
        if LevelTable.State(i) == cell2mat(Q_Table.Row(j))
            random_k = randi(5,1);
            random_reward = ((max((LevelTable.Gaussian_Grid(i)-(50*Action(random_k))),0)*LevelTable.State_Cost(i)) + ((50*Action(random_k))*Vehicle_Cost));
            random_immediately_reward(i,1) = random_reward;
            random_q_table(j,random_k) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),random_k)))) + (alpha*(Reward + (gamma*(min(table2array(Q_Table(LevelTable.State(i+1),:))))))));                    
        end
    end
end

for i = 1:fix(length(random_immediately_reward)/24)-1
    random_year_reward(i,1) = sum(random_immediately_reward(((24*(i-1))+1):(24*i)));
end

% [m,n,p] = size(LL0)
% B = reshape(LL0, m*n, p);
% B = B';
% plot(B,'o')


subplot(121), plot(Year_Reward)
subplot(122), plot(random_year_reward)

