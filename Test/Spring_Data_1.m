function [Spring_Data,LT] = Spring_data(i)
    % i = 몇 년치의 데이터를 만들 건지. j = 월 k = 일 l = 시
    Month = []; %Month 0 by 0 행렬 만들기
    Grid = [];
    LT = []; %Load Time
    
    Time = ["L" "M" "H"];
    % Time(1) = "L";     %Light Load Time
    % Time(2) = "M";  %Middle Load Time
    % Time(3) = "H";    %Peak Load Time
    
    y = 2021;   %시작 년도
    % i = 1;      %i 년치 데이터 만들기
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
                            % if l<9;                   %Low
                            %     lt(l+1,1) = Time(1);
                            % elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                            %     lt(l+1,1) = Time(2);
                            % elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                            %     lt(l+1,1) = Time(3);
                            % elseif l>=23;              %Low
                            %     lt(l+1,1) = Time(1);
                            % end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day,Month);
                        % LT = vertcat(lt,LT);
                    end
                %윤년의 1~7월 중 홀수 월
                elseif mod(j,2) == 1;
                    % 봄
                    if j/3>=1 & j/3<2
                        for k = 1:31;
                            for l = 00:23;
                                time = datetime(y + i,j,k,l,00,00);
                                Day(l+1,1) = time;
                                % if l<9;
                                %     lt(l+1,1) = Time(1);
                                % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                                %     lt(l+1,1) = Time(2);
                                % elseif (l>=10&l<12) | (l>=13&l<17);
                                %     lt(l+1,1) = Time(3);
                                % elseif l>=23;
                                %     lt(l+1,1) = Time(1);
                                % end
                            end
                            Day = flipud(Day);
                            Month = vertcat(Day, Month);
                            % LT = vertcat(lt,LT);
                        end
                    %여름
                    elseif j/3>=2
                        for k = 1:31;
                            for l = 00:23;
                                time = datetime(y + i,j,k,l,00,00);
                                Day(l+1,1) = time;
                                % if l<9;
                                %     lt(l+1,1) = Time(1);
                                % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                                %     lt(l+1,1) = Time(2);
                                % elseif (l>=10&l<12) | (l>=13&l<17);
                                %     lt(l+1,1) = Time(3);
                                % elseif l>=23;
                                %     lt(l+1,1) = Time(1);
                                % end
                            end
                            Day = flipud(Day);
                            Month = vertcat(Day, Month);
                            % LT = vertcat(lt,LT);
                        end
                    %겨울
                    else
                        for k = 1:31;
                            for l = 00:23;
                                time = datetime(y + i,j,k,l,00,00);
                                Day(l+1,1) = time;
                                % if l<9;
                                %     lt(l+1,1) = Time(1);
                                % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                                %     lt(l+1,1) = Time(2);
                                % elseif (l>=10&l<12) | (l>=13&l<17);
                                %     lt(l+1,1) = Time(3);
                                % elseif l>=23;
                                %     lt(l+1,1) = Time(1);
                                % end
                            end
                            Day = flipud(Day);
                            Month = vertcat(Day, Month);
                            % LT = vertcat(lt,LT);
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
                                % if l<9;
                                %     lt(l+1,1) = Time(1);
                                % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                                %     lt(l+1,1) = Time(2);
                                % elseif (l>=10&l<12) | (l>=13&l<17);
                                %     lt(l+1,1) = Time(3);
                                % elseif l>=23;
                                %     lt(l+1,1) = Time(1);
                                % end
                            end
                            Day = flipud(Day);
                            Month = vertcat(Day, Month);
                            % LT = vertcat(lt,LT);
                        end
                    %여름 
                    elseif j/3>=2
                        for k = 1:30;
                            for l = 00:23;
                                time = datetime(y + i,j,k,l,00,00);
                                Day(l+1,1) = time;
                                % if l<9;
                                %     lt(l+1,1) = Time(1);
                                % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                                %     lt(l+1,1) = Time(2);
                                % elseif (l>=10&l<12) | (l>=13&l<17);
                                %     lt(l+1,1) = Time(3);
                                % elseif l>=23;
                                %     lt(l+1,1) = Time(1);
                                % end
                            end
                            Day = flipud(Day);
                            Month = vertcat(Day, Month);
                            % LT = vertcat(lt,LT);
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
                        % if l<9;
                        %     lt(l+1,1) = Time(1);
                        % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                        %     lt(l+1,1) = Time(2);
                        % elseif (l>=10&l<12) | (l>=13&l<17);
                        %     lt(l+1,1) = Time(3);
                        % elseif l>=23;
                        %     lt(l+1,1) = Time(1);
                        % end
                    end
                    Day = flipud(Day);                       %Day행렬을 위아래 반대로 뒤집음
                    Month = vertcat(Day, Month);             %Month를 '월' 단위 행렬로 만듬
                    % LT = vertcat(lt,LT);
                end
            %1~7월 중 홀수 월
            elseif mod(j,2) == 1;
                %봄
                if j/3>=1 & j/3<2
                    for k = 1:31;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            % if l<9;
                            %     lt(l+1,1) = Time(1);
                            % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            %     lt(l+1,1) = Time(2);
                            % elseif (l>=10&l<12) | (l>=13&l<17);
                            %     lt(l+1,1) = Time(3);
                            % elseif l>=23;
                            %     lt(l+1,1) = Time(1);
                            % end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        % LT = vertcat(lt,LT);
                    end
                %여름
                elseif j/3>=2
                    for k = 1:31;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            % if l<9;
                            %     lt(l+1,1) = Time(1);
                            % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            %     lt(l+1,1) = Time(2);
                            % elseif (l>=10&l<12) | (l>=13&l<17);
                            %     lt(l+1,1) = Time(3);
                            % elseif l>=23;
                            %     lt(l+1,1) = Time(1);
                            % end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        % LT = vertcat(lt,LT);
                    end
                %겨울
                else
                    for k = 1:31;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            % if l<9;
                            %     lt(l+1,1) = Time(1);
                            % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            %     lt(l+1,1) = Time(2);
                            % elseif (l>=10&l<12) | (l>=13&l<17);
                            %     lt(l+1,1) = Time(3);
                            % elseif l>=23;
                            %     lt(l+1,1) = Time(1);
                            % end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        % LT = vertcat(lt,LT);
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
                            % if l<9;
                            %     lt(l+1,1) = Time(1);
                            % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            %     lt(l+1,1) = Time(2);
                            % elseif (l>=10&l<12) | (l>=13&l<17);
                            %     lt(l+1,1) = Time(3);
                            % elseif l>=23;
                            %     lt(l+1,1) = Time(1);
                            % end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        % LT = vertcat(lt,LT);
                    end
                %여름
                elseif j/3>=2
                    for k = 1:30;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            % if l<9;
                            %     lt(l+1,1) = Time(1);
                            % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            %     lt(l+1,1) = Time(2);
                            % elseif (l>=10&l<12) | (l>=13&l<17);
                            %     lt(l+1,1) = Time(3);
                            % elseif l>=23;
                            %     lt(l+1,1) = Time(1);
                            % end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        % LT = vertcat(lt,LT);
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
                            % if l<9;
                            %     lt(l+1,1) = Time(1);
                            % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            %     lt(l+1,1) = Time(2);
                            % elseif (l>=10&l<12) | (l>=13&l<17);
                            %     lt(l+1,1) = Time(3);
                            % elseif l>=23;
                            %     lt(l+1,1) = Time(1);
                            % end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        % LT = vertcat(lt,LT);
                    end
                elseif j/4>2 & j/4<3      %10월
                    for k = 1:31;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            % if l<9;
                            %     lt(l+1,1) = Time(1);
                            % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            %     lt(l+1,1) = Time(2);
                            % elseif (l>=10&l<12) | (l>=13&l<17);
                            %     lt(l+1,1) = Time(3);
                            % elseif l>=23;
                            %     lt(l+1,1) = Time(1);
                            % end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        % LT = vertcat(lt,LT);
                    end
                elseif j/4==3     %12월
                    for k = 1:31;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            % if l<9;
                            %     lt(l+1,1) = Time(1);
                            % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            %     lt(l+1,1) = Time(2);
                            % elseif (l>=10&l<12) | (l>=13&l<17);
                            %     lt(l+1,1) = Time(3);
                            % elseif l>=23;
                            %     lt(l+1,1) = Time(1);
                            % end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        % LT = vertcat(lt,LT);
                    end
                end
            %홀수 월(9,11)
            elseif mod(j,2) ==1;
                if j/3==3      %9월
                    for k = 1:30;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            % if l<9;
                            %     lt(l+1,1) = Time(1);
                            % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            %     lt(l+1,1) = Time(2);
                            % elseif (l>=10&l<12) | (l>=13&l<17);
                            %     lt(l+1,1) = Time(3);
                            % elseif l>=23;
                            %     lt(l+1,1) = Time(1);
                            % end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        % LT = vertcat(lt,LT);
                    end
                elseif j/3>3
                    for k = 1:30;
                        for l = 00:23;
                            time = datetime(y + i,j,k,l,00,00);
                            Day(l+1,1) = time;
                            % if l<9;
                            %     lt(l+1,1) = Time(1);
                            % elseif (l>=9&l<10) | (l>=12&l<13) | (l>=17&l<23);
                            %     lt(l+1,1) = Time(2);
                            % elseif (l>=10&l<12) | (l>=13&l<17);
                            %     lt(l+1,1) = Time(3);
                            % elseif l>=23;
                            %     lt(l+1,1) = Time(1);
                            % end
                        end
                        Day = flipud(Day);
                        Month = vertcat(Day, Month);
                        % LT = vertcat(lt,LT);
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
            Gaussian_Grid(i) = normrnd(50,10);
            if Gaussian_Grid(i) < 1 
                Gaussian_Grid(i) = 0;
            elseif Gaussian_Grid(i) > 300
                Gaussian_Grid(i) = 300;
            end
        elseif Load_Time(i).startsWith(pattern2) == 1
            Gaussian_Grid(i) = normrnd(150,10);
            if Gaussian_Grid(i) < 1 
                Gaussian_Grid(i) = 0;
            elseif Gaussian_Grid(i) > 300
                Gaussian_Grid(i) = 300;
            end
        elseif Load_Time(i).startsWith(pattern3) == 1
            Gaussian_Grid(i) = normrnd(250,10);
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
        if Gaussian_Grid(m)<100
            Level(m) = "0";
        elseif Gaussian_Grid(m)>=100 && Gaussian_Grid(m)<200
            Level(m) = "1";
        elseif Gaussian_Grid(m)>=200 && Gaussian_Grid(m)<300
            Level(m) = "2";
        end
    end
    
    Level = Level';

    for m = 1:m
        if Gaussian_Grid(m)<100
            State_Level(1) = "0";
        elseif Gaussian_Grid(m)>=100 && Gaussian_Grid(m)<200
            State_Level(2) = "1";
        elseif Gaussian_Grid(m)>=200 && Gaussian_Grid(m)<=300
            State_Level(3) = "2";
        end
    end
    
    State_Level = State_Level';                 %State_Level = 0~5 레벨
    State_Level = num2str(State_Level);  

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
end