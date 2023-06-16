function Winter_Data = Winter_Data(i)   
    % i = 몇 년치의 데이터를 만들 건지. j = 월 k = 일 l = 시
    Month = []; %Month 0 by 0 행렬 만들기
    Grid = [];
    LT = []; %Load Time
    
    Time = ["L" "M" "H"];
    % Time(1) = "L";     %Light Load Time
    % Time(2) = "M";  %Middle Load Time
    % Time(3) = "H";    %Peak Load Time
    
    y = 2021;   %시작 년도
    i = 1;      %i 년치 데이터 만들기
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
                            if l<9;                   %Low
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                                lt(l+1,1) = Time(3);
                            elseif l>=23;              %Low
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
                                if l<9;                   %Low
                                    lt(l+1,1) = Time(1);
                                elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                                    lt(l+1,1) = Time(2);
                                elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                                    lt(l+1,1) = Time(3);
                                elseif l>=23;              %Low
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
                                if l<9;                   %Low
                                    lt(l+1,1) = Time(1);
                                elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                                    lt(l+1,1) = Time(2);
                                elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                                    lt(l+1,1) = Time(3);
                                elseif l>=23;              %Low
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
                                elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);
                                    lt(l+1,1) = Time(2);
                                elseif (l>=10&l<12) | (l>=17&l<20) | (l>=22&l<23);
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
                                if l<9;                   %Low
                                    lt(l+1,1) = Time(1);
                                elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                                    lt(l+1,1) = Time(2);
                                elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                                    lt(l+1,1) = Time(3);
                                elseif l>=23;              %Low
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
                                if l<9;                   %Low
                                    lt(l+1,1) = Time(1);
                                elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                                    lt(l+1,1) = Time(2);
                                elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                                    lt(l+1,1) = Time(3);
                                elseif l>=23;              %Low
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
                        elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);
                            lt(l+1,1) = Time(2);
                        elseif (l>=10&l<12) | (l>=17&l<20) | (l>=22&l<23);
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
                            if l<9;                   %Low
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                                lt(l+1,1) = Time(3);
                            elseif l>=23;              %Low
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
                            if l<9;                   %Low
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                                lt(l+1,1) = Time(3);
                            elseif l>=23;              %Low
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
                            elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&l<12) | (l>=17&l<20) | (l>=22&l<23);
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
                            if l<9;                   %Low
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                                lt(l+1,1) = Time(3);
                            elseif l>=23;              %Low
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
                            if l<9;                   %Low
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                                lt(l+1,1) = Time(3);
                            elseif l>=23;              %Low
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
                            if l<9;                   %Low
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                                lt(l+1,1) = Time(3);
                            elseif l>=23;              %Low
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
                            if l<9;                   %Low
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                                lt(l+1,1) = Time(3);
                            elseif l>=23;              %Low
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
                            elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&l<12) | (l>=17&l<20) | (l>=22&l<23);
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
                            if l<9;                   %Low
                                lt(l+1,1) = Time(1);
                            elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);  %Middle
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&&l<12) || (l>=17&&l<20) || (l>=22&&l<23) %High
                                lt(l+1,1) = Time(3);
                            elseif l>=23;              %Low
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
                            elseif (l>=9&l<10) | (l>=12&l<17) | (l>=20&l<22);
                                lt(l+1,1) = Time(2);
                            elseif (l>=10&l<12) | (l>=17&l<20) | (l>=22&l<23);
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
    
    Winter_Data = flipud(Month);
end